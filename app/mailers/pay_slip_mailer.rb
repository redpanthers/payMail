class PaySlipMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pay_slip_mailer.monthly.subject
  #

  def monthly(employee, pay_slip)
    pdf_template = Liquid::Template.parse(CommonSetting.first.pdf_template)
                                   .render(from_available_options(employee, pay_slip))

    employee_data = [
      [{ content: 'Employee Details', colspan: 2 }],
      ['Name', employee.name],
      ['Employee ID', employee.id],
      ['Department', employee.department_name],
      ['Date of Joining', (begin
                             employee.date_of_joining.strftime('%m/%d/%Y')
                           rescue
                             ''
                           end)],
      ['Designation', employee.designation],
      ['PF Account', employee.pf_account],
      ['ESI Account', employee.esi_account],
      ['Fathers Name', employee.fathers_name],
      ['Salary A/c No:', employee.bank_account_number],
      ['Bank - Branch', "#{employee.bank_name}, #{employee.bank_branch_name}"]
    ]

    salary_data = [
      [{ content: "Salary Breakdown - #{pay_slip.month}, #{pay_slip.year}", colspan: 2 }],
      [{ content: 'Earnings', colspan: 2, font_style: :bold }],
      ['Basic Pay', pay_slip.basic_pay],
      ['Dearness Allowance', pay_slip.dearness_allowance],
      ['House Rent Allowance', pay_slip.house_rent],
      ['Conveyance Allowance', pay_slip.conveyance],
      [{ content: 'Deductions', colspan: 2, font_style: :bold }],
      ['Monthly Tax Dedcution', pay_slip.monthly_tax_deduction],
      ['Loss of Pay', pay_slip.loss_of_pay],
      ['Total gross Salary/ CTC', pay_slip.total_gross_salary]
    ]
    pdf = Prawn::Document.new do
      bounding_box [bounds.left, bounds.top], width: bounds.width do
        font 'Helvetica'
        text 'Red Panthers Software Solutions (P) Ltd.', align: :center, size: 20
        text '3/165 G, 3rd Floor, Vijaya Complex,', align: :center
        text 'Chembumukku, Kakkanad. Cochin - 682024', align: :center
        stroke_horizontal_rule
      end
      move_down 30
      text "Date: #{Date.current.to_formatted_s(:long)}", align: :right
      move_down(50)
      text pdf_template
      table employee_data, width: bounds.width, header: true, row_colors: %w(e6e6e6 ffffff) do
        row(0).font_style = :bold
        column(0).background_color = 'e6e6e6'
      end
      move_down 20
      table salary_data, width: bounds.width, header: true, row_colors: %w(e6e6e6 ffffff) do
        row(0).font_style = :bold
        column(0).background_color = 'e6e6e6'
      end
      bounding_box [bounds.left, bounds.bottom + 25], width: bounds.width do
        stroke_horizontal_rule
        move_down(5)
        text 'Red Panthers Software Solutions (P) Ltd.', size: 10
      end
    end

    pdf.encrypt_document(
      user_password: employee.name,
      owner_password: employee.pancard)

    @template = Liquid::Template.parse(CommonSetting.first.email_template).render(from_available_options(employee, pay_slip))

    attachments["payslip_#{pay_slip.month}-#{pay_slip.year}.pdf"] = { mime_type: 'application/pdf', content: pdf.render }
    pay_slip.total_emails_send = begin
                                   pay_slip.total_emails_send + 1
                                 rescue
                                   pay_slip.total_emails_send = 1
                                 end
    pay_slip.save
    mail(to: "#{employee.name}<#{employee.email_address}>", cc: CommonSetting.first.cc_address,
         bcc: CommonSetting.first.bcc_address, subject: "Salary for the month of #{pay_slip.month}, #{pay_slip.year}")
  end

  private

  def from_available_options(employee, pay_slip)
    { 'name' => employee.name,
      'department' => employee.department_name,
      'date_of_joining' => employee.date_of_joining,
      'designation' => employee.designation,
      'pf_account' => employee.pf_account,
      'esi_account' => employee.esi_account,
      'fathers_name' => employee.fathers_name,
      'month' => pay_slip.month,
      'salary' => pay_slip.salary,
      'no_of_leaves' => pay_slip.no_of_leaves,
      'bank_account' => employee.bank_account_number,
      'bank_name' => employee.bank_name,
      'year' => pay_slip.year,
      'basic_pay' => pay_slip.basic_pay,
      'dearness_allowance' => pay_slip.dearness_allowance,
      'house_rent' => pay_slip.house_rent,
      'conveyance' => pay_slip.conveyance,
      'monthly_tax_deduction' => pay_slip.monthly_tax_deduction,
      'loss_of_pay' => pay_slip.loss_of_pay,
      'total_gross_salary' => pay_slip.total_gross_salary
    }
  end
end
