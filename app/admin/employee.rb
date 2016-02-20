ActiveAdmin.register Employee do

  scope :all, default: true

  filter :name

  permit_params :name, :date_of_joining, :date_of_birth, :bank_name, :bank_account_number,
                :bank_ifsc_code, :bank_branch_name, :pancard, :email_address

  index do
    column :name
    column :date_of_birth
    column :date_of_joining
    column :pancard
    column :email_address
    column :bank_name

    actions
  end

  show do
    attributes_table :name, :email_address, :date_of_birth, :date_of_joining, :pancard, :bank_name,
                     :bank_ifsc_code, :bank_branch_name, :bank_account_number,
                     :address
    active_admin_comments
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "employee" do
      f.input :name
      f.input :email_address
      f.input :date_of_birth, :as => :datepicker
      f.input :date_of_joining, :as => :datepicker
      f.input :pancard
      f.input :bank_name
      f.input :bank_account_number
      f.input :bank_ifsc_code
      f.input :bank_branch_name
      f.input :address
      f.input :id, as: :hidden, :value => Employee.find_by_id(params[:id])
    end
    actions
  end
end
