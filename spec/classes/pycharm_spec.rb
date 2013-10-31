require 'spec_helper'

describe 'pycharm' do
  context 'with edition' do
    context 'with edition => foo' do
      let (:params) { { :edition => 'foo'} }

      it { expect { subject }.to raise_error(
        Puppet::Error, /parameter edition must be professional or community/
      )}
    end
  end

  context 'with default parameters' do
    let (:params) { {} }

    version = '3.0.0'

    it do
      should contain_package("PyCharm-#{version}").with({
        :source   => "http://download.jetbrains.com/python/pycharm-#{version}.dmg",
        :provider => 'appdmg'
      })
    end
  end

  context 'with edition => professional and default version' do
    let (:params) { { :edition => 'professional' } }

    edition = 'professional'
    version = '3.0.0'

    it do
      should contain_package("PyCharm-#{edition}-#{version}").with({
        :source   => "http://download.jetbrains.com/python/pycharm-#{edition}-#{version}.dmg",
        :provider => 'appdmg'
      })
    end
  end

  context 'with edition => professional and version => 3.0.1' do
    let (:params) { { :edition => 'professional', :version => '3.0.1' } }

    edition = 'professional'
    version = '3.0.1'

    it do
      should contain_package("PyCharm-#{edition}-#{version}").with({
        :source   => "http://download.jetbrains.com/python/pycharm-#{edition}-#{version}.dmg",
        :provider => 'appdmg'
      })
    end
  end
end
