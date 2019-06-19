import React from 'react';
import PropTypes from 'prop-types';

const Message = ({ id, displayName, body, timeSent }) => {
  return (
    <div id={`message-${id}`}>
      <p>
        <span><strong>{displayName}</strong> ({timeSent}): </span>
        {body}
      </p>
    </div>
  );
};

Message.propTypes = {
  displayName: PropTypes.string.isRequired,
  timeSent: PropTypes.string.isRequired,
  body: PropTypes.string.isRequired,
};

export { Message };
