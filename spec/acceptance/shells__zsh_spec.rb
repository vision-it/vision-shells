require 'spec_helper_acceptance'

describe 'vision_shells::zsh' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
        class { 'vision_shells::zsh': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'package installed' do
    describe package('zsh') do
      it { is_expected.to be_installed }
    end
  end

  context 'files provisioned' do
    describe file('/root/.zshrc') do
      it { is_expected.to contain 'DISABLE_AUTO_UPDATE="true"' }
      it { is_expected.to be_mode 644 }
    end

    describe file('/root/.oh-my-zsh') do
      it { is_expected.to be_directory }
    end

    describe file('/root/.oh-my-zsh/custom/puppet.zsh') do
      it { is_expected.to be_file }
      it { is_expected.to contain 'This file is managed by puppet' }
    end

    describe file('/root/.oh-my-zsh/custom/path.zsh') do
      it { is_expected.to be_file }
      it { is_expected.to contain '/opt/puppetlabs' }
    end

    describe file('/root/.oh-my-zsh/custom/aliases.zsh') do
      it { is_expected.to be_file }
      it { is_expected.to contain 'This file is managed by Puppet' }
      it { is_expected.to contain "alias e='zile" }
    end
  end

  context 'default shell for user root' do
    describe file('/etc/passwd') do
      it { is_expected.to contain '/root:/usr/bin/zsh' }
    end
  end
end
