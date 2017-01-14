use warnings;
use strict;
use Wx;
use wxPerl::Constructors;

package MyApp;
 
use base 'Wx::App';
 
sub OnInit {
    my $self = shift;
  
    my $frame = Wx::Frame->new(
      undef,
      -1,
      'A wxPerl Application',
      &Wx::wxDefaultPosition,
      &Wx::wxDefaultSize,
      &Wx::wxMAXIMIZE_BOX | &Wx::wxCLOSE_BOX
    );
  
  	 my $button = wxPerl::Button->new($frame, 'Click Me');
  
    $frame->Centre();
    $frame->Show;
}
 
MyApp->new->MainLoop;
