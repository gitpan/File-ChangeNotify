
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'auto_features' => {
    'Inotify' => {
      'description' => 'Inotify support',
      'requires' => {
        'Linux::Inotify2' => '1.2'
      }
    },
    'KQueue' => {
      'description' => 'KQueue support',
      'requires' => {
        'IO::KQueue' => '0'
      }
    }
  },
  'build_requires' => {
    'File::Path' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::Exception' => '0',
    'Test::More' => '0.88'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Watch for changes to files, cross-platform style',
  'dist_author' => [
    'Dave Rolsky <autarch@urth.org>'
  ],
  'dist_name' => 'File-ChangeNotify',
  'dist_version' => '0.20',
  'license' => 'artistic_2',
  'module_name' => 'File::ChangeNotify',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
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
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
