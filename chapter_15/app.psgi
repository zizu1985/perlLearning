use strict;
use warnings;

my $app = sub {
	my $env = shift;
	if ( $env->{PATH_INFO} eq '/Anne_frank.jpg' ) {
		open my $fh, "<:raw", "Anne_frank.jpg" or die $!;
		return [ 200, [ 'Content-Type' => 'image/jpeg' ], $fh ];
	}
	elsif ( $env->{PATH_INFO} eq '/' ) {
		return [
				200,
				[ 'Content-Type' => 'text/html' ],
				[ get_index() ]
		];
	}
	else {
		return [
			404,
			[ 'Content-Type' => 'text/html' ],
			[ '404 Not Found']
		];
	}
};

sub get_index {
	return <<'END';
	<html>
	<head><title>Sample page</title></head>
	<body>
	<p>Anne Frank was a young lady living in Amsterdam, hiding
	from the Nazis.</p>
	<p>Everyone should read her diaries.</p>
	<img src="/Anne_frank.jpg"/>
	</body>
	</html>
	END
}

