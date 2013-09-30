#!/usr/bin/perl -w

use JSON::XS;

my $hash = {
    Person    => {
    	name	=> 'JimmyBob',
    	id		=> 1,
    	email	=> 'jimmy@bob.com'
    	PhoneNumber	=> [
    		{
    			number 	=> '+1 111-555-1212',
    			type	=> 'MOBILE',
    		}
    	]
     }
};

warn JSON::XS::encode_json($hash); 
