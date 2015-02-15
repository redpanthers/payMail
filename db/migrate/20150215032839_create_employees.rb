class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.datetime :date_of_birth
      t.datetime :date_of_joining
      t.string :encrypted_pancard
      t.string :encrypted_bank_account_number
      t.string :encrypted_bank_name
      t.string :encrypted_bank_ifsc_code
      t.string :encrypted_bank_branch_name
      t.text   :address

      t.timestamps null: false
    end
  end
end
