use strict;
use warnings;
use v5.11;
use Plack::Builder;
use Plack::Request;
use Data::Dumper;

# Display GET 
builder {
	
	mount '/' => sub {
	
		my $env = shift;
		my $request = Plack::Request->new($env);				
		my $body = '';
						
		# parameters return Hash::MultiKey object
		foreach my $parameter (keys %{ $request->parameters }) {
			$body .= $parameter . ' : ' . join ',', $request->parameters->get_all($parameter) . "\n" ;	
		} 		
				
		$body = $body || 'No params found!';
		return [
			200,
			['ContentType' => 'text/plain'],
			[$body]
		];
	};
		
};

