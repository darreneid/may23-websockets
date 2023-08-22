import React, { useEffect } from 'react';
import consumer from './consumer.js'
import { Route } from 'react-router-dom';
import Chat from './Chat.js';

function App() {
  return (
    <>
      <h2>Cool Tea Chat App</h2>
      <Route path='/:teaName'>
        <Chat consumer={consumer} />
      </Route>
    </>
  );
}

export default App;
