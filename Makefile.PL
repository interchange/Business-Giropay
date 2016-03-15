use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'Business::Giropay',
    AUTHOR             => q{Peter Mottram (SysPete) <peter@sysnix.com>},
    ABSTRACT_FROM      => 'lib/Business/Giropay.pm',
    LICENSE            => 'Perl',
    PL_FILES           => {},
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::Exception' => 0,
        'Test::More'      => 0,
    },
    PREREQ_PM => {
        'Digest::HMAC_MD5' => 0,
        'HTTP::Tiny'       => 0,
        'IO::Socket::SSL'  => '1.56',
        'Type::Tiny'       => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Business-Giropay-*' },
);
