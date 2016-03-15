use Test::More;
use Test::Exception;

use aliased 'Business::Giropay::Request::Issuer';

my $request;

throws_ok { $request = Issuer->new }
qr/Missing required arguments: merchantId, projectId, secret/,
  "Request class with no parameters method dies";

lives_ok {
    $request = Issuer->new(
        merchantId => 1234567,
        projectId  => 1234,
        secret     => 'secure'
    );
}
"good request lives";

cmp_ok $request->hash, 'eq', '02f123fdb8b2056596abc0e6ebb1a8c3', 'hash is good';

cmp_ok $request->url, 'eq',
  'https://payment.girosolution.de/girocheckout/api/v2/giropayer/issuer',
  'url is good';

done_testing;
