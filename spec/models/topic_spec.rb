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

require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'saves on valid model' do
    topic = build(:topic)
    expect(topic.save).to be true
  end

  it 'does not save on nil title' do
    topic = build(:topic, title: nil)
    expect(topic.save).to be false
  end

  it 'does not save when title is not unique' do
    create(:topic, title: 'Hi')
    topic = build(:topic, title: 'Hi')
    expect(topic.save).to be false
  end

  it 'has a title length of at most 255' do
    (250..260).each do |l|
      topic = build(:topic, title: 'i' * l)

      expect(topic.save).to be(l <= 255)
    end
  end

  it 'saves with positive, zero, or negative votes' do
    (-5..5).each do |v|
      topic = build(:topic, title: "#{v} votes topic", votes: v)
      expect(topic.save).to be true
    end
  end

  it 'has a default value of 0 votes' do
    topic = create(:topic)
    expect(topic.votes).to eq 0
  end
end
