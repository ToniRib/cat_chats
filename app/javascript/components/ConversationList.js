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
    const { selectConversation } = this.props;

    return activeConversations.map(conversation => {
      return (
        <SelectableConversation
          key={conversation.id}
          id={conversation.id}
          displayName={conversation.displayName}
          onClick={() => selectConversation(conversation)}
        />
      )
    });
  }

  render() {
    return (
      <div id="conversation-list" className="col-sm-4">
        <h3>Active Conversations</h3>
        {this.renderConversations()}
      </div>
    );
  }
}

ConversationList.propTypes = {
  activeConversations: PropTypes.array,
  selectConversation: PropTypes.func.isRequired,
};

ConversationList.defaultProps = {
  activeConversations: [],
};

export { ConversationList };
