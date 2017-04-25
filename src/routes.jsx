import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './components/app';
import OpportunitiesIndex from './components/opportunity/opportunities_index';
import OpportunityShow from './components/opportunity/opportunity_show';

export default (
  <Route path="/" component={App}>
    <Route path='opportunities' component={OpportunitiesIndex} />
    <Route path="/opportunities/:id" component={OpportunityShow} />
  </Route>
);


