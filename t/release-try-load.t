
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

use strict;
use warnings;

use Test::More;

use File::ChangeNotify;

ok(
    File::ChangeNotify::_try_load('File::ChangeNotify::Watcher::Default'),
    'can load Default watcher'
);

ok(
    File::ChangeNotify::_try_load('File::ChangeNotify::Watcher::Inotify'),
    'can load Inotify watcher'
);

ok(
    !File::ChangeNotify::_try_load('File::ChangeNotify::Watcher::KQueue'),
    'cannot load KQueue watcher'
);

done_testing();
