# The Answer

## 概要
質問投稿、回答投稿サイトです。  
分からない事、困っている事、悩み事などなんでも質問することが出来ます。  
また、他の人の質問を回答し、質問者からベストアンサーに選ばれると、報酬として  
質問者からポイントを獲得することが出来ます。  
<img width="1439" alt="スクリーンショット 2021-09-19 18 51 46" src="https://user-images.githubusercontent.com/65806493/133923125-71f92be6-acbc-496f-b537-c4c88ad0985c.png">

## 設計図
### ER図
<img width="525" alt="スクリーンショット 2021-09-19 15 03 27" src="https://user-images.githubusercontent.com/65806493/133917243-28ef7af5-178b-4b99-a56f-5ff33258bc2c.png">

### UIFlow
<img width="686" alt="スクリーンショット 2021-09-20 12 17 21" src="https://user-images.githubusercontent.com/65806493/133953975-0bf04bb4-c1e0-439b-ab01-726652942786.png">

## 機能一覧
- ユーザー登録、ユーザーログイン機能(devise)
- 退会機能
- 質問機能
  - 投稿
  - 受付可否機能(ajax)
  - ベストアンサー選択(ポイント減)
- 回答機能
  - 投稿
  - ベストアンサーに選ばれる(ポイント増)
- 検索機能
  - 絞り込み検索
- 通知機能


## 使用技術
- OS：Linux(CentOS)
- 言語：HTML, CSS, JavaScript, Ruby(2.6.3), Sqlite(3.7.17)
- CSSフレームワーク：Bootstrap
- フレームワーク：Ruby on Rails(5.2.6)
- JSライブラリ：jQuery
- IDE：Cloud9