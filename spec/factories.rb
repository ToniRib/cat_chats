FactoryBot.define do
  factory :user do
    first_name { 'Ender' }
    last_name  { 'Wiggin' }
    username { 'enderwiggin' }
    password { 'dragonarmy' }
  end
end
