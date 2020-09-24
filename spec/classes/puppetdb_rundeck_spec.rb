require 'spec_helper'

describe 'puppetdb_rundeck' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "puppetdb_rundeck class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('puppetdb_rundeck::params') }
        it { should contain_class('puppetdb_rundeck::install').that_comes_before('Class[puppetdb_rundeck::service]') }
        it { should contain_class('puppetdb_rundeck::service') }

        it { should contain_service('puppetdb_rundeck') }
        it { should contain_package('puppetdb_rundeck').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'puppetdb_rundeck class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('puppetdb_rundeck') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
