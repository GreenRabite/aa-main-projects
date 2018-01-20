import React from 'react';
import ReactDOM from 'react-dom';


class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
  }

  tick(){
    // console.log(this);
    this.setState({time: new Date()});
  }

  componentDidMount(){
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.interval);
  }

  render(){
    let hour = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    let day = this.state.time.toDateString();

    return (
      <div className="whole-clock">
        <h1 id="old" className="bounceIn animated infinite">Clock</h1>
        <div className='clock'>
        <div className='clock-text'>
          <h2>Time:</h2>
          <h2>Date:</h2>
        </div>
        <div className='clock-vals'>
          <h2>{hour}:{minutes}:<i className="animated infinite bounceIn">{seconds}</i></h2>
          <h2>{day}</h2>
        </div>
        </div>
      </div>
    );
  }

}

export default Clock;
