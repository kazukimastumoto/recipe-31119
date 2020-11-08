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


likesテーブル(中間テーブル)

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| user                      | references | null: false |
| recipe                    | references | null: false |

Association
- belongs_to :user
- belongs_to :recipe
