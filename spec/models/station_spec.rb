require 'rails_helper'

RSpec.describe Station, type: :model do
  context "因為資料都從API匯入的，所以要測試的是：" do
    it '輸出的資料是否是整理好的'
    it '在不想UI要長怎樣, 我station_name就弄成json格式！'
  end
  
end
