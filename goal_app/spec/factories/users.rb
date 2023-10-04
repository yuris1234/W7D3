FactoryBot.define do
  factory :user do
    username{Faker::Movies::HarryPotter.character}
    passwprd{"password"}
  end
end
