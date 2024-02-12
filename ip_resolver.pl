#!/usr/bin/perl 

use strict; 
no warnings;

use Net::DNS::Resolver;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');
system('color a');

print "\n\n"; 
print "========================================\n"; 
print "# Tool: IP resolver v1.0\n"; 
print "# Author: hearsecurity\n"; 
print "# Website: hearsectech.wordpress.com\n"; 
print "========================================\n"; 

sleep(2); 
print "\nEnter domain name -> "; 
my $ip_to_check = <STDIN>; 
chomp($ip_to_check); 

my $res = Net::DNS::Resolver->new;
my $name = $ip_to_check; 
my $q = $res->query($name);

if ($q){
  
    for ($q->answer){
    	if($_->type eq 'A') {
           print "\nThe hostname ip address is: " . $_->address;  
    	}
    }
    print "\n";
}


