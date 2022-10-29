# Trip with
<img width="500" alt="Trip-with" src="https://user-images.githubusercontent.com/110372008/198506175-9a02ede6-1568-4627-a75b-967f27a2d14d.png">
URL: http://trip-with.site/


## 概要
旅行の記録・共有ができるコミュニティサイト

## 制作背景
私はあまり旅行の経験がなく、行ってみたいスポットを見つけても、  
「その他の時間をどう過ごせばいいかわからない」と実際に訪れたことはあまり多くありません。  
既存サービスの投稿を参考にしようとしても、時系列で訪れたスポット追うことは難しく、  
他人の旅行記録を参考にしたいという思いから、本サイトを作成しました。

## ターゲットユーザー
* 他の人の旅行記録を参考にしたい人
* 旅行記録を詳細にまとめたい人

## 利用シーン
* 旅行の計画を立てる時に他の人の経験を参考にする
* 旅行の内容を詳細にまとめる

## 利用イメージ

### 新規投稿
- 入力した開始日・終了日に応じて日数分のフォームを作成
- スポットの入力フォームは非同期で追加・削除

![利用イメージ（新規投稿）](https://user-images.githubusercontent.com/110372008/198818593-52225b72-12de-4f21-9f98-cca41a536c2e.gif)


### お気に入り/コメント
- お気に入り/コメントは非同期で反映

![利用イメージ（お気に入り・コメント）](https://user-images.githubusercontent.com/110372008/198818611-f03d66f9-266e-491d-ac39-708b58928f10.gif)


### キーワード/都道府県検索
- タイトル/スポット名でのキーワード検索
- 都道府県毎の投稿表示

![利用イメージ（検索）](https://user-images.githubusercontent.com/110372008/198818615-06b5f8a4-a05f-432d-8e4d-665704ef6633.gif)



### ユーザー管理機能
- 管理者ログイン
- ユーザーの投稿・コメントの閲覧/削除
- ユーザー退会処理

![利用イメージ（管理者機能）](https://user-images.githubusercontent.com/110372008/198818618-50830a5c-e7ee-4e19-9e34-a08aa2939467.gif)



### ゲストログイン
- ゲストユーザーのみ登録情報の編集不可
- ゲストユーザーの投稿・コメント・お気に入りはバッチ処理により1時間毎に削除

![利用イメージ（ゲストログイン）](https://user-images.githubusercontent.com/110372008/198818624-8e31effd-ce6b-4aa9-bf2e-3e5912efa6fa.gif)






## 設計書
* [ER図](https://user-images.githubusercontent.com/110372008/198513579-8fdcea25-66e5-426f-9ec0-0a6dfcdc33ac.jpg)
* [テーブル設計書](https://docs.google.com/spreadsheets/d/1FHSMH2L4eSKR286_IrhDxSNT3yjUx_cm0HPaY5tvI9w/edit?usp=sharing)
* [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1YLHmrH8g3O1oFGjosCazGE7Yk2-a9kIMer0hazdTD8s/edit?usp=sharing)







## 使用素材
photo AC 写真のフリー素材サイト(背景画像及びテスト投稿スポット画像)  
https://www.photo-ac.com/  


ICOOON MONO(テストユーザープロフィールアイコン)  
https://icooon-mono.com/about-icoon-mono/



## 使用技術
- Ruby 3.1.2
- Rails 6.1.7
- MySQL
- Nginx
- Puma
- AWS
  - EC2
  - RDS
- gem 'devise'
- gem 'cocoon'
- gem 'whenever'
- gem 'kaminari','~> 1.2.1'
- gem 'image_processing'
- Bootstorap 4.5
- Font Awesome



## 機能一覧
- ゲストログイン機能
- バッチ処理（ゲストユーザー投稿等削除）
- 会員登録機能
- 投稿機能
- 下書き機能
- キーワード検索（タイトル/スポット)
- 都道府県検索
- お気に入り機能
- コメント機能
- ユーザー管理機能
  - 管理者ログイン
  - 投稿管理/削除機能
  - コメント管理/削除機能
  - ユーザー退会処理
  
