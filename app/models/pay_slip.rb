class PaySlip < ActiveRecord::Base
  belongs_to :employee, dependent: :destroy
  belongs_to :admin_user, dependent: :destroy
end
