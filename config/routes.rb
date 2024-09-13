Rails.application.routes.draw do
  get "pages/home"
  devise_for :users

  resources :courts, only: [ :index ] do
    resources :bookings, only: [ :new, :create ] do
      member do
        get "payment"
      end
    end
  end

  # Define the route for the payment page
  get "payment/:id", to: "payments#show", as: "payment"

  # Additional routes for health check and PWA features
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Route for the homepage, pointing to the home action in a Pages controller
  get "home", to: "pages#home", as: :home

  # Set the homepage as the root route
  root "pages#home"
end
