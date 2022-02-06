Rails.application.routes.draw do

  namespace :api, :default => {format: :json} do
    namespace :v1 do 
      get "/trains" => "trains#trains_info", as: :trains_info 
      get "/trains/:train_no" => "trains#train_info", as: :train_info
    end

  end

end
