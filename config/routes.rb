Rails.application.routes.draw do
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

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "courts#index"
end
