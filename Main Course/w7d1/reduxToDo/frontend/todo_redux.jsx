import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store";
import App from "./components/app";
import {receiveTodos, receiveTodo} from "./actions/todo_actions";
import { allTodos } from "./reducers/selectors";
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  // ReactDOM.render(<h1>In the React!</h1>, root);
  const store = configureStore;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.store = store;
  window.selector = allTodos(store.getState());
  ReactDOM.render(<Root store = { store } />, root);
  // ReactDOM.render(<App />, root);
  });
