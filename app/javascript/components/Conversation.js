import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Message } from './Message';

const Conversation = ({ displayName, messages }) => {
  return (
    <div id="active-conversation">
      <h4>{displayName}</h4>
      {messages.map(message => (
        <Message
          key={message.id}
          id={message.id}
          displayName={message.displayName}
          body={message.body}
          timeSent={message.timeSent}
        />)
      )}
    </div>
  )
};

Conversation.propTypes = {
  displayName: PropTypes.string.isRequired,
  messages: PropTypes.array.isRequired,
};

export { Conversation };
