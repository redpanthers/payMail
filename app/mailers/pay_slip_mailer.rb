class PaySlipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pay_slip_mailer.monthly.subject
  #
  def monthly employee, pay_slip
    pdf_template = Liquid::Template.parse(CommonSetting.first.pdf_template).render('name' => employee.name,
                    'month' => pay_slip.month, 'salary' => pay_slip.salary, 'no_of_leaves' => pay_slip.no_of_leaves,
                    'bank_account' => employee.bank_account_number, 'bank_name' => employee.bank_name)
    pdf = Prawn::Document.new do
      move_down(100)
      text pdf_template
      bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        stroke_horizontal_rule
        move_down(5)
        text "Red Panthers Software Solutions (P) Ltd.", :size => 10
      end
    end

    pdf.encrypt_document(
      :user_password  => employee.name, 
      :owner_password => employee.pancard)

    @template = Liquid::Template.parse(CommonSetting.first.email_template).render('name' => employee.name,
                    'month' => pay_slip.month)

    attachments["payslip_#{pay_slip.month}-#{pay_slip.year}.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    pay_slip.total_emails_send = pay_slip.total_emails_send + 1 rescue pay_slip.total_emails_send = 1
    pay_slip.save
    mail(:to => "#{employee.name}<#{employee.email_address}>", :cc => CommonSetting.first.cc_address,
         :bcc => CommonSetting.first.bcc_address, :subject => "Salary for the month of #{pay_slip.month}, #{pay_slip.year}")
  end
end
