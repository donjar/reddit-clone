class TopicsController < ApplicationController
  def index
    @topics = Topic.order(votes: :desc).limit(20)
  end

  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.new(topic_params)

    if topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def upvote
    topic = Topic.find params[:id]
    topic.update(votes: topic.votes + 1)
    redirect_to topics_path
  end

  def downvote
    topic = Topic.find params[:id]
    topic.update(votes: topic.votes - 1)
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
