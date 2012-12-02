Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :partners do
    resources :partners, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :partners, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :partners, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
