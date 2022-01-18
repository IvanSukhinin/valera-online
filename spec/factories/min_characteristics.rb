FactoryBot.define do
  factory :min_characteristic do
    health { 0 }
    mana { 0 }
    cheerfulness { -10 }
    fatigue { 0 }
    money { -500 }
  end
end
