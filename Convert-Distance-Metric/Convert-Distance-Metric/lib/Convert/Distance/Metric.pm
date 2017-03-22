package Convert::Distance::Metric;

use 5.006;
use strict;
use warnings;
use Exporter 'import';
use Scalar::Util qw(looks_like_number);
use Carp qw(croak);

=head1 NAME
	Convert::Distance::Metric - Module offers simple kilometers from/to meters conversion
=head1 VERSION
	Version 0.01
=cut

our $VERSION = '0.01';
$VERSION = eval $VERSION;

use constant METERS_PER_KILOMETER => 1000;

our @EXPORT_OK = qw(
	kilometers_to_meters
	meters_to_kilometers
);

our %EXPORT_TAGS = ( 'all' => \@EXPORT_OK );

=head1 SYNOPSIS

    use Convert::Distance::Metric ":all";

    my $meters = kilometers_to_meters(2.8);
    print $meters;
    
=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=cut 

sub _validate {
	my ($input) = @_;
	if ($input < 0 || !looks_like_number($input)) {
		croak "Parameter has to be number";
	}
}

=head2 kilometers_to_meters
	Converts kilometers per meters 
=cut

sub kilometers_to_meters {
	my ($input) = @_;
	_validate($input);
	return $input * METERS_PER_KILOMETER;
}

=head2 meters_to_kilometers 
	Converts meters to kilometers
=cut

sub meters_to_kilometers {
	my ($input) = @_;
	_validate($input);
	return $input / METERS_PER_KILOMETER;
}

=head1 AUTHOR

Tomasz Ziss, C<< <tziss85 at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-convert-distance-metric at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Convert-Distance-Metric>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Convert::Distance::Metric


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Convert-Distance-Metric>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Convert-Distance-Metric>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Convert-Distance-Metric>

=item * Search CPAN

L<http://search.cpan.org/dist/Convert-Distance-Metric/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2017 Tomasz Ziss.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Convert::Distance::Metric
