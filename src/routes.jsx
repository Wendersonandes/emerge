import React from 'react';
import { Route, IndexRoute } from 'react-router';

import  App from './components/app';
import  Home from './components/home';
import  OpportunitiesIndex from './components/opportunity/opportunities_index';

export default (
  <Route path="/" component={App}>
    <IndexRoute component={Home} />
    <Route path='opportunity_index' component={OpportunitiesIndex} />
  </Route>
);

