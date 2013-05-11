# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contacto do
    nombre "MyString"
    telefono "MyString"
    email "MyString"
    mensaje "MyText"
  end
end
