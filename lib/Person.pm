package Person;
use v5.11;
use strict;
use warnings;
use DateTime;
use Carp qw(croak);
use Scalar::Util qw(looks_like_number);

our $VERSION = 0.9;
$VERSION = eval $VERSION;

sub new {
 	my ($class,$args_for) = @_;
 	my $self = bless {} => $class;
 	$self->_initialize($args_for);
 	return $self;
 }
 
sub _initialize {
	my ($self,$args_for) = @_;
	
	# argument passed by reference, so better to copy it
	my %args = %$args_for;
	
	
	my $name = delete $args{name};
	my $birthday = delete $args{birthday};
	$self->_set_name($name);
	$self->_set_birthday($birthday);
	
	# Only 2 parameters should be passed
	if ( join ",", keys %args ) {
		croak "Can't build Person object. More arguments passed then required";
	}
	
} 

sub _set_name {
	my ($self,$name) = @_;
	if ( !$name || !($name =~ /[[:alnum:]]+/) ) {
		croak "Name must have at least one notspace character";
	}
	$self->{name} = $name; 
}

sub _set_birthday {
	my ($self,$birth) = @_;
	my $now = DateTime->now;
		
	if ( ! $birth->isa('DateTime') ) {
		croak "Birthday has to be DateTime object";
	}

	if ( $birth > $now ) {
		croak "Birthday can't be newer than current time";
	}
		
	$self->{birthday} = $birth;
}

sub get_name { shift->{name};}
sub get_birthday { shift->{birthday};}

sub age { 
	my ($self) = @_;
	my $now = DateTime->now();
	my $birth = $self->{birthday};
	my $duration = $now - $birth;
	return $duration->years;
}



1;
