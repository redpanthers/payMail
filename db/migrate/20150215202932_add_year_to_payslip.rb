class AddYearToPayslip < ActiveRecord::Migration
  def change
    add_column :pay_slips, :year, :string
  end
end
