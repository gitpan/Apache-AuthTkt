# Basic constructor

use File::Basename;
use Test::More tests => 8;
BEGIN { use_ok( Apache::AuthTkt ) }
use strict;

my $dir = dirname($0);
my $secret = 'foobar';

# Simple constructor
my $at = Apache::AuthTkt->new(secret => $secret);
ok($at, 'secret constructor ok');
is($at->secret, $secret, 'secret() ok');

# Invalid constructor
ok(! defined eval { Apache::AuthTkt->new }, 'die on bare constructor');

# Invalid config file
ok(! defined eval { Apache::AuthTkt->new(conf => '/foo/bar') },
    'die on invalid config file');

# Config file missing TKTAuthSecret
ok(! defined eval { Apache::AuthTkt->new(conf => '/etc/passwd') },
    'die on config file without TKTAuthSecret');

# Constructor with 'conf'
ok($at = Apache::AuthTkt->new(conf => "$dir/t01/mod_auth_tkt.conf"),
    'conf constructor ok');
is($at->secret, '0e1d79e1-c18b-43c5-bfd6-a396e13bf39c', 'secret() ok');


# arch-tag: 18848348-837a-4496-a483-10e9ba4714ba
# vim:ft=perl
