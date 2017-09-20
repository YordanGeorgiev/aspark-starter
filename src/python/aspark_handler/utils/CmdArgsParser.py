
# src: http://stackoverflow.com/a/7427376/65706
import argparse

def doParse():
    parser = argparse.ArgumentParser(description='A configurations generator from Google SpreadSheets by Futurice')
    parser.add_argument('-u','--url', help='The URI of the Google SpreadSheet', required=True)
    parser.add_argument('-w','--worksheet', help='The worksheet name', required=True)
        
    args = vars(parser.parse_args())
    
    return args

#eof def doParse:
