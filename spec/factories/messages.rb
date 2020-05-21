FactoryBot.define do
  factory :message do
    text { "To be or not to be" }

    before(:create) { |message|
      message.chat << FactoryBot.create(:chat)
    }
    association :user
  end
end
