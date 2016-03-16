package Business::Giropay;

=head1 NAME

Business::Giropay - Giropay payments API

=head1 VERSION

Version 0.001

=cut

our $VERSION = '0.001';

use Moo;
with 'Business::Giropay::Role::Core';

=head1 DESCRIPTION

B<Business::Giropay> implement's Giropay's API to make direct calls to
Giropay's payments server.

Giropay facilitates payments via various provider networks in addition to 
their own. This module currently supports the following networks:

=over

=item eps - EPS (Austria)

=item giropay - Giropay's own network (Germany)

=item ideal - iDEAL (The Netherlands)

=back

Contributions to allow this module to support other networks available via
giropay are most welcome.

=head1 SYNOPSIS

    use Business::Giropay;

    my $giropay = Business::Giropay->new(
        network    => 'giropay',
        merchantId => '123456789',
        projectId  => '1234567',
        sandbox    => 1,
        secret     => 'project_secret',
    );

    my $response = $giropay->transaction(
        merchantTxId => 'tx-10928374',
        amount       => 2938,               # 29.38 in cents
        currency     => 'EUR',
        purpose      => 'Test Transaction',
        bic          => 'TESTDETT421',
        urlRedirect  => 'https://www.example.com/return_page',
        urlNotify    => 'https://www.example.com/api/giropay/notify',
    );

    if ( $response->rc == 0 ) {
        # all is good so do stuff
    }
    else {
        # transaction request failed
    }

Elsewhere in your C</api/giropay/notify> route:

    my $notification = $giropay->notification( %request_params );

    if ( $notification->success ) {
        # save stuff in DB and thank customer for purchase
    }
    else {
        # bad stuff - check out the details and tell the customer
    }

=head1 TODO

Add more of Giropay's payment networks.

=head1 ACKNOWLEDGEMENTS

Many thanks to L<CALEVO Equestrian|https://www.calevo.com/> for sponsoring
development of this module.

=head1 LICENSE AND COPYRIGHT

Copyright 2016 Peter Mottram (SysPete) <peter@sysnix.com>

This program is free software; you can redistribute it and/or modify it
under the terms of Perl itself.

=cut

1;
