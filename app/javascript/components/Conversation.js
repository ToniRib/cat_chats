import React, { Component } from 'react';
import PropTypes from 'prop-types';

class Conversation extends Component {
  render() {
    const { displayName } = this.props;

    return (
      <div id="active-conversation">
        <h4>{displayName}</h4>
      </div>
    )
  }
};

Conversation.propTypes = {
  id: PropTypes.number.isRequired,
  displayName: PropTypes.string.isRequired,
};

export { Conversation };
