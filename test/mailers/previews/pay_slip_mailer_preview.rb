# Preview all emails at http://localhost:3000/rails/mailers/pay_slip_mailer
class PaySlipMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pay_slip_mailer/monthly
  def monthly
    PaySlipMailer.monthly
  end

end
