package Business::Giropay::Role::Gateway;

=head1 NAME

Business::Giropay::Role::Gateway - 'gateway' role consumed by Request and Response roles

=cut

use Business::Giropay::Types qw/Enum/;
use Moo::Role;

=head1 ATTRIBUTES

=head2 gateway

Gateway type. Currently the following are supported:

=over

=item * eps

=item * giropay

=item * ideal

=back

=cut

has gateway => (
    is       => 'ro',
    isa      => Enum [qw( eps giropay ideal)],
    required => 1,
);

1;
