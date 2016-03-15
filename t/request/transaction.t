use Test::More;
use Test::Exception;

use aliased 'Business::Giropay::Request::Transaction';

my $request;

throws_ok { $request = Transaction->new }
qr/Missing required arguments: amount, bic, currency, merchantId, merchantTxId, projectId, purpose, secret, urlNotify, urlRedirect/,
  "Request class with no parameters method dies";

lives_ok {
    $request = Transaction->new(
        merchantId   => 1234567,
        projectId    => 1234,
        merchantTxId => '1234567890',
        amount       => 100,
        currency     => 'EUR',
        purpose      => 'Beispieltransaktion',
        bic          => 'TESTDETT421',
        info1Label   => 'Ihre Kundennummer',
        info1Text    => '0815',
        urlRedirect  => 'http://www.ihre-domein.de/girocheckout/redirect',
        urlNotify    => 'http: //www.ihre-domein.de/girocheckout/notify',
        secret       => 'secure'
    );
}
"good request lives";

cmp_ok $request->hash, 'eq', '983f8a2d2e483d08020c218adc7fb1c8', 'hash is good';

cmp_ok $request->url, 'eq',
  'https://payment.girosolution.de/girocheckout/api/v2/transaction/start',
  'url is good';

done_testing;
