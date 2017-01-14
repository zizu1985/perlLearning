use strict;
use warnings;
use Regexp::Common;

my @strings = qw(
abba
abacus
abbba
babble
Barbarella
Yello
);

my @regexes = (
qr/ab?/,
qr/ab*/,
qr/ab+/,
);

foreach my $string (@strings) {
foreach my $regex (@regexes) {
if ( $string =~ $regex ) {
	print "'$regex' matches '$string'\n";
}
}
}

# Match digits
if ("Phone number is 123-1231-123" =~ /(\b[0-9]{3}-[0-9]{4}-[0-9]{3}\b)/ ) {
	print "Matched number $1\n";
} 

# Match digits
if ("234-1123-122 is mine phone number" =~ /(\b[[:digit:]]{3}-[[:digit:]]{4}-[[:digit:]]{3}\b)/ ) {
	print "Matched number $1\n";
} 

# Match all, but not digits
if ("234-1123-122 is mine phone number" =~ /(\b[[:digit:]]{3}-[[:digit:]]{4}-[[:digit:]]{3}\b)/ ) {
	print "Matched number $1\n";
} 

# Lookahead anchor
# matches
my $str="xxxyyyysdadxxxasssxxxyyy";
$str =~ s/(xxx)(?=yyy)/---/g;
print $str."\n";


# Named subexpression
my $text="29/2/2014";

$text =~ 
s{
	\b 
	(?<day>\d\d?)
	[/-]
	(?<month>\d\d?)
	[/-]
	(?<year>\d\d\d\d)	
}
{
	sprintf "$+{year}-%02d-%02d" , $+{month} , $+{day}; 
}xe;

print $text."\n";

my $int = -2e-12;
if ($int =~ $RE{num}{real} ) {
	print "$int is a number!\n";
}

