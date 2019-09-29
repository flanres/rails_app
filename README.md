# README
ビリヤード動画まとめサイトポートフォリオ。
Youtube APIを使用し最新ビリヤード動画情報を
取得し一覧表示する。
下記に実装済み機能を〇、未実装機能を△に記す

# heroku
https://obscure-sands-63579.herokuapp.com/

## 開発環境
- Ruby 2.4.1
- rails 5.2.3
- google-api-client 0.8.6
- optimist 3.0.0

- RDBMS
  - Production
    - postgresql 11.4
  - development
    - sqlite3 1.3.13

- Web Server
  - puma 3.12.1


## 機能
- 〇ユーザのCRUD機能(新規作成、編集、削除、一覧、検索)
- 〇ユーザ一覧のページネーション機能(kaminari)
- △ユーザ検索のインクリメントサーチ機能(Javascriptで一部実装)
- 〇外部APIによる動画情報取得機能(google-api-client)
- 〇取得動画CRUD機能(新規作成、削除、一覧)
- 〇動画タイトル一覧表示機能
- 〇動画サムネイル表示機能
- 〇動画ページリンク機能
- △動画コメントのCRUD機能(新規作成、編集、削除、一覧)
- 〇ログイン・ログアウト機能
- 〇ログイン状況に応じた表示切替
- △テスト機能(Rspecで一部実装)

