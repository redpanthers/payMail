require 'rails_helper'

describe Department, type: :model do
  let(:department) { build(:department) }

  describe 'Blank name' do
    it 'is to be invalid' do
      department.name = nil
      expect(department).to be_invalid
    end
  end
end
