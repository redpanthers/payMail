require 'faker'

FactoryGirl.define do
  factory :employee do
    name Faker::Name.name
    date_of_birth Faker::Date.backward(100)
    date_of_joining Faker::Date.backward(50)
    pancard 'BLPRA1409R'
    bank_account_number Faker::Number.number(16)
    bank_name Faker::Team.name
    bank_ifsc_code Faker::Number.number(16)
    bank_branch_name Faker::Team.state
    address Faker::Bitcoin.address
    email_address Faker::Internet.email
    employee_id Faker::Number.number(7)
    designation Faker::Company.profession
    pf_account Faker::Number.number(16)
    esi_account Faker::Number.number(16)
    fathers_name Faker::Name.name
  end
end
