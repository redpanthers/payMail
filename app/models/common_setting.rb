class CommonSetting < ActiveRecord::Base
  def first
    find(1)
  end
end
