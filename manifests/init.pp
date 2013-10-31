# Public: Installs PyCharm
#
# Usage:
#
#  class { 'pycharm':
#    edition => 'community',
#    version => '3.0.0'
#  }
#
#  include pycharm
class pycharm($edition='community', $version='3.0.0') {
  package { "PyCharm-${edition}-${version}":
    provider => 'appdmg',
    source   => "http://download.jetbrains.com/python/pycharm-${edition}-${version}.dmg"
  }
}
