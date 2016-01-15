# == Schema Information
#
# Table name: charges
#
#  id         :integer          not null, primary key
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Charge < ActiveRecord::Base
  belongs_to :user
  enum role: [:standard, :premium, :admin]

end
