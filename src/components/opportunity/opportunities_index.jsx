import React, { Component } from 'react';
<<<<<<< HEAD
=======
import LeftBar from '../../shared/left_bar';
import SearchForm from './search-form';
>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
import Cards from './cards';

class OpportunitiesIndex extends Component {
  render() {
    return (
      <div>
<<<<<<< HEAD
        <Cards />
=======
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
>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
      </div>
    );
  }
}

export default OpportunitiesIndex;

