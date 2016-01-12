class Charge < ActiveRecord::Base
  belongs_to :user
  enum role: [:standard, :premium, :admin]

end
