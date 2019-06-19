import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { SelectableConversation } from './SelectableConversation';

class ConversationList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      activeConversations: props.activeConversations,
    }
  }

  renderConversations() {
    const { activeConversations } = this.state;

    return activeConversations.map(conversation => {
      return (
        <SelectableConversation
          key={conversation.id}
          id={conversation.id}
          displayName={conversation.displayName}
        />
      )
    });
  }

  render() {

    return (
      <div id="conversation-list">
        <h3>Active Conversations</h3>
        {this.renderConversations()}
      </div>
    );
  }
}

ConversationList.propTypes = {
  activeConversations: PropTypes.array,
};

ConversationList.defaultProps = {
  activeConversations: [],
};

export { ConversationList };
