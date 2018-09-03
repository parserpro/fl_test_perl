#!/usr/bin/env perl
use common::sense;
use utf8::all;

use Log::Log4perl qw(:easy);
use WWW::Mechanize::Chrome;

Log::Log4perl->easy_init($ERROR);  # Set priority of root logger to ERROR

my $mech = WWW::Mechanize::Chrome->new(
    host => 'chrome',
    port => 9222,
    reuse => 1,
    launch_arg => [
        '--window-size=1280x16960',
        '--disable-gpu',
        '--headless',
        '--no-sandbox',
        '--disable-dev-shm-usage',
    ],
    headless => 1,
);

use Test::Simple "no_plan";

$mech->get('https://fantlab.ru');

ok( $mech->status == 200, 'Сайт работает');

#$mech->eval_in_page('alert("Hello Chrome")');
#my $png = $mech->content_as_png();
#open(my $PNG, '>', 'fl.png');
#print $PNG $png;
#close $PNG;

#open(my $TXT, '>', 'fl.txt');
#print $TXT $mech->content;
#close $TXT;
