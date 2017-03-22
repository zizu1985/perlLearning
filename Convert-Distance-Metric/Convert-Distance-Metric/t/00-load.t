#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'Convert::Distance::Metric' ) || print "Bail out!\n";
    use_ok( 'Test::More' ) || print "Bail out!\n";
}

diag( "Testing Convert::Distance::Metric & Test::More , Perl $], $^X" );
