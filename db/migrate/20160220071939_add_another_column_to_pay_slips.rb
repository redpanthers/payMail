class AddAnotherColumnToPaySlips < ActiveRecord::Migration
  def change
    add_column :pay_slips, :total_gross_salary, :float
  end
end
