import React from 'react';
import ReactDOM from 'react-dom';
// import HelloWorld from './hello_world';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const websiteTabs = [{title: 'awesomeee', content: "asdkljfaslkjdfaklsd"}, {title: 'booo', content: "zzzzzzz"}];

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Clock/> , root);
  // ReactDOM.render(<Tabs tabs={websiteTabs}/> , root);
});
