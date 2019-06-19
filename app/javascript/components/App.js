import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { ConversationList } from './ConversationList';
import { Conversation } from './Conversation';
import { TopBanner } from './TopBanner';

class App extends Component {
  state = {
    selectedConversation: undefined,
  };

  selectConversation(conversation) {
    this.setState({ selectedConversation: conversation });
  }

  render() {
    const { selectedConversation } = this.state;
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
            id={selectedConversation.id}
            displayName={selectedConversation.displayName}
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
