package Business::Giropay::Request::Bankstatus;

use Business::Giropay::Types qw/Str/;
use Carp;
use Moo;
with 'Business::Giropay::Role::Request';
use namespace::clean;

has bic => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

sub BUILD {
    my $self = shift;
    croak "bankstatus request not supported by ideal" if $self->type eq 'ideal';
}

sub parameters {
    return ['bic'];
}

sub uri {
    return shift->type . '/bankstatus';
}

1;
