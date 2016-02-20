class AddColumnToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :employee_id, :string
    add_column :employees, :designation, :string
    add_column :employees, :pf_account, :string
    add_column :employees, :esi_account, :string
    add_column :employees, :fathers_name, :string
  end
end
