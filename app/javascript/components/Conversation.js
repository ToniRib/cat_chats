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

  handleKeyPress(e) {
    if (e.charCode === 13) this.handleSend();
  }

  render() {
    const { displayName, messages } = this.props;
    const { newMessage } = this.state;

    return (
      <div id="active-conversation"  className="col-sm-8">
        <h4>Conversation with {displayName}</h4>
        {messages.map(message => (
          <Message
            key={message.id}
            id={message.id}
            displayName={message.displayName}
            body={message.body}
            timeSent={message.timeSent}
          />)
        )}
        <div className="row">
          <div className="col-sm-12">
            <textarea
              id="new-message"
              className="new-message-textarea"
              value={newMessage}
              onChange={this.updateNewMessageValue.bind(this)}
              onKeyPress={this.handleKeyPress.bind(this)}
            />
            <button
              onClick={this.handleSend.bind(this)}
              className="btn btn-sm btn-success send-message"
            >
              Send
            </button>
          </div>
        </div>
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
