
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Get IP/IPList Info (location, as number, etc)",
  "AUTHOR" => "Abby Pan <abbypan\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Simple-IPInfo",
  "EXE_FILES" => [
    "bin/compare_ip_loc.pl",
    "bin/ip_loc_taobao.pl",
    "bin/merge_ip_loc.pl",
    "bin/parse_ip_as.pl",
    "bin/parse_ip_loc.pl",
    "bin/sort_ip_loc.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "Simple::IPInfo",
  "PREREQ_PM" => {
    "Data::Validate::IP" => 0,
    "JSON" => 0,
    "Memoize" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => ""
  }
);


my %FallbackPrereqs = (
  "Data::Validate::IP" => 0,
  "JSON" => 0,
  "Memoize" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



