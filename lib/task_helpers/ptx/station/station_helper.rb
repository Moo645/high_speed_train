class StationData
  def initialize(api_datas)
    @station = Station.all
    @api_datas = api_datas
  end
  
  def create_or_update
    
    @api_datas.each do |d|
      # find pair datas 
      station = @station.find_by(station_uid: d['StationID'])
      if station.nil?
        # create station
        Station.create(pairs_data(d))
        puts " - #{d['StationName']['Zh_tw']} 站: + 創建成功！"
        
      elsif station.version <  d['VersionID']
        # updata data
        station.update(pairs_data(d))
        puts " - #{d['StationName']['Zh_tw']} 站: > 更新成功！"
        
      else 
        puts " - #{d['StationName']['Zh_tw']} 站: - 無需更新！"

      end
    end
  end
  
  private
  def pairs_data(d)
    station = {
      :station_uid => d['StationID'],
      :station_name => d['StationName'],
      :station_code => d['StationCode'],
      :version => d['VersionID']
    }
  end

end
