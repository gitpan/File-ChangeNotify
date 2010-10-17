
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Watch for changes to files, cross-platform style',
  'AUTHOR' => 'Dave Rolsky <autarch@urth.org>',
  'BUILD_REQUIRES' => {
    'File::Path' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::Exception' => '0',
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'DISTNAME' => 'File-ChangeNotify',
  'EXE_FILES' => [],
  'LICENSE' => 'artistic_2',
  'NAME' => 'File::ChangeNotify',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Class::MOP' => '0',
    'File::Find' => '0',
    'File::Spec' => '0',
    'Module::Pluggable::Object' => '0',
    'Moose' => '0',
    'MooseX::Params::Validate' => '0.08',
    'MooseX::SemiAffordanceAccessor' => '0',
    'Time::HiRes' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.19',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



