class AddMonthToPaySlip < ActiveRecord::Migration
  def change
    add_column :pay_slips, :month, :string
  end
end
