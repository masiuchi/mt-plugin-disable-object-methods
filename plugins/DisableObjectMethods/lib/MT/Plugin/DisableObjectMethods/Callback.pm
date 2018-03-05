package MT::Plugin::DisableObjectMethods::Callback;
use strict;
use warnings;

use MT;
use MT::Registry::DisableObjectMethods;

sub init_app {
    return if _disable_object_methods_exist();
    my $disable_object_methods = _generate_disable_object_methods() or return;
    MT->registry( 'applications', 'cms', 'disable_object_methods',
        $disable_object_methods );
}

sub _disable_object_methods_exist {
    MT->registry( 'applications', 'cms', 'disable_object_methods' ) ? 1 : 0;
}

sub _generate_disable_object_methods {
    MT::Registry::DisableObjectMethods->registry(
        MT->registry('object_types'),
        MT->registry( 'applications', 'cms', 'enable_object_methods' ),
    );
}

1;

