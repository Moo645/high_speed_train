class TrainsParams
  def initialize(params)
    @params = params
  end

  def perform
    day_week
    direction
    @params.permit!
    return @params
  end

  private
  def day_week
    day = Hash.new
    day[@params[:date].to_date.strftime("%A").downcase!] = 1
    @params.merge!(day_week: day)
  end

  def direction
    dir = 0 
    dir = 1 if @params[:start_station].to_i > @params[:end_station].to_i
    @params.merge!(direction: dir)
  end

end