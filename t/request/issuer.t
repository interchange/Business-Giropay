use Test::More;
use Test::Exception;

use aliased 'Business::Giropay::Request::Issuer';

my $request;

subtest 'no args and bad gateway' => sub {

    throws_ok { $request = Issuer->new }
    qr/Missing required arguments: gateway, merchantId, projectId, secret/,
      "Request class with no parameters method dies";

    throws_ok {
        $request = Issuer->new(
            merchantId => 1234567,
            projectId  => 1234,
            secret     => 'secure',
            gateway    => 'NoSuchType',
        );
    }
    qr/did not pass type constraint.+gateway/, "bad gateway dies";
};

subtest eps => sub {

    lives_ok {
        $request = Issuer->new(
            merchantId => 1234567,
            projectId  => 1234,
            secret     => 'secure',
            gateway    => 'eps',
        );
    }
    "good request lives";

    cmp_ok $request->hash, 'eq', '02f123fdb8b2056596abc0e6ebb1a8c3',
      'hash is good';

    cmp_ok $request->url, 'eq',
      'https://payment.girosolution.de/girocheckout/api/v2/eps/issuer',
      'url is good';
};

subtest giropay => sub {

    lives_ok {
        $request = Issuer->new(
            merchantId => 1234567,
            projectId  => 1234,
            secret     => 'secure',
            gateway    => 'giropay',
        );
    }
    "good request lives";

    cmp_ok $request->hash, 'eq', '02f123fdb8b2056596abc0e6ebb1a8c3',
      'hash is good';

    cmp_ok $request->url, 'eq',
      'https://payment.girosolution.de/girocheckout/api/v2/giropay/issuer',
      'url is good';
};

subtest ideal => sub {

    lives_ok {
        $request = Issuer->new(
            merchantId => 1234567,
            projectId  => 1234,
            secret     => 'secure',
            gateway    => 'ideal',
        );
    }
    "good request lives";

    cmp_ok $request->hash, 'eq', '02f123fdb8b2056596abc0e6ebb1a8c3',
      'hash is good';

    cmp_ok $request->url, 'eq',
      'https://payment.girosolution.de/girocheckout/api/v2/ideal/issuer',
      'url is good';
};

done_testing;