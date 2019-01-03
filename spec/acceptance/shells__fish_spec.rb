require 'spec_helper_acceptance'

describe 'vision_shells::zsh' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-FILE
        class { 'vision_shells::fish': }
      FILE

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'package installed' do
    describe package('fish') do
      it { is_expected.to be_installed }
    end
  end
end
