use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my $text = <<'END';
	Name: Alice Allison Age: 23
	Occupation: Spy
	Name: Bob Barkely Age: 45
	Occupation: Fry Cook
	Name: Carol Carson Age: 44
	Occupation: Manager
	Name: Prince Age: 53
	Occupation: World Class Musician
END

my %age_for;

foreach my $record (split /\n/ , $text) {
	if ($record =~ /Name:\s+(.*?)\s+Age:\s+([0-9]+)/ ) {
		$age_for{$1}=$2;	
	}
}

print Dumper(\%age_for);

%age_for=();

my $name_and_age = qr{
		Name:
		\s+ # 1 or more whitespace
		(.*?) # The name in $1
		\s+ # 1 or more whitespace
		Age:
		\s+ # 1 or more whitespace
		(\d+) # The age in $2
}x;

foreach my $line (split /\n/, $text) {
	if ( $line =~ $name_and_age ) {
		$age_for{$1} = $2;
	}
}

print Dumper(\%age_for);

print "#########################\n";
if ( "cat berfd dat kwewat" =~ /(\b\w+at\b)/g) {
	print "$1\n"; 
}

print "#########################\n";
while ( "cat berfd dat kwewat" =~ /(\b\w+at\b)/g) {
	print "$1\n";
}


