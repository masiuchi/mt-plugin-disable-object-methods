package MT::Registry::DisableObjectMethods;
use strict;
use warnings;

sub registry {
    my $class = shift;
    my ( $object_types, $enable_object_methods ) = @_;
    my %disable_object_methods;
    for my $type ( keys %$object_types ) {
        next if $type =~ /\./;
        my $enable = $enable_object_methods->{$type};
        my %disable;
        for my $method (qw/ delete edit save /) {
            if ( $enable->{$method} ) {
                if ( ref $enable->{$method} eq 'CODE' ) {
                    $disable{$method} = sub { $enable->{$method}->() };
                }
            }
            else {
                $disable{$method} = 1;
            }
        }
        $disable_object_methods{$type} = \%disable if %disable;
    }
    %disable_object_methods ? \%disable_object_methods : undef;
}

1;

