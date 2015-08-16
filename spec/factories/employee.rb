FactoryGirl.define do
  factory :employee do
    name 'Employee 1'
    date_of_birth '1990-03-04'
    date_of_joining '2015-03-04'
    pancard 'BLPRA1409R'
    bank_account_number '0046104000045672'
    bank_name 'Federal Bank'
    bank_ifsc_code 'FBRL007896'
    bank_branch_name 'Chembumukku'
    address ''
    email_address 'anything@me.com'
  end
end
