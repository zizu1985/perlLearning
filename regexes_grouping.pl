use strict;
use warnings;
use Data::Dumper;

my $text = <<'END';
Name: Alice Allison Position: VOLUNTEER
Name: Bob Barkely Position: Manager
Name: Carol Carson Position: Volunteer
Name: David Dark Position: Geek
Name: e.e. cummings Position: Volunteer
name: Fran Francis Position: volunteer
END

my @volunteers;

foreach my $line (split(/\n/,$text) ) {	
	if ($line =~ m{Name:\s+([[:alpha:] .]+?)\s+Position:\s+(?i:volunteer)\b}) {
		push @volunteers => $1;
	}
}

print Dumper(\@volunteers);

