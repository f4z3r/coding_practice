use v6.c;
use Test;
use lib 'lib';

use chapter3_1;

plan 3;

subtest "naive 3-stack", {
    plan 9;

    my $triple-stack = NaiveTripleStack.new;
    $triple-stack.push(0, 5);
    nok $triple-stack.is-empty(0);
    ok $triple-stack.is-empty(1);
    ok $triple-stack.is-empty(2);
    is $triple-stack.peek(0), 5;
    throws-like $triple-stack.peek(1), Exception, message => "empty stack";
    is $triple-stack.pop(0), 5;
    ok $triple-stack.is-empty(0);

    lives-ok { $triple-stack.push(1, $_) for 0..^100 };
    throws-like $triple-stack.push(1, 0), Exception, message => "stack full";

    done-testing;
}

subtest "efficient 3-stack", {
    plan 12;

    my $triple-stack = EfficientTripleStack.new;
    $triple-stack.push(0, 5);
    nok $triple-stack.is-empty(0);
    ok $triple-stack.is-empty(1);
    ok $triple-stack.is-empty(2);
    is $triple-stack.peek(0), 5;
    throws-like $triple-stack.peek(1), Exception, message => "empty stack";
    is $triple-stack.pop(0), 5;
    ok $triple-stack.is-empty(0);

    lives-ok { $triple-stack.push(0, 10) };
    lives-ok { $triple-stack.push(1, $_) for 0..^299 };
    throws-like { $triple-stack.push(1, 0) }, Exception, message => "buffer full";
    is $triple-stack.pop(0), 10;
    # not all space is recycled ...
    throws-like { $triple-stack.push(1, 0) }, Exception, message => "buffer full";

    done-testing;
}

subtest "best 3-stack", {
    plan 13;

    my $triple-stack = BestTripleStack.new;
    $triple-stack.push(0, 5);
    nok $triple-stack.is-empty(0);
    ok $triple-stack.is-empty(1);
    ok $triple-stack.is-empty(2);
    is $triple-stack.peek(0), 5;
    throws-like $triple-stack.peek(1), Exception, message => "empty stack";
    is $triple-stack.pop(0), 5;
    ok $triple-stack.is-empty(0);

    lives-ok { $triple-stack.push(0, 10) };
    lives-ok { $triple-stack.push(1, $_) for 0..^299 };
    throws-like { $triple-stack.push(1, 0) }, Exception, message => "buffer full";
    is $triple-stack.pop(0), 10;
    # impossible with EfficientTripleStack (all space recycled) ...
    lives-ok { $triple-stack.push(1, 0) };
    throws-like { $triple-stack.push(1, 0) }, Exception, message => "buffer full";

    done-testing;
}

done-testing;
