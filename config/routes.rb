Spree::Core::Engine.routes.draw do
  resources :press_clippings, path: 'press'

  namespace :admin do
    resources :press_clippings
  end
end
