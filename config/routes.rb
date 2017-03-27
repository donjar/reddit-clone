Rails.application.routes.draw do
  root 'topics#index'

  resources :topics, only: [:index, :new, :create] do
    member do
      patch 'upvote', to: 'topics#upvote'
      patch 'downvote', to: 'topics#downvote'
    end
  end
end
