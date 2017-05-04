import React, { Component } from 'react';
import LeftBar from '../../shared/left_bar';
import SearchForm from './search-form';
import Cards from './cards';

class OpportunitiesIndex extends Component {
  render() {
    return (
      <div>
        <div className="row">
          <div className="col-sm-6 col-md-4">
            <LeftBar />
          </div>
          <div className="col-sm-6 col-md-8">
            <div className="row">
              <SearchForm />
            </div>
            <div className="row card__container">
              <Cards />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default OpportunitiesIndex;

