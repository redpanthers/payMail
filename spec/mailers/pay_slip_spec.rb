require 'rails_helper'
 
RSpec.describe PaySlipMailer do
  describe 'Montly Pay Slip Mailer' do

    before do
      FactoryGirl.create(:common_setting)
      @employee = FactoryGirl.create(:employee)
      @pay_slip = FactoryGirl.create(:pay_slip, send_email: true)
      @mail = ActionMailer::Base.deliveries.last
    end

    it 'renders the subject' do
      expect(@mail.subject).to eql("Salary for the month of #{@pay_slip.month}, #{@pay_slip.year}")
    end
 
    it 'renders the receiver email' do
      expect(@mail.to).to eql([@employee.email_address])
    end
 
    it 'attachment?' do
      expect(@mail.attachments.count).to eql(1)
      expect(@mail.attachments.first.filename).to eql("payslip_#{@pay_slip.month}-#{@pay_slip.year}.pdf")
    end
  end
end