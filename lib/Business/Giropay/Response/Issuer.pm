package Business::Giropay::Response::Issuer;

=head1 NAME

Business::Giropay::Response::Issuer - response object for L<Business::Giropay::Request::Issuer>

=cut

use Business::Giropay::Types qw/Map Maybe Str/;
use Moo;
with 'Business::Giropay::Role::Response';
use namespace::clean;

=head1 ATTRIBUTES

See L<Business::Giropay::Role::Response/ATTRIBUTES> for attributes common to
all request classes.

=head2 issuers

A hash reference of issuer banks with BIC as key and name as value.

=cut

has issuers => (
    is  => 'lazy',
    isa => Maybe [ Map [ Str, Str ] ],
    init_arg => undef,
);

sub _build_issuers {
    shift->data->{issuer};
}

=head1 METHODS

See L<Business::Giropay::Role::Response/METHODS>.

=cut

1;
