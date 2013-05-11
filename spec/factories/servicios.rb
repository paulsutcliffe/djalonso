# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :servicio do
    nombre "MyString"
    descripcion "MyText"
    equipos "MyText"
  end
end
