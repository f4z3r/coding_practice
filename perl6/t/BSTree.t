use v6.c;
use Test;
use lib 'lib';

use BSTree;

plan 5;

subtest "construction", {
    plan 1;

    my $tree = BSTree::BinarySearchTree.new;
    isa-ok $tree, BSTree::BinarySearchTree;

    done-testing;
}

subtest "insertion and search (only keys)", {
    plan 7;

    my $tree = BSTree::BinarySearchTree.new;
    $tree.insert(5);
    $tree.insert(7);
    $tree.insert(1);
    $tree.insert(2);
    is $tree.search(5), 1;
    is $tree.search(2), 1;
    throws-like { $tree.search(3) }, Exception, message => "not found";
    is $tree.search(7), 1;
    throws-like { $tree.search(3) }, Exception, message => "not found";
    throws-like { $tree.insert(7) }, Exception, message => "key already exists in BST";
    lives-ok { $tree.insert(7, 10) };

    done-testing;
}

subtest "insertion and search (keys and values)", {
    plan 5;

    my $tree = BSTree::BinarySearchTree.new;
    $tree.insert(5, 100);
    $tree.insert(7, 650);
    $tree.insert(1, -43);
    $tree.insert(2, 0);
    is $tree.search(5), 100;
    is $tree.search(2), 0;
    throws-like { $tree.search(3) }, Exception, message => "not found";
    is $tree.search(7), 650;
    throws-like { $tree.search(3) }, Exception, message => "not found";

    done-testing;
}

subtest "minimum", {
    plan 4;

    my $tree = BSTree::BinarySearchTree.new;
    $tree.insert(10);
    $tree.insert(8);
    $tree.insert(-10);
    $tree.insert(20);
    $tree.insert(-25);
    is $tree.min-key, -25;
    throws-like { $tree.min }, Exception, message => "no value set on minimum node";
    $tree.insert(-25, 1234);
    is $tree.min-key, -25;
    is $tree.min, 1234;

    done-testing;
}

subtest "maximum", {
    plan 4;

    my $tree = BSTree::BinarySearchTree.new;
    $tree.insert(10);
    $tree.insert(8);
    $tree.insert(-10);
    $tree.insert(20);
    $tree.insert(25);
    is $tree.max-key, 25;
    throws-like { $tree.max }, Exception, message => "no value set on maximum node";
    $tree.insert(25, 1234);
    is $tree.max-key, 25;
    is $tree.max, 1234;

    done-testing;
}

done-testing;
