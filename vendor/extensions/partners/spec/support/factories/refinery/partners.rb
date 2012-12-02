
FactoryGirl.define do
  factory :partner, :class => Refinery::Partners::Partner do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

