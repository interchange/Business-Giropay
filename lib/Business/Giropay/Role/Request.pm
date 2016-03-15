package Business::Giropay::Role::Request;

=head1 NAME

Business::Giropay::Role::Request - Moo::Role consumed by all Request classes

=cut

use Carp;
use Digest::HMAC_MD5 'hmac_md5_hex';
use Business::Giropay::Types qw/Enum Int Str/;
use Moo::Role;

requires qw(parameters uri);

=head1 ATTRIBUTES

=head2 type

Payment type. Currently the following types are supported:

=over

=item * eps

=item * giropay

=item * ideal

=back

=cut

has type => (
    is       => 'ro',
    isa      => Enum [qw( eps giropay ideal)],
    required => 1,
);

has base_uri => (
    is      => 'ro',
    isa     => Str,
    default => 'https://payment.girosolution.de/girocheckout/api/v2',
);

has merchantId => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

has projectId => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

has secret => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has hash => (
    is       => 'lazy',
    isa      => Str,      # Varchar[32]
    init_arg => undef,
);

sub _build_hash {
    my $self = shift;

    my @parameters;
    foreach my $param ( @{ $self->parameters } ) {
        push @parameters, $self->$param if defined $self->$param;
    }
    return hmac_md5_hex(
        join( '', $self->merchantId, $self->projectId, @parameters ),
        $self->secret );
}

has url => (
    is       => 'lazy',
    isa      => Str,
    init_arg => undef,
);

sub _build_url {
    my $self = shift;
    return join( '/', $self->base_uri, $self->uri );
}

sub make_request {
}

1;
