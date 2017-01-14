use strict;
use warnings;
use diagnostics;
use Regexp::Common;

my $num_re = $RE{num}{real};
my $var_re = qr/[[:upper:]][[:alnum:]_]*/;
my $op_re = qr{[-+*/%]};
my $math_term_re = qr/$num_re|$var_re/;

my $expression_re = qr/
$math_term_re
(?:
\s*
$op_re
\s*
$math_term_re
)*
/x;

my @expressions = (
'2 + 3',
' + 2 - 3',
' Var',
'-3.2e5 % SomeVar / Var',
'not_a_var + 2',
);

foreach my $expression (@expressions) {
if ( $expression =~ /^$expression_re$/ ) {
	print "($expression) is a valid expression\n";
}
else {
	print "($expression) is not a valid expression\n";
}
}

print "\n";
print $expression_re;