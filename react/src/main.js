import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Shopfeed from './components/Shopfeed';

$(function() {
  ReactDOM.render(
    <Shopfeed />,
    document.getElementById('app')
  );
});
