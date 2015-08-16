FactoryGirl.define do
  factory :pay_slip do
    association :employee
    admin_user_id nil
    send_email false
    total_emails_send nil
    last_email_send_at nil
    salary 30000
    no_of_leaves 1
    total_working_days nil
    month 'January'
    year '2015'
  end
end