package Business::Giropay::Request::Bankstatus;

=head1 NAME

Business::Giropay::Request::Bankstatus - check whether bank with L</bic> is valid.

=cut

use Business::Giropay::Types qw/Str/;
use Carp;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

=head1 ATTRIBUTES

See L<Business::Giropay::Role::Request/ATTRIBUTES> for attributes common to
all request classes.

=head2 bic

Bank BIC code.

=cut

has bic => (
    is       => 'rwp',
    isa      => Str,
    required => 1,
);

=head2 response_class

The response class to use. Defaults to
L<Business::Giropay::Response::Bankstatus>.

=cut

has response_class => (
    is      => 'ro',
    isa     => Str,
    default => "Business::Giropay::Response::Bankstatus",
);

=head1 METHODS

See L<Business::Giropay::Role::Request/METHODS> in addition to the following:

=head2 BUILD

Die if this request type is not available for
L<Business::Giropay::Role::Request/gateway>.

=cut

sub BUILD {
    my $self = shift;
    croak "bankstatus request not supported by ideal"
      if $self->gateway eq 'ideal';
}

=head2 parameters

Returns additional parameters for the request.

=cut

sub parameters {
    return ['bic'];
}

=head2 sandbox_data \%data

Clean up data to be submitted in request to contain only safe data for testing.

Does nothing for this request type.

=cut

sub sandbox_data {
}

=head2 uri

Returns the URI to be appended to L<Business::Giropay::Role::Request/base_uri>
to construct the appropriate URL for the request.

=cut

sub uri {
    return shift->gateway . '/bankstatus';
}

1;
