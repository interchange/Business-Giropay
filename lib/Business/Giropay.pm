package Business::Giropay;

=head1 NAME

Business::Giropay - Checkout via giropay

=head1 VERSION

Version 0.08

=cut

our $VERSION = '0.08';

use strict;
use warnings;

#use XML::Compile::WSDL11;
#use XML::Compile::SOAP11;
#use XML::Compile::Transport::SOAPHTTP;
#use Business::OnlinePayment::IPayment::Response;
#use Business::OnlinePayment::IPayment::Transaction;
#use Business::OnlinePayment::IPayment::Return;

use Digest::HMAC_MD5 'hmac_md5_hex';

#use URI;

use Moo;

=head1 DESCRIPTION

This module provides an interface for online payments via giropay
(L<https://www.giropay.de/>).

=head1 SYNOPSIS

  use Business::Giropay;

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2016 Peter Mottram (SysPete) <peter@sysnix.com>

This program is free software; you can redistribute it and/or modify it
under the terms of Perl itself.

=cut

1;
