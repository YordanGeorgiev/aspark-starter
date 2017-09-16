package ASparkStarter::App::Db::In::DbReadersFactory ; 

	use strict; use warnings;
	
	use Data::Printer ; 
	

	our $appConfig 		= {} ; 
	our $db_type			= 'postgres' ; 
	our $objItem			= {} ; 
	our $objController 	= {} ; 
   our $objLogger       = {} ; 

	# use ASparkStarter::App::Db::DbReaderMariaDb  ; 
   use ASparkStarter::App::Db::In::DbReaderPostgres ; 

	#
	# -----------------------------------------------------------------------------
	# fabricates different DbReader object 
	# -----------------------------------------------------------------------------
	sub doInstantiate {

		my $self 			= shift ; 	
		my $db_type			= shift // $db_type ; # the default is mysql

		my @args 			= ( @_ ) ; 
		my $DbReader 		= {}   ; 

		# get the application cnfiguration hash
		# global app cnfig hash

		if ( $db_type eq 'mariadb' ) {
			$DbReader 				= 'DbReaderMariaDb' ; 
		}
		if ( $db_type eq 'postgre' ) {
			$DbReader 				= 'DbReaderPostgres' ; 
		}
		else {
			# future support for different RDBMS 's should be added here ...
			$DbReader 				= 'DbReaderMariaDb' ; 
		}

		my $package_file     	= "ASparkStarter/App/Db/In/$DbReader.pm";
		my $objDbReader   		= "ASparkStarter::App::Db::In::$DbReader";

		require $package_file;

		return $objDbReader->new( \$appConfig , $objController , @args);
	}
	# eof sub doInstantiate
	

   #
	# -----------------------------------------------------------------------------
	# the constructor 
	# -----------------------------------------------------------------------------
	sub new {

		my $invocant 			= shift ;    
		$appConfig     = ${ shift @_ } || { 'foo' => 'bar' ,} ; 
      $objController       = shift ; 
		
      # might be class or object, but in both cases invocant
		my $class = ref ( $invocant ) || $invocant ; 

		my $self = {};        # Anonymous hash reference holds instance attributes
		bless( $self, $class );    # Say: $self is a $class
      $self = $self->doInitialize() ; 
		return $self;
	}  
	#eof const
	
   #
	# --------------------------------------------------------
	# intializes this object 
	# --------------------------------------------------------
   sub doInitialize {
      my $self = shift ; 

      %$self = (
           appConfig => $appConfig
      );

	   $objLogger 			= 'ASparkStarter::App::Utils::Logger'->new( \$appConfig ) ;


      return $self ; 
	}	
	#eof sub doInitialize

1;


__END__
