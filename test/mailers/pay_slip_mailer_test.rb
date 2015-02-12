require 'test_helper'

class PaySlipMailerTest < ActionMailer::TestCase
  test "monthly" do
    mail = PaySlipMailer.monthly
    assert_equal "Monthly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
