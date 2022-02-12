Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'vi' do
      resources :posts
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
