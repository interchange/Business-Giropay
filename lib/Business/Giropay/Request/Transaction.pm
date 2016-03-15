package Business::Giropay::Request::Transaction;

use Business::Giropay::Types qw/Int Maybe Str/;
use Carp;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

has merchantTxId => (
    is       => 'ro',
    isa      => Str,    # Varchar [255]
    required => 1,
);

has amount => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

has currency => (
    is       => 'ro',
    isa      => Str,    # Char [3]
    required => 1,
);

has purpose => (
    is       => 'ro',
    isa      => Str,    # Varchar [27]
    required => 1,
);

has bic => (
    is      => 'ro',
    isa     => Str,     # Varchar [11]
    default => '',
);

has iban => (
    is      => 'ro',
    isa     => Str,     # Varchar [34]
    default => '',
);

has issuer => (
    is      => 'ro',
    isa     => Str,
    default => '',
);

has [qw(info1Label info2Label info3Label info4Label info5Label)] => (
    is      => 'ro',
    isa     => Str,     # Varchar [30]
    default => '',
);

has [qw(info1Text info2Text info3Text info4Text info5Text)] => (
    is      => 'ro',
    isa     => Str,     # Varchar [80]
    default => '',
);

has urlRedirect => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has urlNotify => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

sub BUILD {
    my $self = shift;
    if ( $self->type =~ /^(eps|giropay)$/ ) {
        croak "Missing required argument: bic" unless $self->bic;
    }
    elsif ( $self->type eq 'ideal' ) {
        croak "Missing required argument: issuer" unless $self->issuer;
    }
}

sub parameters {
    return [
        qw/merchantTxId amount currency purpose bic iban issuer
          info1Label info1Text info2Label info2Text info3Label
          info3Text info4Label info4Text info5Label info5Text
          urlRedirect urlNotify/
    ];
}

sub uri {
    return 'transaction/start';
}

1;
