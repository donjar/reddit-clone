# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  votes      :integer          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_title  (title) UNIQUE
#  index_topics_on_votes  (votes)
#

class Topic < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :votes, presence: true

  before_validation do
    # Set default votes
    self.votes ||= 0
  end
end
