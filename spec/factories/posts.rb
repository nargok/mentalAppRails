# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:title) { |i| "title#{i}" }
    sequence(:content) { |i| "content#{i}" }

    factory :invalid_post do
      title nil
    end
  end

end
