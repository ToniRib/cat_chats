import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { ConversationList } from './ConversationList';
import { TopBanner } from './TopBanner';

class App extends Component {
  render() {
    const { userDisplayName, activeConversations } = this.props;

    return (
      <div>
        <TopBanner userDisplayName={userDisplayName}/>
        <ConversationList activeConversations={activeConversations} />
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
