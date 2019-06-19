import React from "react"
import PropTypes from "prop-types"
class App extends React.Component {
  render() {
    const { user_display_name } = this.props;

    return (
      <div>{`Welcome, ${user_display_name}!`}</div>
    );
  }
}

App.propTypes = {
  user_display_name: PropTypes.string.isRequired,
};

export default App;
