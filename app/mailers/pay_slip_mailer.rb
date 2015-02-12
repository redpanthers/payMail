class PaySlipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pay_slip_mailer.monthly.subject
  #
  def monthly
    pdf = Prawn::Document.new
    pdf.text "Dear Irfan,"
    pdf.move_down 20
    pdf.text "Your salary for the month of January has been transferred to the bank account that you shared"
    pdf.text "with us at the time of joining. The amount of 7,500 INR should be credited to your"
    pdf.text "account before the end of the day. Incase you do not get the money credited today send an email to hsps@redpanthers.co."

    pdf.move_down 10
    pdf.text "We appreciate all the effort and work you have put into the company for the past one month"

    pdf.move_down 10
    pdf.text "regards,"
    pdf.move_down 10
    pdf.text "Harisankar P. S.
              Founder and C.E.O,
              Red Panthers Software Solutions,"
    
    pdf.encrypt_document(
      :user_password  => 'user', 
      :owner_password => "test")


    attachments["payslip_#{Time.now.strftime("%v")}.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => "HsPS<hsps@coderhs.com>", :subject => "Salary for the month of #{Time.now.strftime("%B, %Y")}")
  end
end
