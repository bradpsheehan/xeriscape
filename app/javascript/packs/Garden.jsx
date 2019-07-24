import React from 'react'
import ReactDOM from 'react-dom'
import Garden from '../xeriscaper/components/Garden'

document.addEventListener('DOMContentLoaded', () => {
  const garden = window.gardenConfig().garden
  ReactDOM.render(
    <Garden garden={garden}/>,
    document.body.appendChild(document.getElementById('garden'))
  );
});
