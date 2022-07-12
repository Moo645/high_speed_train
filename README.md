第三方API:
> 高鐵官網：https://www.thsrc.com.tw/
> 高鐵API：https://ptx.transportdata.tw/PTX/Service?searchword=%E9%AB%98%E9%90%B5

目標：
1. 串接高鐵提供的API 取得資料 
  1.1 可以將靜態資訊存入資料庫 （車次資訊）
  1.2 可以獲取動態資料, 即時更新於頁面上 （車票剩餘資訊）

2. 設計查詢方式, 將獲取的靜態合理展示於頁面上 （車次查詢）
  2.1 可以查詢有哪些列車
  2.2 可以查詢特定列車是否還有票

3. 訂票系統
  3.1 可以訂票, 並得到票號 （隨機產生票號）
  3.2 可以用票號查詢訂票資訊
  3.3 可以用票號修改訂票資訊
  3.4 可以用票號取消訂票資訊

4. optional
  4.1 會員系統 （車票綁會員）
  4.2 前端實作 （ajax, 任意框架）

Models 規劃：
1. Train (has_many :reservations)
2. Reservation (belong_to :train) (train_id:references)

RESTful API 規劃：

| Endpoints                  | Verb   | Description    
|----------------------------|--------|--------------- 
| api/v1/trains              | GET    | 查詢所有列車資訊   
| api/v1/trains/:tid         | GET    | 查詢特定列車資訊   
| api/v1/reservations        | POST   | 新增訂票資訊     
| api/v1/reservations/:rid   | GET    | 查詢該訂票資訊   
| api/v1/reservations/:rid   | PUT    | 修改該訂票資訊   
| api/v1/reservations/:rid   | DELETE | 刪除該訂票資訊   

