require 'rails_helper'
 
RSpec.describe Employee do
  before do
    @employee = FactoryGirl.create(:employee)
  end

  describe 'PanCard' do
    it 'should not accept pancard with only alphabets' do
      @employee.pancard = 'ABYLUILKHY'
      expect(@employee.valid?).to eq(false)
    end

    it 'should not accept pancard with only digits' do
      @employee.pancard = '1234567890'
      expect(@employee.valid?).to eq(false)
    end

    it 'should accept pancard with 5 alphabets followed by four digits and one character' do
      @employee.pancard = 'BLPRA1409R'
      expect(@employee.valid?).to eq(true)
    end
  end
end