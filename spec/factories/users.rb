FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"111111k"}
    password_confirmation {password}
  end
end
