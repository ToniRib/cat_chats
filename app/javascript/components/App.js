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

  componentDidMount() {
    setInterval(() => {
      const { selectedConversation } = this.state;

      if (selectedConversation) this.getConversation(selectedConversation.id);
    }, 1000);
  }

  getConversation(conversationId) {
    $.ajax({
      method: 'GET',
      url: `/conversation/${conversationId}`,
      dataType: 'json',
    }).then(({ messages }) => {
      this.setState({ messages: messages });
    });
  }

  postMessage(messageBody) {
    const { selectedConversation: { id } } = this.state;

    $.ajax({
      method: 'POST',
      url: `/conversation/${id}/messages`,
      dataType: 'json',
      data: {
        message: {
          body: messageBody,
        }
      }
    }).then(({ message }) => {
      const { messages } = this.state;

      this.setState({ messages: [...messages, message] });
    });
  }

  selectConversation(conversation) {
    this.setState({ selectedConversation: conversation });
    this.getConversation(conversation.id);
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
            postMessage={this.postMessage.bind(this)}
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
