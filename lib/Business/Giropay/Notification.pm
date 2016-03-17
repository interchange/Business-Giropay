package Business::Giropay::Notification;

=head1 NAME

Business::Giropay::Notification - payment notification object

=cut

use Carp;
use Digest::HMAC_MD5 'hmac_md5_hex';
use Business::Giropay::Types qw/Int Str/;
use Moo;
use namespace::clean;

=head1 ATTRIBUTES

=head2 reference

Unique GiroCheckout transaction ID.

Should match L<Business::Giropay::Response::Transaction/reference>
from an earlier request.

=cut

has reference => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    init_arg => 'gcReference',
);

=head2 merchantTxId

Merchant transaction ID.

Should match L<Business::Giropay::Response::Transaction/merchantTxId>
from an earlier request.

=cut

has merchantTxId => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    init_arg => 'gcMerchantTxId',
);

=head2 backendTxId

Payment processor transaction ID.

=cut

has backendTxId => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    init_arg => 'gcBackendTxId',
);

=head2 amount

If a decimal currency is used, the amount has to be in the smallest unit of
value, eg. cent, penny.

=cut

has amount => (
    is       => 'ro',
    isa      => Int,
    required => 1,
    init_arg => 'gcAmount',
);

=head2 currency

Three letter currency code.

=cut

has currency => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    init_arg => 'gcCurrency',
);

=head2 resultPayment

Payment result code.

=cut

has resultPayment => (
    is       => 'ro',
    isa      => Int,
    required => 1,
    init_arg => 'gcResultPayment',
);

=head2 hash

Payment result code.

=cut

has hash => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    init_arg => 'gcHash',
);

=head1 METHODS

=head2 BUILD

Check that the hash matches what we expect. Die on mismatch

=cut

sub BUILD {
    my $self = shift;

    my $verify = hmac_md5_hex(
        join( '',
            $self->reference, $self->merchantTxId, $self->backendTxId,
            $self->amount,    $self->currency,     $self->resultPayment ),
        $self->secret
    );

    croak(
        "Returned HMAC hash ",            $self->hash,
        " does not match expected hash ", $verify
    ) unless $verify eq $self->hash;
}

1;
