use strict;
use warnings;
use diagnostics;

use Scalar::Util qw(blessed);
use Log::Message::Simple;

#substr
sub printFirst4characters
{
	my ($input) = @_;	
	return substr($input,0,4);
}

printf "<%20s>", "sa";
printf "<%0s>", "33";

#print index "aabb" , "ab" , 0; 
print "\n";
my $output =  printFirst4characters "asasasa";
print "$output\n";

#translate operator
my $transstr = "Make my day bad.";
print $transstr;
$transstr =~ tr/bad/goo/;
print $transstr;

my $ho = "bla";
my @hor = ($ho) x 4;
print @hor;

my @range_not_empty = ('a' .. 'z');
my @range_empty = ('Z' .. 'A');
print @range_not_empty;
print "\n";
print @range_empty;

my $ada=12;
print -$ada;


# join 
print "\n";
my $res = join "-" , qw(a w d);
print $res;

