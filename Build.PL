
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "auto_features" => {
    "Inotify" => {
      "description" => "Inotify support",
      "requires" => {
        "Linux::Inotify2" => "1.2"
      }
    },
    "KQueue" => {
      "description" => "KQueue support",
      "requires" => {
        "IO::KQueue" => 0
      }
    }
  },
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Watch for changes to files, cross-platform style",
  "dist_author" => [
    "Dave Rolsky <autarch\@urth.org>"
  ],
  "dist_name" => "File-ChangeNotify",
  "dist_version" => "0.24",
  "license" => "artistic_2",
  "module_name" => "File::ChangeNotify",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Class::Load" => 0,
    "File::Find" => 0,
    "File::Spec" => 0,
    "List::MoreUtils" => 0,
    "Module::Pluggable::Object" => 0,
    "Moose" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "MooseX::Params::Validate" => 0,
    "MooseX::SemiAffordanceAccessor" => 0,
    "Time::HiRes" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Data::Dumper" => 0,
    "Exporter" => 0,
    "File::Path" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "base" => 0,
    "lib" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
