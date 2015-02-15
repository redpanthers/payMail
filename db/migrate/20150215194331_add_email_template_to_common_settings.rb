class AddEmailTemplateToCommonSettings < ActiveRecord::Migration
  def change
    add_column :common_settings, :email_template, :text
    add_column :common_settings, :pdf_template, :text
  end
end
