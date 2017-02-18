use strict;
use warnings;
use autodie;
use Data::Dumper;
use feature "switch";
use File::Temp "tempfile";

open my $fh,'<','chapter_9/targets.txt';

my %spies;
my @fields;

my ($tmp, $tmpfile) = tempfile(TEMPLATE => 'tempXXXX');
print "Tempfile path is $tmpfile\n";


sub fill_spies_values {
	
	my ($key , $val) = @_;
	
	if ( not defined $spies{$key} ) {
		$spies{$key} = $val;		
	}
	else {
		given (ref  $spies{$key}) {
			when('') { 
				my $value = $spies{$key};
				@spies{$key} = ();
				push @{$spies{$key}} , $val;							
			}
			when('ARRAY') { 
				push @{$spies{$key}} , $val;					
			}
			default { die "Unexpected value."; }
		}			
	}
		
}

while ( <$fh> ) {
	
	# trail 
	chomp;
	next if ($_ =~ /\s*^#/); 
	
	@fields = split /\|/;
	
	fill_spies_values('name',$fields[0]);
	fill_spies_values('number',$fields[1]);
	fill_spies_values('description',$fields[2]);

	if ($_ =~ /agent/i) {
		print $tmp "$_";
	}
		
}

close $fh;


open $fh,'<','chapter_9/targets.txt';
my @lines;
@lines = <$fh>;
close $fh;

my $lines = scalar @lines;
print "Number of lines in file is $lines\n";
print Dumper(\%spies);

 
=begin
if (open my $fh,'<','links1.txt') {
	print "Failed opened";	
} 
else {
	die "$!";		
}
=end
=cut

=begin

autodie module automatically handle some file operations errors

use autodie;
open my $fh,'<','links1.txt';
print "Do sth with file";
=end
=cut

=begin

use autodie - automatycznie failuje jak 
	funkcja open zwróci false


=end
=cut

