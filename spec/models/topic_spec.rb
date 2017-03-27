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

  it 'does not save when votes are nil' do
    topic = build(:topic, votes: nil)
    expect(topic.save).to be false
  end

  it 'saves with positive, zero, or negative votes' do
    (-5..5).each do |v|
      topic = build(:topic, title: "#{v} votes topic", votes: v)
      expect(topic.save).to be true
    end
  end
end
