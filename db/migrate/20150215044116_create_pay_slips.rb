class CreatePaySlips < ActiveRecord::Migration
  def change
    create_table :pay_slips do |t|
      t.integer :employee_id
      t.integer :admin_user_id
      t.boolean :send_email
      t.integer :total_emails_send
      t.datetime :last_email_send_at
      t.integer :salary
      t.integer :no_of_leaves
      t.integer :total_working_days

      t.timestamps null: false
    end
  end
end
