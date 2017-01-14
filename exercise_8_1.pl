use strict;
use warnings;

my $text = <<'END';
	My social security is 123-23-1232 as example.
	Not valid is 1233-231-231 .
	Other is 123-23-2222 . Other is 123-23-3333.
	a999-23-2222.
	888-23-2311ddd
END

my $SSN_regexp = qr/\b[[:digit:]]{3}-[[:digit:]]{2}-[[:digit:]]{4}\b/;

while ($text =~ /(?<SSN>$SSN_regexp)/g) {
	print $+{SSN}." is valid SSN number \n";
}



