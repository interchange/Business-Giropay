package Business::Giropay::Request::Issuer;

use Business::Giropay::Types qw/Str/;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

has uri => (
    is      => 'ro',
    isa     => Str,
    default => 'giropayer/issuer',
);

sub parameters {
    return [];
}

1;
