class Employee < ActiveRecord::Base
  attr_encrypted :pancard, :key => Rails.application.secrets.encryption_key, :attribute => 'encrypted_pancard'
  attr_encrypted :bank_name, :key => Rails.application.secrets.encryption_key, :attribute => 'encrypted_bank_name'
  attr_encrypted :bank_account_number, :key => Rails.application.secrets.encryption_key, :attribute => 'encrypted_bank_account_number'
  attr_encrypted :bank_branch_name, :key => Rails.application.secrets.encryption_key, :attribute => 'encrypted_bank_branch_name'
  attr_encrypted :bank_ifsc_code, :key => Rails.application.secrets.encryption_key, :attribute => 'encrypted_bank_ifsc_code'

  validates :name, :pancard, :bank_ifsc_code, :bank_name, :bank_branch_name, :bank_account_number, :employee_id, :designation, :fathers_name, presence: true

  validates :pancard, format: { with: /[A-Z]{5}[0-9]{4}[A-Z]/, message: 'Invalid Format' }

  has_many :pay_slips
  belongs_to :department
end
