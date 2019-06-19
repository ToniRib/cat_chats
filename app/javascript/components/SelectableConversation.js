import React from 'react';
import PropTypes from 'prop-types';

const SelectableConversation = ({ id, displayName, onClick }) => {
  return (
    <div id={`conversation-${id}`} onClick={onClick}>
      {displayName}
    </div>
  );
};

SelectableConversation.propTypes = {
  id: PropTypes.number.isRequired,
  displayName: PropTypes.string.isRequired,
  onClick: PropTypes.func.isRequired,
};

export { SelectableConversation };
