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
![利用イメージ（新規投稿）2](https://user-images.githubusercontent.com/110372008/198562468-db4f8439-411d-4778-a6ab-ad7acc336e35.gif)




## 設計書
* [ER図](https://user-images.githubusercontent.com/110372008/198513579-8fdcea25-66e5-426f-9ec0-0a6dfcdc33ac.jpg)
* [テーブル設計書](https://docs.google.com/spreadsheets/d/1FHSMH2L4eSKR286_IrhDxSNT3yjUx_cm0HPaY5tvI9w/edit?usp=sharing)
* [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1YLHmrH8g3O1oFGjosCazGE7Yk2-a9kIMer0hazdTD8s/edit?usp=sharing)







## 使用素材
photo AC 写真のフリー素材サイト(背景画像及びテスト投稿スポット画像)  
https://www.photo-ac.com/  


ICOOON MONO(テストユーザープロフィールアイコン)  
https://icooon-mono.com/about-icoon-mono/



## 言語/フレームワーク
* ruby 3.1.2
* Rails 6.1.7
* gem 'devise'
* gem 'bootstrap'
* gem 'kaminari'
* gem "enum_help"
* gem 'cocoon'
* gem 'image_processing'
* Font Awesome


## 機能一覧
* ゲストログイン機能
* 会員登録機能
* 投稿機能
* 投稿公開・非公開機能
* タグ検索
* キーワード検索
* いいね機能
* コメント機能
* 通知機能
* ユーザー管理機能
* コメント管理機能
