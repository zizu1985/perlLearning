use strict;
use warnings;
use diagnostics;
use List::Util 'shuffle';

my ( $WIDTH, $HEIGHT ) = ( 10, 10 );

my %OPPOSITE_OF = (
north => 'south',
south => 'north',
west => 'east',
east => 'west',
);

my @maze;

tunnel( 0, 0, \@maze );
print render_maze( \@maze );
exit;

sub tunnel {
	my ( $x, $y, $maze ) = @_;
	my @directions = shuffle keys %OPPOSITE_OF;
	foreach my $direction (@directions) {
		my ( $new_x, $new_y ) = ( $x, $y );
		if ( 'east' eq $direction ) { $new_x += 1; }
		elsif ( 'west' eq $direction ) { $new_x -= 1; }
		elsif ( 'south' eq $direction ) { $new_y += 1; }
		else { $new_y -= 1; }
	# if a previous tunnel() through the maze has not visited
	# the square, go there. This will replace the _ or |
	# character in the map with a space when rendered
		if ( have_not_visited( $new_x, $new_y, $maze ) ) {
	# make a two-way “path” between the squares
		$maze->[$y][$x]{$direction} = 1;
		$maze->[$new_y][$new_x]{$OPPOSITE_OF{$direction}}= 1;
	# This program will often recurse more than one
	# hundred levels deep and this is Perl’s default
	# recursion depth level prior to issuing warnings.
	# In this case, we’re telling Perl that we know
	# that we’ll exceed the recursion depth and to
	# not warn us about it
	no warnings 'recursion';
	tunnel( $new_x, $new_y, $maze );
	}
}
	# if we get to here, all squares surround the current square
	# have been visited or are “out of bounds”. When we return,
	# we may return to a previous tunnel() call while we’re
	# digging, or we return completely to the first tunnel()
	# call, in which case we’ve finished generating the maze.
	# This return is not strictly necessary, but it makes it
	# clear what we’re doing.
	return;
}

sub have_not_visited {
	my ( $x, $y, $maze ) = @_;
	# 	the first two lines return false if we’re out of bounds
	return if $x < 0 or $y < 0;
	return if $x > $WIDTH - 1 or $y > $HEIGHT - 1;
	# this returns false if we’ve already visited this cell
	return if $maze->[$y][$x];
	# return true
	return 1;
}

# creates the ASCII strings that will make up the maze
# when printed
sub render_maze {
	my $maze = shift;
	# $as_string is the string representation of the maze
	# start with a row of underscores:
	# _________________________________________
	my $as_string = "_" x ( 1 + $WIDTH * 2 );
	$as_string .= "\n";
	for my $y ( 0 .. $HEIGHT - 1 ) {
	# add the | vertical border at the left side
	$as_string .= "|";
	for my $x ( 0 .. $WIDTH - 1 ) {
		my $cell = $maze->[$y][$x];
	# if the neighbor is true - we have a path
	$as_string .= $cell->{south} ? " " : "_";
	$as_string .= $cell->{east} ? " " : "|";
	}
	$as_string .= "\n";
}
	return $as_string;
}

