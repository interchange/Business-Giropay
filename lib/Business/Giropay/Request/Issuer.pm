package Business::Giropay::Request::Issuer;

use Business::Giropay::Types qw/Str/;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

sub parameters {
    return [];
}

sub uri {
    return shift->type . '/issuer';
}


1;
