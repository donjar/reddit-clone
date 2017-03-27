# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string
#  votes      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
end
