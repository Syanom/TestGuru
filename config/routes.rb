Rails.application.routes.draw do
  get 'users/new'

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :gists, only: :create
  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

  resources :test_completions, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        patch :update_inline, on: :member

        resources :answers, except: :index, shallow: true do
          patch :update_inline, on: :member
        end
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end
