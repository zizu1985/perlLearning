use strict;
use warnings;

use WWW::Mechanize;
use HTML::TableExtract;
use List::Util qw(min max sum);

use constant NO_CHARACTERS => 100;

my $url='http://127.0.0.1:5000/';
my $mech = WWW::Mechanize->new;
my $extractor = HTML::TableExtract->new;

# wczytaj strone, znajdz formularz, submit formularz
# wszytkie operacje modyfikuje obiekt
my (@strength,@intelligence,@health);

sub print_arr_info {
	
	my $aref = shift;
	my $max = max @$aref;
	my $min = min @$aref;
	my $avg = (sum @$aref)/@$aref;
	
	print "Strength MAX : $max MIN: $min AVG: $avg\n";
}
	

foreach my $i (1 .. NO_CHARACTERS) {

	my $res = $mech->get($url);
	
	unless ( $res->is_success ) {
		die $res->status_line;
	}
	
	$mech->follow_link( text_regex => qr/Click here/i );
	
	$mech->submit_form (
	form_name => "awesome",
	fields => {
		"name" => random_name(10),
		"profession" => 'programmer',
		"education" => 'Engineering',
		"birthplace" => 'earth'
		}	
	);
			
	$extractor->parse($mech->content);
	foreach my $table ($extractor->tables) {		
		foreach my $row ($table->rows) {			
			my $attribute = $row->[0];								
			if($attribute eq "Strength") {				
				push @strength, $row->[1];
			}
			if($attribute eq "Intelligence") {
				push @intelligence, $row->[1];
			}	
			if($attribute eq "Health") {
				push @health, $row->[1];
			}		
		}
	}
	
}


print_arr_info \@strength;
print_arr_info \@intelligence;
print_arr_info \@health;

sub random_name {
	my $len = shift;
	my @set = ('0' ..'9', 'A' .. 'Z');
	my $str = join '' => map $set[rand @set], 1 .. $len;
	return $str;	
}

