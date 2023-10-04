FactoryBot.define do
  factory :user do
    username{Faker::Movies::HarryPotter.character}
    password{"password"}
    # session_token{"kasdjfk1209"}
  end
end
