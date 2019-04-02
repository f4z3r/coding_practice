use v6.c;
use Test;
use lib 'lib';

plan 2;

use-ok 'Graph';

use Graph;

subtest "Node", {
    plan 6;

    my $root = Graph::Node.new(val => 0);
    $root.add-neighbour(Graph::Node.new(val => 1));
    $root.add-neighbour(Graph::Node.new(val => 2));
    $root.add-neighbour(Graph::Node.new(val => 3));

    ok $root.has-n-neighbours(3), "root should have 3 neighbours";
    is $root.get-nth-neighbour(1).val, 2, "second neighbour should have value 2";

    throws-like { $root.rm-nth-neighbour(4) }, Exception, message => "index out of bounds";

    is $root.rm-nth-neighbour(0).val, 1, "first neighbour should have value 1";
    ok $root.has-n-neighbours(2), "root should only have 2 neighbours";

    is $root.get-nth-neighbour(0).val, 2, "frist neighbour should have value 2";

    done-testing;
}

done-testing;
