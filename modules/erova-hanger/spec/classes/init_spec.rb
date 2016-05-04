require 'spec_helper'
describe 'hanger' do

  context 'with defaults for all parameters' do
    it { should contain_class('hanger') }
  end
end
