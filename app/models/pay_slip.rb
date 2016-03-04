class PaySlip < ActiveRecord::Base
  belongs_to :employee, dependent: :destroy
  belongs_to :admin_user, dependent: :destroy

  after_create :send_pay_slip

  def send_pay_slip
    return unless self.send_email
    PaySlipMailer.monthly(self.employee, self).deliver_now!
  end
end
