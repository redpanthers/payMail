class AddColumnToPaySlips < ActiveRecord::Migration
  def change
    add_column :pay_slips, :basic_pay, :float
    add_column :pay_slips, :dearness_allowance, :float
    add_column :pay_slips, :house_rent, :float
    add_column :pay_slips, :conveyance, :float
    add_column :pay_slips, :monthly_tax_deduction, :float
    add_column :pay_slips, :loss_of_pay, :float
  end
end
