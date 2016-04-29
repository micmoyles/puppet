require 'spec_helper'
describe 'boot' do

  context 'with defaults for all parameters' do
    it { should contain_class('boot') }
  end
end
