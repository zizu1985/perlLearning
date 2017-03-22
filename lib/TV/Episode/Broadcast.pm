package TV::Episode::Broadcast;
use Moose;
use namespace::autoclean;
use DateTime;
extends 'TV::Episode';

has broadcast_date => ( is => 'ro', isa => 'DateTime', required => 1, default => sub { DateTime->now } );

__PACKAGE__->meta->make_immutable;
1;