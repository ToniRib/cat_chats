import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Message } from './Message';

class Conversation extends Component {
  state = {
    newMessage: '',
  };

  updateNewMessageValue(event) {
    this.setState({ newMessage: event.target.value });
  }

  handleSend() {
    const { newMessage } = this.state;
    const { postMessage } = this.props;

    postMessage(newMessage);

    this.setState({ newMessage: '' });
  }

  render() {
    const { displayName, messages } = this.props;
    const { newMessage } = this.state;

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
        <textarea id="new-message" value={newMessage} onChange={this.updateNewMessageValue.bind(this)} />
        <button onClick={this.handleSend.bind(this)}>Send</button>
      </div>
    )
  }
}

Conversation.propTypes = {
  displayName: PropTypes.string.isRequired,
  messages: PropTypes.array.isRequired,
  postMessage: PropTypes.func.isRequired,
};

export { Conversation };
