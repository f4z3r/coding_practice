#!/usr/bin/env perl

use strict;
use warnings;

use lib "lib";

use Test::More tests => 8;

use Chapter1::Exercise1;

ok is_unique "helo";
ok is_unique "";
ok ! is_unique "hello";
ok ! is_unique "aba";

ok is_unique_no_array "helo";
ok is_unique_no_array "";
ok ! is_unique_no_array "hello";
ok ! is_unique_no_array "aba";
