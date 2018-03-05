use strict;
use warnings;

use Test::More;

use lib 'lib', 'extlib', 'plugins/DisableObjectMethods/lib';

use_ok('MT::Plugin::DisableObjectMethods::Callback');
use_ok('MT::Registry::DisableObjectMethods');

done_testing;

