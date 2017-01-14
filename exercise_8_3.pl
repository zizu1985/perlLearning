use strict;
use warnings;

=begin GOAL

Given the following text with dates embedded in the YYYY-MM-DD format, write code that can
rewrite them as $monthname $day,$year. For example, 2011-02-03should become February
3, 2011. Assume the dates are valid (in other words, not January 40th or something stupid like
that).

my $text = <<’END’;
We hired Mark in 2011-02-03. He’s working on product
1034-34-345A. He is expected to fi nish the work on or
before 2012-12-12 because our idiot CEO thinks the world
will end.
END

=end GOAL
=cut

 
my $text = <<'END';
We hired Mark in 2011-02-03. He’s working on product
1034-34-345A. He is expected to fi nish the work on or
before 2012-12-12 because our idiot CEO thinks the world

will end. 2014-10-20/.
END

my %number_to_month =
(
	'1' => 'January',
	'2' => 'February',
	'3' => 'March',
	'4' => 'April',
	'5' => 'May',
	'6' => 'June',
	'7' => 'July',
	'8' => 'August',
	'9' => 'September',
	'10' => 'October',
	'11' => 'November',
	'12' => 'December',
);

my $regex = qr/\b(?<year>[[:digit:]]{4})-(?<month>[[:digit:]]{2})-(?<day>[[:digit:]]{2})\b/;

my $newDate="";
my $month="";
my $day="";
my $year="";


sub count_NEWLINE {
	
	
	my ($text) = @_;
	my $cnt = 0;
	
	$cnt++ while ( $text =~ /\n/g);
	
	return $cnt;
	
}


# Remove black lines
$text =~ s/^\s*$//mg;
$text =~ s/\n\n+/\n/mg;

while ( $text =~ /$regex/g ) {
	
	$month = $+{month};
	$day = $+{day};
	$year = $+{year};
	
	
	$month =~ s/^0//;
	$day =~ s/^0//;
	
	$newDate = "$number_to_month{$month} $day, $year" ;
	print $newDate."\n";
}


