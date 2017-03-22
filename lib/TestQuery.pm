package TestQuery;
use strict;
use warnings;
use URI::Escape 'uri_unescape';
use Encode 'decode_utf8';
use Exporter::NoWork;


# Example string "name=Tomasz&event=wakeup""

sub parse_query_string {
	my $query_string = shift;
	my @pairs = split /[&;]/ => $query_string;
	my %values_for;
	foreach my $pair (@pairs) {
	my ( $key, $value ) = split( /=/, $pair );
	$_ = decode_utf8( uri_unescape($_) ) for $key, $value;
	$values_for{$key} ||= [];
	push @{ $values_for{$key} } => $value;
	}
	return \%values_for;
}

1;