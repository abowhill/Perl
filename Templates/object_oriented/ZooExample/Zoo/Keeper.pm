## Basic class example

package Keeper; # Class declaration. A class is a package.

use strict; # always use
use Data::Dumper; # print structs with "print Dumper($reference)"

# class-wide methods and vars held in a closure.
   {
   my $_count = 0;        # default value
   sub _incr_count { ++$_count }  # accesssor
   sub _decr_count { --$_count }  # accesssor
   sub get_count   { $_count } # getter
   }


# constructor can be named anything but takes single hashref for args

sub new 
   { 
   # class is first argument is implicit, args follow are explicit
   my ($self,$args) = @_;  

   # class name is string. Can be called statically: Class::new or from an instance: Class->new
   my $class = ref ($self) || $self;

   my $properties = 
      {
      _name   => $args->{name}   || "<unknown>", # property A || default
      _gender => $args->{gender} || "<unknown>", # property B || default
      };
   
   # make an object of type by blessing a stat strucure into $class
   # second arg to bless is name of package  

   my $instance = bless $properties, $class; 
   $class->_incr_count;
    
   return $instance;
   }


sub DESTROY 
   {
   my $class = shift;
   $class->_decr_count;
   }


# simple method (getter)

sub works {  return "works" }

# getter-setter for property A

sub name   
   { 
   my ($obj,$arg) = @_; # calling object is always 1st arg implicit
   if ($arg) { $obj->{_name} = $arg }  # if 2nd arg exists, set property
   $obj->{_name}; # always return value of property
   }

# getter-setter for property B

sub gender 
   { 
   my ($obj,$arg) = @_;
   if ($arg) { $obj->{_gender} = $arg; }
   $obj->{_gender}; 
   }

1; # this ensures "use" will not fail.
