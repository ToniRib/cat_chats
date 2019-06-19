FactoryBot.define do
  factory :user, aliases: [:sender, :receiver] do
    first_name { 'Ender' }
    last_name  { 'Wiggin' }
    username { 'enderwiggin' }
    password { 'dragonarmy' }
  end

  factory :conversation do
    sender
    receiver
  end
end
