require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe 'GET #index' do
    it 'does it successfully' do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe 'GET #new' do
    it 'does it successfully' do
      get :new
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST #create' do
    it 'redirects to topics_path' do
      post :create, params: { topic: { title: 'Hello World' } }
      expect(response).to redirect_to topics_path
    end

    it 'adds a new topic' do
      post :create, params: { topic: { title: 'Hello World' } }
      expect(Topic.where(title: 'Hello World').count).to eq 1
    end
  end

  describe 'PATCH #upvote' do
    it 'redirects to topics_path' do
      topic = create(:topic)
      patch :upvote, params: { id: topic.id }
      expect(response).to redirect_to topics_path
    end

    it 'increments topic votes' do
      topic = create(:topic)
      votes = topic.votes

      patch :upvote, params: { id: topic.id }
      topic.reload
      expect(topic.votes).to eq(votes + 1)
    end
  end

  describe 'PATCH #downvote' do
    it 'redirects to topics_path' do
      topic = create(:topic)
      patch :downvote, params: { id: topic.id }
      expect(response).to redirect_to topics_path
    end

    it 'increments topic votes' do
      topic = create(:topic)
      votes = topic.votes

      patch :downvote, params: { id: topic.id }
      topic.reload
      expect(topic.votes).to eq(votes - 1)
    end
  end
end
