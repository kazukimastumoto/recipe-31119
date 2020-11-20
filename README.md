
# アプリケーション名：Savings Recipe


# 概要
- ユーザーは新規登録することができます。
- ユーザーは登録情報を変更する事ができます。
- 新規登録したユーザーは自分が作った料理のレシピを投稿することができます。
- ユーザーは自分のレシピを保存でき、いつでも確認する事ができます。
- ユーザー本品が作成したレシピを編集及び削除することができます。
- ユーザーは投稿したレシピを他者から、いいね（お気に入り）で評価をうける事ができます。
- ユーザーはしたユーザーは他者のレシピに、いいね（お気に入り）する事ができます。
- いいねされたユーザーは、通知されます。
- ユーザーは他者のレシピをいいね（お気に入り）していれば、何時でも確認する事ができます


# URL(本番環境)


# テスト用アカウント
- E-mail：test@test.com
- Password:111111k


# 利用方法
- レシピを投稿する場合や、いいね（お気に入り）したい場合は、ユーザー登録をする必要があります。
- レシピを閲覧するだけであれば、ユーザー登録をする必要はありません。


# 目指した課題解決

## ペルソナ設定
- 20代 男女 1人暮らし

## 課題
- 20代で生活費を押さえながらも、美味しい料理を食べたい方に対して、レシピを提供します。


# 洗い出した要件

## 機能
- レシピ投稿機能
- ユーザー管理機能
- 画像投稿機能
- レシピ編集機能
- レシピ削除機能
- SNS認証機能
- いいね機能
- 通知機能
- 検索機能

## 目的
- ユーザーがおすすめレシピを投稿できるよう実装します。
- ユーザーが新規登録できるよう実装します。
- レシピで完成せれた料理の写真及び画像を投稿できるよう実装します。
- 公開されているレシピを編集できるように実装します。
- 公開されているレシピを削除できるように実装します。
- SNS認証を導入し、ユーザー登録方法の選択肢を増やせるよう実装します。
- 公開されているレシピにいいね（お気に入り）することができるよう実装します。
- いいねされた場合に通知が届くように実装します。
- 公開されているレシピをユーザーが検索できるように実装します。

## 詳細
- 必要な情報を記入しクリックしたら、レシピが投稿できます。
- Deviseの導入しユーザーを管理する事ができます。
- Active Storageを用いて、レシピを投稿する際に写真や画像を添付することができます。
- 投稿した本人のレシピをクリックすると情報を編集できます。
- 投稿した本人のレシピをクリックすると情報を削除できます。
- SNSアカウント（Googleアカウン、Facebookアカウント）を利用したログイン方法を選択肢として追加します。
- 投稿されているレシピに対して、いいねをする事ができます。
- ユーザー自身が投稿したレシピについて「いいね」された場合通知されるようにします。
- ユーザーが目的のレシピを検索できるようにします。


# 実装した機能についての説明
## ユーザーはレシピを投稿するすることができます。
[![Image from Gyazo](https://i.gyazo.com/b1c712009bfdcae1a43404927d5293a2.gif)](https://gyazo.com/b1c712009bfdcae1a43404927d5293a2)


## ユーザーはいいね（お気に入り）をすることができます。また、解除することができます。
[![Image from Gyazo](https://i.gyazo.com/3de08ff518f5b5c802cca4a3fd2a5dbb.gif)](https://gyazo.com/3de08ff518f5b5c802cca4a3fd2a5dbb)


## いいねされたユーザーは、通知されます。
[![Image from Gyazo](https://i.gyazo.com/b837f4d9de33e7188664bfc0d19783af.gif)](https://gyazo.com/b837f4d9de33e7188664bfc0d19783af)


## レシピを検索することができます。
[![Image from Gyazo](https://i.gyazo.com/c96561156efae81924f514e47045155b.gif)](https://gyazo.com/c96561156efae81924f514e47045155b)



# 実装予定の機能
- いいねしたレシピの一覧表示
- フォロー機能
- コメント機能
- メッセージ機能


# テーブル設計

## users テーブル

|  Column                   | Type    | Options     |
| ------------------------- | ------- | ----------- |
| email                     | string  | null: false |
| encrypted_password        | string  | null: false |
| nickname                  | string  | null: false |
| profile                   | string  | null: false |

### Association
- has_many :recipes
- has_many :likes, dependent: :destroy
- has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
- has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
- has_many :sns_credentials


## recipesテーブル

|  Column                   | Type      | Options     |
| ------------------------- | --------- | ----------- |
| title                     | string    | null: false |
| price                     | integer   | null: false |
| body                      | text      | null: false |
| user                      |references | null: false |

### Association
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :notifications, dependent: :destroy


## likesテーブル

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| user                      | integer    | null: false |
| recipe                    | integer    | null: false |

### Association
- belongs_to :user
- belongs_to :recipe


## notificationsテーブル

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| visitor_id                | integer    | null: false |
| visited_id                | integer    | null: false |
| recipe_id                 | integer    | null: false |
| action                    | string     | null: false |
| checked                   | boolean    | null: false |

### Association
- belongs_to :post, optional: true
- belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true


## sns_credentials

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| provider                  | string     | null: false |
| uid                       | string     | null: false |

### Association
- belongs_to :user

# ER図
[![Image from Gyazo](https://i.gyazo.com/d42ed9b95042ca192971fb093cc94f19.png)](https://gyazo.com/d42ed9b95042ca192971fb093cc94f19)
