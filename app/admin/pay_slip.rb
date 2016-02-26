ActiveAdmin.register PaySlip do

  scope :all, default: true

  permit_params :employee_id, :salary, :no_of_leaves, :send_email, :month,
                :year, :basic_pay, :dearness_allowance, :house_rent,
                :conveyance, :monthly_tax_deduction, :loss_of_pay,
                :total_gross_salary

  actions :index, :show, :new, :create, :destroy

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
      panel 'SALARY BREAKDOWN'
      panel 'Earnings'
      f.input :no_of_leaves
      f.input :send_email
      f.input :month, as: :select, collection: Date::MONTHNAMES, default: Date::MONTHNAMES[Date.today.month].next,
              include_blank: false, allow_blank: false, label: 'Pay Slip for the month of'
      f.input :year, as: :select, collection: ['2015', '2016', '2017']
      f.input :id, as: :hidden, :value => PaySlip.find_by_id(params[:id])
      f.input :basic_pay
      f.input :dearness_allowance
      f.input :house_rent
      f.input :conveyance
      panel 'Deductions'
      f.input :monthly_tax_deduction
      f.input :loss_of_pay
      f.input :total_gross_salary
      actions
    end
  end

  controller do
    def new
      if CommonSetting.count.zero?
        flash[:notice] = "Please create a CommonSetting that is needed for sending emails"
        redirect_to '/' and return
      else
        super
      end
    end
  end
end
