FactoryGirl.define do
  factory :common_setting do
    email_template "Dear {{name}},\r\n<br><br>\r\nYour salary for the month of {{month}} has been transferred to the bank account that you shared with us at the time of joining. The salary, as calculated in the attached document, should be credited to your account before the end of the day. Do confirm when you receive the said amount by replying back to the email.<br>\r\n<br>\r\nThank you for the hard work you have put in so far.<br>\r\n<br><br>\r\n\r\nregards,\r\n<br><br>\r\n\r\nname ,<br>\r\ndesignation,<br>\r\nYour Software Solutions."
    pdf_template "Dear {{name}},\r\n\r\nYour salary for the month of {{month}}, {{year}} is : {{salary}}.\r\n\r\nTotal number of leaves taken during this month is : {{no_of_leaves}}.\r\n\r\nYour salary has been transferred to your bank account ({{bank_account}}) at {{bank_name}}. Incase you haven't received the salary kindly contact you@me.com\r\n\r\n\r\nregards,\r\n\r\nName,\r\nDesignation,\r\nYour Software Solutions."
    cc_address 'you@me.com'
    bcc_address nil
  end
end