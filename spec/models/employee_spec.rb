require 'rails_helper'

RSpec.describe Employee do
  before do
    @employee = FactoryGirl.create(:employee)
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bank_ifsc_code) }
    it { should validate_presence_of(:bank_name) }
    it { should validate_presence_of(:bank_branch_name) }
    it { should validate_presence_of(:bank_account_number) }
    it { should validate_presence_of(:employee_id) }
    it { should validate_presence_of(:designation) }
    it { should validate_presence_of(:fathers_name) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:pay_slips) }
    it { is_expected.to belong_to(:department) }
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