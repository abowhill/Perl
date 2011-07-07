#!/usr/local/bin/perl

use Data::Dumper;

# sub getprimes
#
# Description: 
#    Build a list of prime numbers less than or equal to a given value.
#
# Parameter 1: 
#    Integer value representing largest prime candidate.
#
# Returns: 
#    Array of primes. 

sub getprimes
   {
   my $curval = @_[0];

   # unaccepatable case first
   if ($curval < 2) { return () }

   # base (terminating) case next
   if ($curval < 3) { return (2) }

   # if base case not met, recurse, diminishing $curval
   my @primes = getprimes( $curval - 1 );

   # A prime is only divisible by itself and 1. 
   
   # Iterate over previously calculated primes list, taking the modulus
   # to determine primality. If we can divide by a value in the list,
   # (modulus zero) $curval is not prime, and we return the existing 
   # list. 
   
   # Only need to check items in list that are less than half the value 
   # of $curval. Anything biggger will multiply less than twice into 
   # curval, and is therefore ignorable. So, if the trial division
   # value we check in the list is greater than half of $curval, and 
   # no previously found prime has been able to divide evenly into 
   # $curval, we stop searching because the value we hold MUST be the 
   # next prime in the list!
   
   foreach my $p (@primes)
       {
       if ($curval % $p == 0) { return @primes } # not prime
       if ($p > int $curval / 2 + 1)  { last }   # found next prime
       } 

   # curval must be the next prime, so push it to the list
   push @primes, $curval;

   return @primes;
   }

# sub show
# Display array of primes to console.
# Parameter: array reference

sub show
   {
   my $a = @_[0];
   my $ret = "["; 
   foreach(@{$a}) { $ret = $ret . "$_ "; }
   $ret = $ret . "]\n"; 
   return $ret;
   }

# section MAIN
# Driver portion of code.

MAIN:
   {
   @ary = getprimes 300;
   print show \@ary;
   }

