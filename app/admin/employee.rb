ActiveAdmin.register Employee do

  scope :all, default: true

  filter :name

  permit_params :name, :date_of_joining, :date_of_birth, :bank_name, :bank_account_number,
                :bank_ifsc_code, :bank_branch_name, :pancard, :email_address, :employee_id, :designation, :fathers_name, :pf_account, :esi_account

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
    attributes_table :name,:employee_id, :email_address, :fathers_name, :date_of_birth,
                     :date_of_joining, :pancard, :designation,
                     :bank_name, :bank_ifsc_code, :bank_branch_name, :bank_account_number,
                     :pf_account, :esi_account
                     :address
    active_admin_comments
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "employee" do
      f.input :name
      f.input :employee_id
      f.input :fathers_name
      f.input :email_address
      f.input :date_of_birth, :as => :datepicker
      f.input :date_of_joining, :as => :datepicker
      f.input :pancard
      f.input :designation
      f.input :bank_name
      f.input :bank_account_number
      f.input :bank_ifsc_code
      f.input :bank_branch_name
      f.input :pf_account
      f.input :esi_account
      f.input :address
      f.input :id, as: :hidden, :value => Employee.find_by_id(params[:id])
    end
    actions
  end
end
