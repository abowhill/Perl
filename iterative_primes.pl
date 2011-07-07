# find first n primes

# An iterative solution to finding prime numbers.
# 
# Array to store primes is initialized.
# Loop calls subroutine isp(), passing in each prime candidate.
# isp() iterates over list of known primes, doing trial division on the candidate.
# If non-prime is found, it returns 0. Otherwise, 1 is returned, and candidate is prime.
# Candidate is added to the list, and the loop continues until all candidates are tested.
# Subroutine sho() displays the list.

@p=(); 

for ($i=2; $i < 100000; $i++)
  {
  if (isp($i))
     { 
     push @p, $i;
     }
  }

sub isp # isprime?
  {
  foreach (@p)
     {
     if (!($i % $_))
       { 
       return 0;
       }
     }
     return 1; 
  }
   
sub sho
  {
  print "[";
  foreach (@p) { print "$_," }
  print "]\n";
  }

sho();
