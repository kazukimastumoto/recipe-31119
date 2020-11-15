テーブル設計

users テーブル

|  Column                   | Type    | Options     |
| ------------------------- | ------- | ----------- |
| email                     | string  | null: false |
| encrypted_password        | string  | null: false |
| nickname                  | string  | null: false |
| profile                   | string  | null: false |

Association
- has_many :recipes
- has_many :likes, dependent: :destroy
- has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
- has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


recipesテーブル

|  Column                   | Type      | Options     |
| ------------------------- | --------- | ----------- |
| title                     | string    | null: false |
| price                     | integer   | null: false |
| body                      | text      | null: false |
| user                      |references | null: false |

Association
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :notifications, dependent: :destroy


likesテーブル(中間テーブル)

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| user                      | integer    | null: false |
| recipe                    | integer    | null: false |

Association
- belongs_to :user
- belongs_to :recipe


Notificationsテーブル

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| visitor_id                | integer    | null: false |
| visited_id                | integer    | null: false |
| recipe_id                 | integer    | null: false |
| action                    | string     | null: false |
| checked                   | boolean    | null: false |

Association
- belongs_to :post, optional: true
- belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
