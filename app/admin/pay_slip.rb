ActiveAdmin.register PaySlip do

  scope :all, default: true

  permit_params :employee_id, :salary, :no_of_leaves, :send_email, :month, :year

  index do
    column :employee_id
    column :created_at
    column :salary
    column :send_email
    column :total_emails_send
    column :month
    column :year

    actions
  end

  form do |f|
    f.inputs "PaySlip" do
      f.input :employee_id, as: :select, :collection => Employee.all.map{ |e| [e.name, e.id] }, include_blank: false,
              allow_blank: false
      f.input :salary
      f.input :no_of_leaves
      f.input :send_email
      f.input :month, as: :select, collection: Date::MONTHNAMES, default: Date::MONTHNAMES[Date.today.month].next,
              include_blank: false, allow_blank: false, label: 'Pay Slip for the month of'
      f.input :year, as: :select, collection: ['2015', '2016', '2017']
      actions
    end 
  end
end
