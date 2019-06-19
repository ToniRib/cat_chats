FactoryBot.define do
  factory :user, aliases: [:sender, :receiver] do
    first_name { 'Ender' }
    last_name  { 'Wiggin' }
    sequence(:username) { |i| "enderwiggin_#{i}" }
    password { 'dragonarmy' }
  end

  factory :conversation do
    sender
    receiver
  end
end
