# The Answer

## 概要
質問投稿、回答投稿サイトです。
分からない事、困っている事、悩み事などなんでも質問することが出来ます。
また、他の人の質問を回答し、質問者からベストアンサーに選ばれると、報酬として
質問者からポイントを獲得することが出来ます。
<img width="1439" alt="スクリーンショット 2021-09-19 12 58 28" src="https://user-images.githubusercontent.com/65806493/133914951-06529bd3-d3fe-458d-9ae3-46cbc4314597.png">

## 設計図
<img width="548" alt="スクリーンショット 2021-09-19 13 21 27" src="https://user-images.githubusercontent.com/65806493/133915378-0dc22241-4ec1-4a40-bdb5-85eb139de66f.png">

## 機能一覧
- ユーザー登録、ユーザーログイン機能(devise)
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
- 退会機能


## 使用技術
- OS：Linux(CentOS)
- 言語：HTML, CSS, JavaScript, Ruby(2.6.3), Sqlite(3.7.17)
- CSSフレームワーク：Bootstrap
- フレームワーク：Ruby on Rails(5.2.6)
- JSライブラリ：jQuery
- IDE：Cloud9