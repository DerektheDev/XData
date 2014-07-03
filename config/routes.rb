require 'api_constraints'

Xdata::Application.routes.draw do

  devise_for :users
  root to: "api/v1/team_members#index"

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :assignments, :clients,
                :opportunities, :practices,
                :roles, :users
      resources :team_members do
        collection do
          get 'named/:name', to: 'team_members#named'
        end
      end
    end
  end
end
