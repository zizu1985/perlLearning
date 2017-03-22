package PersonMoose;
use Moose;
use namespace::autoclean;
use MooseX::StrictConstructor;
use MooseX::SemiAffordanceAccessor;
use Moose::Util::TypeConstraints;

our $VERSION = '0.1';

subtype 'Adult',
		as 'DateTime',
		where {
			my $now = DateTime->now; 
			my $duration = $now -  $_;
			$duration->years > 18
		},
		message { "$_ is under 18 years! We only accept adult person." };

has 'name' => (is => 'ro', isa => 'Str' , writer => '_set_name', reader => 'get_name', required => 1);
has 'birthday' => (is => 'ro', isa => 'DateTime' , writer => '_set_birthday', reader => 'get_birthday', required => 1, default => sub { return DateTime->now; } );

sub age {
	my ($self) = @_;
	my $now = DateTime->now;
	my $duration = $now - $self->get_birthday;
	return $duration->years;
}

sub as_string {
	my ($self) = @_;
	my @attributes = map { $_->name } $self->meta->get_all_attributes;
	my $as_string = ''; 
	foreach my $attr (@attributes) {
		my $method = "get_".$attr;
		$as_string .= sprintf "%-14s - %s\n", ucfirst($attr), $self->$method;
	} 
	return $as_string;
}

__PACKAGE__->meta->make_immutable;
1;