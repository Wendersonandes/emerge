import React, { Component } from 'react';
import { Link } from 'react-router';
import LeftBar from './left_bar';


export default class OpportunitiesList extends Component {
  render() {
    console.log('sera');
    return(
      <div className="col-sm-12 col-md-6 col-lg-4">
        <div className="thumbnail pa0">
          <Link to="/autor" className="card__opportunities relative h5 h5-l bg-top cover bg-black">Autor</Link>
          <div className="caption">
            <Link><h4 className="f3">Level 6 Heading</h4></Link>
            <p className="f4 measure avenir">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit</p>
            <Link to="#" className="btn btn-primary btn-xs" role="button">
              <i className="glyphicon glyphicon-bookmark"></i>
              33
            </Link>
            <Link to="#" className="btn btn-default btn-xs" role="button">
              <i className="glyphicon glyphicon-heart-empty"></i>
              40
            </Link>
            <Link to="#" className="btn btn-default btn-xs pull-right" role="button">
              <i className="glyphicon glyphicon-eye-open"></i>
              40
            </Link>

          </div>
        </div>
      </div>
    );
  }
}
