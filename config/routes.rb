Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resource :mail_setting, only: [:edit, :update] do
      post :testmail, on: :collection
    end
  end
end
