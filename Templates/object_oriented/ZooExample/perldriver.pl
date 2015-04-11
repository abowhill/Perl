require Zoo::Keeper;


MAIN:
   {
   my $zookeeper_1 = Keeper->new( {name=>"Fred",gender=>"Male"} );
   inspect ($zookeeper_1);

   $zookeeper_1->name("Thomas");
   inspect ($zookeeper_1,"\n[Changing name]\n");

   my $zookeeper_2 = Keeper->new( {name=>"Selma",gender=>"Female"} );
   inspect ($zookeeper_2);
   
   my $zookeeper_3 = Keeper->new( {gender=>"Female"} );
   inspect ($zookeeper_3);
   }


sub inspect
   {
   my ($obj,$msg) = @_;
   print $msg || "\n[Creating object]\n";
   print "Object: ", $obj ? "allocated" : "not allaocated","\n";
   print "Object: ", $obj->works,"\n";
   print "Name: ", $obj->name,"\n";
   print "Gender: ". $obj->gender,"\n";
   print "Count: ", $obj->get_count, "\n";
   }
