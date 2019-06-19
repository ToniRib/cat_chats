import React from 'react';
import PropTypes from 'prop-types';

const SelectableConversation = ({ id, displayName }) => {
  return (
    <div id={`conversation-${id}`}>
      {displayName}
    </div>
  );
};

SelectableConversation.propTypes = {
  id: PropTypes.number.isRequired,
  displayName: PropTypes.string.isRequired,
};

export { SelectableConversation };
