package Business::Giropay::Request::Transaction;

use Business::Giropay::Types qw/Int Maybe Str/;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

has uri => (
    is      => 'ro',
    isa     => Str,
    default => 'transaction/start',
);

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
    is       => 'ro',
    isa      => Str,    # Varchar [11]
    required => 1,
);

has iban => (
    is  => 'ro',
    isa => Str,         # Varchar [34]
);

has [qw(info1Label info2Label info3Label info4Label info5Label)] => (
    is      => 'ro',
    isa     => Maybe [Str],    # Maybe[ Varchar [30] ]
    default => undef,
);

has [qw(info1Text info2Text info3Text info4Text info5Text)] => (
    is      => 'ro',
    isa     => Maybe [Str],    # Maybe[ Varchar [80] ]
    default => undef,
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

sub parameters {
    return [
        qw/merchantTxId amount currency purpose bic iban info1Label info1Text
          info2Label info2Text info3Label info3Text info4Label info4Text
          info5Label info5Text urlRedirect urlNotify/
    ];
}

1;
