Rails.application.routes.draw do

  namespace :api, :default => {format: :json} do
    namespace :v1 do 
      get "/trains" => "trains#trains_info"
      get "/trains/:train_no" => "trains#train_info"

      post "/reservations" => "reservations#create"
      # request_params {
      #   train_no:
      #   date: 
      #   ori_station:
      #   des_station:
      # } => create!
      
      # respond {
        #   # success / fail
        # }
        patch "/reservations/:id" => "reservations#update"
        # request params {
        # reservation_code:
        #   train_no:
        #   ori_station:
        #   des_station:
        #   * ori_stop_time_id:
        #   * des_stop_time:
      # } => update!
        
      get "/reservations/:id" => "reservations#show"
      # request params {
        # reservation_code
        # }
        
      # request_params {
        #   reservation_code:
        #   train_no:
        #   ori_station: {ori_stop_time}
        #   des_station: {des_stop_time}
        # } 
          
      delete "/reservations/:id" => "reservations#destroy"
      # request_params {
        # reservation_code
        # }

      # respond params {
        #   # success / fail
        # }



    end

  end

end
