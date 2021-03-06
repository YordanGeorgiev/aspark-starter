package ASparkStarter::App::IO::Out::XlsWriter ; 

   use strict ; use warnings ; use utf8 ; 

   require Exporter; 
   use AutoLoader ; 
   use Encode qw( encode_utf8 is_utf8 );
   use POSIX qw(strftime);
   use Data::Printer ; 
   use Carp ; 
   use Excel::Writer::XLSX ; 
   use ASparkStarter::App::Utils::IO::FileHandler ; 
	use ASparkStarter::App::Utils::Logger ;
   use ASparkStarter::App::Utils::Timer ; 

   our $module_trace       = 0 ; 
   our $IsUnitTest         = 0 ; 
   our $appConfig          = {} ; 
   our $objLogger          = {} ; 
   our $objFileHandler     = {} ; 
   our $ProductInstanceDir = {} ; 


   #
   # ------------------------------------------------------
   # XlsWriter
   # builds and xls file into the xls dir 
   # from the passed hash ref of hashs refs by using the calling
   # sql script as a source for the xls file path to produce
   # src: http://search.cpan.org/~jmcnamara/Excel-Writer-XLSX/lib/Excel/Writer/XLSX.pm
   # ------------------------------------------------------
   sub doBuildXlsFromHashRef {

      my $self             = shift ; 
      my $hsr_meta         = shift ; 
      my $hsr              = shift ; 
      my $table            = shift ; 
      my $msg              = q{} ; 
      #debug ok p($hsr ) if $module_trace == 1 ; 
      
      my $objTimer = 'ASparkStarter::App::Utils::Timer'->new() ; 
	   my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = $objTimer->GetTimeUnits();
      my $nice_month  = "$year" . '-' . "$mon" ; 
      my $nice_datetime  = "$year" ."$mon". "$mday" . '_' . "$hour" . "$min" . "$sec" ; 
      my $nice_date  = "$year" . '-' . "$mon" . '-' . "$mday" ; 


      my $xls_file_name       = $ENV{'aspark_starter_project'} . '.' . $table . '.' . $nice_datetime ; 
      my $xls_dir = $appConfig->{ 'xls_dir' } || $ENV{'proj_daily_data_root_dir'} . "/$year/$nice_month/$nice_date" ; 
      $objFileHandler->MkDir ( "$xls_dir" ) ; 
      my $xls_file         = "$xls_dir/$xls_file_name" . '.xlsx' ; 

      $msg = 'START writing the xls file: ' ; $objLogger->doLogInfoMsg ( $msg ) ; 
      $msg = $xls_file ; $objLogger->doLogInfoMsg ( $msg ) ; 
 
      # Create a new Excel workbook
      my $objWorkbook      = 'Excel::Writer::XLSX'->new( $xls_file );
      my $sheet_name       = $xls_file_name ; 
      $sheet_name          = $table ; 
      my $objWorksheet     = $objWorkbook->add_worksheet( $sheet_name );


      # print the headers  
      my $nxt_colid = 1 ; 
      # the format tof the title row
      my $objFormat     =  $objWorkbook->add_format(
         'color' => 'black'
       , 'font'  => 'Lucida Console'
       , 'bold'  => '1'
      );

      foreach my $colid ( sort ( keys (  %{$hsr_meta->{ 'ColumnNames'}} ) ) ) {

         my $col_name      = $hsr_meta->{'ColumnNames'}->{ $colid }->{ 'attname' } ; 
         my $col_lenth     = $hsr_meta->{'ColumnNames'}->{ $colid }->{ 'attlen' } ; 
         $objWorksheet->write(0, $colid-2, $col_name , $objFormat )  unless $colid == 1 ; 

         # set the initial widh of the column as the width of the title column
         $hsr_meta->{'ColumnWidths'}->{ $colid } = $col_lenth ; 
         $hsr_meta->{ 'ColumnWidths' }->{ $colid } = 60 if $col_lenth > 60 ; 
         $nxt_colid++ ; 
      }
     
      # put the guid at the end
      $hsr_meta->{'ColumnNames'}->{ $nxt_colid }->{ 'attname' } = 'guid' ;  
      $hsr_meta->{ 'ColumnWidths' }->{ $nxt_colid } = 43 ; 
      $objWorksheet->write(0, $nxt_colid-2, 'guid' , $objFormat )  ; 

      my $rowid = 0 ; 
      foreach my $guid ( sort { $hsr->{$a}->{ 'seq' } <=> $hsr->{$b}->{ 'seq' } } keys (%$hsr))  {
      # foreach my $rowid ( sort ( keys ( %$hsr ) ) ) {

         my $objFormat        = {} ; 
         # $objFormat->set_autofit();
         # alternate colors
         if ( $rowid % 2 == 1 ) {
            $objFormat = $objWorkbook->add_format(
                'font'  => 'Lucida Console'
            );
            $objFormat->set_bg_color('silver') ; 
         }
         else {
            $objFormat = $objWorkbook->add_format(
                'font'  => 'Lucida Console'
            );
            $objFormat->set_bg_color('white') ; 
         }
          
         $objFormat->set_text_wrap();

         my $hsr_row = $hsr->{ "$guid" } ; 
         $rowid = $rowid+1 ; 


         foreach my $colid ( sort ( keys ( %{$hsr_meta->{'ColumnNames'}} ) ) ) {
            next if $colid == 1 ; # put the guid at the end
            my $col_name     = $hsr_meta->{'ColumnNames'}->{ $colid }->{ 'attname' } ; 

       
            my $cell_length = length ( $hsr_row->{ $col_name } ) || 10 ; 
            #define the max width 
            if ( $hsr_meta->{ 'ColumnWidths' }->{ $colid } < $cell_length ) {
               $hsr_meta->{ 'ColumnWidths' }->{ $colid } = $cell_length ;                
            }
            $hsr_meta->{ 'ColumnWidths' }->{ $colid } = 60 
               if $hsr_meta->{ 'ColumnWidths' }->{ $colid } > 60 ; 


            unless ( 
                  defined ( $hsr_row ) 
               or defined ( $hsr_row->{ $col_name } ) 
               or $hsr_row->{ $col_name } ne 'NULL' ) {
                  # p( $hsr_row );
                  $hsr_row->{ $col_name } = '' ; 
            }

            # to adjust the columns width debug as follows:
            # debug print "$col_name width is " . $hsr_meta->{ 'ColumnWidths' }->{ $colid } . "\n" ; 

            # $objWorksheet->set_column($colid, $colid, $hsr_meta->{ 'ColumnWidths' }->{ $colid } );
            $objWorksheet->set_column($colid, $colid-2, $hsr_meta->{ 'ColumnWidths' }->{ $colid } );
            $objWorksheet->write($rowid, $colid-2, $hsr_row->{ $col_name } , $objFormat )  ; 
         }
         
      } 
      #eof foreach row 
     
     
      $msg = 'STOP writing the xls file: ' ; $objLogger->doLogInfoMsg ( $msg ) ; 
      $msg = $xls_file ; $objLogger->doLogInfoMsg ( $msg ) ; 
      
      $rowid++ ; 
      return 0 if -f $xls_file ; 
   }
   #eof sub doBuildXlsFromHashRef

   

 
   # 
	# -----------------------------------------------------------------------------
	# the constructor 
	# -----------------------------------------------------------------------------
	sub new {

		my $class = shift;    # Class name is in the first parameter
		$appConfig = ${ shift @_ } || { 'foo' => 'bar' ,} ; 
		my $self = {};        # Anonymous hash reference holds instance attributes
		bless( $self, $class );    # Say: $self is a $class
      $self = $self->doInitialize();
		return $self;
	}  
	#eof const

   #
	# --------------------------------------------------------
	# intializes this object 
	# --------------------------------------------------------
   sub doInitialize {
      my $self          = shift ; 

      %$self = (
           appConfig => $appConfig
       );

      #debug print "XlsWriter::doInitialize appConfig : " . p($appConfig );
      $ProductInstanceDir   = $appConfig->{ 'ProductInstanceDir' } ; 

	   $objFileHandler   = 'ASparkStarter::App::Utils::IO::FileHandler'->new ( \$appConfig ) ; 
	   $objLogger 			= 'ASparkStarter::App::Utils::Logger'->new( \$appConfig ) ;

      return $self ; 
	}	
	#eof sub doInitialize




1;


__END__
