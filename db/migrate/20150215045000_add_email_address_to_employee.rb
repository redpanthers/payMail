class AddEmailAddressToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :email_address, :string
  end
end
