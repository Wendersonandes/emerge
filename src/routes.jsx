import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './components/app';
import Home from './components/home';
import OpportunitiesIndex from './components/opportunity/opportunities_index';
import OpportunityShow from './components/opportunity/opportunity_show';

export default (
  <Route path="/" component={App}>
    <IndexRoute component={Home} />
    <Route path='opportunities' component={OpportunitiesIndex} />
    <Route path="/opportunities/:id" component={OpportunityShow} />
  </Route>
);

