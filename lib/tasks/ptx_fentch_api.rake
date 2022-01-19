require 'task_helpers/ptx/ptx_api_helper.rb'
require 'task_helpers/ptx/station/station_helper.rb'

namespace :ptx do
    desc 'Fentch THSR stations data'
    task :station => :environment do
      
      uri = 'https://ptx.transportdata.tw/MOTC/v2/Rail/THSR/Station?$format=JSON'
      puts ' - 開始取得高鐵車站資訊...'
      puts " - fentch: #{uri} "
      response = PtxApiService.new.fentch_static_api(uri)
      puts " - HTTP code: #{response.code.to_s} 連接成功!" if response.code == 200
      api_datas = JSON.parse(response.body)
      puts " - 本次獲得 #{api_datas.count} 筆資料！"
      puts " ------------------------------------- "
      StationData.new(api_datas).create_or_update
      puts " ------------------------------------- "

    end
    
    
    desc 'update THSR general timetable'
    task :timetable do
      uri = 'https://ptx.transportdata.tw/MOTC/v2/Rail/THSR/GeneralTimetable?%24format=JSON'
      puts " - 開始取得高鐵定期時刻表..."
      puts " - fentching: #{uri} "
      response = PtxApiService.fentch_static_api(uri)
      puts " - HTTP code: #{response.code.to_s} 連接成功!" if response.code == 200
      

    end
    
  namespace :dynamic do
    desc 'fentch THSR avilable seats'
    task :seats do
      puts '開始取得剩餘座位資料'
    end

  end

end