Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index create new show] do
    resources :reviews, only: %i[show new create] # Those routes needs restaurant_id
  end

  # resources :reviews, only: [ :show, :edit, :update, :destroy ] # those routes are not dependent of restaurant_id
end
