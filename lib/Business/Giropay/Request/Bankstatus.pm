package Business::Giropay::Request::Bankstatus;

use Business::Giropay::Types qw/Str/;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

has uri => (
    is      => 'ro',
    isa     => Str,
    default => 'giropay/bankstatus',
);

has bic => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

sub parameters {
    return ['bic'];
}

1;
