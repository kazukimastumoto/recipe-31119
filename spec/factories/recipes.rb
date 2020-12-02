FactoryBot.define do
  factory :recipe do
    title           {"テスト"}
    price           {300}
    material        {"テスト"}
    body            {"テスト"}
    association :user

    after(:build) do |it|
      it.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
