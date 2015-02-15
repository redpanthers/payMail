ActiveAdmin.register CommonSetting do

  scope :all, default: true


  permit_params :cc_address, :bcc_address, :email_template, :pdf_template

  index do
    column :cc_address
    column :bcc_address
    column :email_template
    column :pdf_template

    actions
  end

end
