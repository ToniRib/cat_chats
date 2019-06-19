import React from 'react';
import PropTypes from 'prop-types';

const TopBanner = ({ userDisplayName }) => {
  return (
    <div>
      {`Welcome, ${userDisplayName}!`}
    </div>
  )
};

TopBanner.propTypes = {
  userDisplayName: PropTypes.string.isRequired,
};

export { TopBanner };
