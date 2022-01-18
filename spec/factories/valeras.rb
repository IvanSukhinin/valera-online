FactoryBot.define do
  factory :valera do
    user_id { 1 }
    health { 100 }
    mana { 100 }
    cheerfulness { 10 }
    fatigue { 100 }
    money { 100 }
    date { '2021-12-04 23:45:53' }
  end
end
