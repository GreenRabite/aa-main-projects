import React from 'react';
import TodoForm from "./todo_form";

class TodoList extends React.Component {

  render() {
    const list = this.props.todos.map((item, i) => <li key={i}>{item.title}</li>);
    const receiveTodo = this.props.receiveTodo;
    return(
      <div>
      <h3>Todo list</h3>
        <h4>Hi</h4>
        <ul>
          { list }
        </ul>
        <TodoForm receiveTodo={ receiveTodo } />
      </div>
    );
  }
}

export default TodoList;
