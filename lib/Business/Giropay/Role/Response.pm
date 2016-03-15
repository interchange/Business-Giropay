package Business::Giropay::Role::Response;

=head1 NAME

Business::Giropay::Role::Response - Moo::Role consumed by all Response classes

=cut

use Carp;
use Digest::HMAC_MD5 'hmac_md5_hex';
use Business::Giropay::Types qw/Enum Int Str/;
use Moo::Role;
with 'Business::Giropay::Role::Gateway';

=head1 ATTRIBUTES

=cut

has rc => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

has msg => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has hash => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has issuer => (
    is       => 'ro',
    isa      => Hashref,
);

sub verify_hash {
    my $self = shift;

    my @parameters;
    foreach my $param ( @{ $self->parameters } ) {
        push @parameters, $self->$param if defined $self->$param;
    }
    return hmac_md5_hex(
        join( '', $self->merchantId, $self->projectId, @parameters ),
        $self->secret );
}

1;
