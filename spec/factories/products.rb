# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product1, :class => Product do
    name "Dog"
    description "A fluffy animal."
    price 12
  end

  factory :product2, :class => Product do
    name "Cat"
    description "Vincent."
    price 15
  end
end
