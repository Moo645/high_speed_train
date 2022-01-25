class TimeTableData
  def initialize(api_datas)
    @versions = Version.all
    @api_datas = api_datas
  end

  def create_or_update
    seeding_version
    puts " ------------------------------------- "
    seeding_trains
    puts " ------------------------------------- "
    seeding_stop_times

  end

  def seeding_version
    @api_datas.each do |d|
    # find pair datas 
    current_version = @versions.find_by(version_no: d['VersionID'])
      if current_version.nil?
        # create station
        Version.create(pairs_version(d))
        puts " - Version - #{d['VersionID']} : + 創建成功！"
      end
    end
    puts " - 目前最新版本為： #{Version.last.version_no} "

  end

  def seeding_trains
    @current_version = Version.last

    @api_datas.each do |d|
      api_no = d['GeneralTimetable']['GeneralTrainInfo']['TrainNo']
      current_train = @current_version.trains.find_by(train_no: api_no)

      if current_train.nil?
        current_train = @current_version.trains.create(pairs_train(d))
        puts " - 車次：#{current_train.train_no} + 創建成功！"
      else
        current_train.update(pairs_train(d))
        puts " - 車次：#{api_no} - 更新成功！"
      end
    end

  end

  def seeding_stop_times
    @api_datas.each do |d|
      @current_train = Train.find_by(train_no: d["GeneralTimetable"]["GeneralTrainInfo"]["TrainNo"])
      stop_times = d["GeneralTimetable"]["StopTimes"] # => Array
      
      stop_times.each do |s|
        current_station = Station.find_by(station_uid: s["StationID"])
        @current_train.stop_times.create(
          :station_id => current_station.id,
          :stop_sequence => s["StopSequence"],
          :arrival_time => s["ArrivalTime"],
          :departure_time => s["DepartureTime"]
        )
      end
      puts " - 車次：#{@current_train.train_no} 創建成功"
    end
  end

  private
  def pairs_version(d)
    version = {
      :update_time => d['UpdateTime'],
      :effective_date => d['EffectiveDate'],
      :expiring_date => d['ExpiringDate'],
      :version_no => d['VersionID']
    }
  end

  def pairs_train(d)
    train = {
      :train_no => d['GeneralTimetable']['GeneralTrainInfo']['TrainNo'],
      :direction => d['GeneralTimetable']['GeneralTrainInfo']['Direction'],
      :service_day => d['GeneralTimetable']['ServiceDay'].values
    }
  end

end
