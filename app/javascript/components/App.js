import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { ConversationList } from './ConversationList';
import { Conversation } from './Conversation';
import { TopBanner } from './TopBanner';
import $ from 'jquery';

class App extends Component {
  state = {
    selectedConversation: undefined,
    messages: [],
  };

  getMessages(conversationId) {
    $.ajax({
      method: 'GET',
      url: `/conversation/${conversationId}`,
      dataType: 'json',
    }).then(({ messages }) => {
      this.setState({ messages: messages });
    });
  }

  selectConversation(conversation) {
    this.setState({ selectedConversation: conversation });
    this.getMessages(conversation.id);
  }

  render() {
    const { selectedConversation, messages } = this.state;
    const { userDisplayName, activeConversations } = this.props;

    return (
      <div>
        <TopBanner userDisplayName={userDisplayName}/>
        <ConversationList
          activeConversations={activeConversations}
          selectConversation={this.selectConversation.bind(this)}
        />
        {selectedConversation && (
          <Conversation
            displayName={selectedConversation.displayName}
            messages={messages}
          />
        )}
      </div>
    );
  }
}

App.propTypes = {
  userDisplayName: PropTypes.string.isRequired,
};

App.defaultProps = {
  activeConversations: [],
};

export default App;
