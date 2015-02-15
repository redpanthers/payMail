class CreateCommonSettings < ActiveRecord::Migration
  def change
    create_table :common_settings do |t|
      t.string :cc_address
      t.string :bcc_address

      t.timestamps null: false
    end
  end
end
