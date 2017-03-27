# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  votes      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_title  (title) UNIQUE
#  index_topics_on_votes  (votes)
#

FactoryGirl.define do
  factory :topic do
    title 'Just a topic'
    votes 0
  end
end
