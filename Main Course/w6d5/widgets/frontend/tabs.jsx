import React from 'react';
import ReactDOM from 'react-dom';

class Tabs extends React.Component{
  constructor(props){
    super(props);
    this.state = { selectedIdx: 0 };
    this.props = props;
    // console.log(props.tabs);
  }

  render() {
    console.log("hey i'm rendering!");
    console.log(this.props);
  }
}


export default Tabs;
