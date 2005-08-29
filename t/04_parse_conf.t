# parse_conf testing

use File::Basename;
use Test::More tests => 17;
BEGIN { use_ok( Apache::AuthTkt ) }
use strict;

my $dir = dirname($0);

my $at;
ok($at = Apache::AuthTkt->new(conf => "$dir/t04/mod_auth_tkt.conf"),
    'conf constructor ok');

my %attr = (
    secret => '0e1d79e1-c18b-43c5-bfd6-a396e13bf39c',
    cookie_name => 'auth_tkt',
    back_cookie_name => undef,
    back_arg_name => 'back',
    domain => undef,
    login_url => => 'https://www.example.com/pub/login.cgi',
    timeout_url => undef,
    unauth_url => undef,
    timeout_min => 120,
    timeout_refresh => 0.5,
    token => undef,
    guest_login => 0,
    ignore_ip => 1,
    require_ssl => 0,
);
for (sort keys %attr) {
  is(eval "\$at->$_", $attr{$_}, "$_() ok");
}
ok(! defined eval { $at->foo }, "die on invalid method ok");


# arch-tag: 1c62dd79-eb46-4f49-a623-192a5da8ba37
# vim:ft=perl
