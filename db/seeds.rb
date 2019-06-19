module CatChats
  class Seed
    include FactoryBot::Syntax::Methods

    def run
      create_users
      create_conversations
      create_messages
    end

    private

    def create_users
      @toni = create(:user, first_name: 'Toni', last_name: 'Rib', username: 'tonirib', password: 'kittens')
      @alia = create(:user, first_name: 'Alia', last_name: 'Atreides', username: 'aliaatreides', password: 'meow')
      @ziggy = create(:user, first_name: 'Ziggy', last_name: 'Rib', username: 'ziggyrib', password: 'kittenmittens')
      @grumpycat = create(:user, first_name: 'Grumpy', last_name: 'Cat', username: 'grumpycat', password: 'verygrumpy')
      @lilbub = create(:user, first_name: 'Lil', last_name: 'Bub', username: 'lilbub', password: 'tonguesout')
    end

    def create_conversations
      @toni_and_alia = create(:conversation, sender: @toni, receiver: @alia)
      @ziggy_and_toni = create(:conversation, sender: @ziggy, receiver: @toni)
      @grumpycat_and_lilbub = create(:conversation, sender: @grumpycat, receiver: @lilbub)
    end

    def create_messages
      create(:message, user: @toni, conversation: @toni_and_alia, body: 'Hello, super cute black cat!')
      create(:message, user: @alia, conversation: @toni_and_alia, body: 'Meow!')
      create(:message, user: @toni, conversation: @toni_and_alia, body: 'Do you want wet food?')
      create(:message, user: @alia, conversation: @toni_and_alia, body: 'Meow Meow!')

      create(:message, user: @ziggy, conversation: @ziggy_and_toni, body: 'Meeeeeerrrrr')
      create(:message, user: @toni, conversation: @ziggy_and_toni, body: 'I know, I will come pet you now.')

      create(:message, user: @grumpycat, conversation: @grumpycat_and_lilbub, body: 'I am grumpy.')
      create(:message, user: @lilbub, conversation: @grumpycat_and_lilbub, body: 'And my tongue is out!')
    end
  end
end

CatChats::Seed.new.run
