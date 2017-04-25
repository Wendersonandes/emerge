import React, { Component } from 'react';
import {Link} from 'react-router';

export default class Menu extends Component {
  logo() {
    return(
      <div className="navbar-header">
        <button className="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
          <span className="sr-only"></span>
          <span className="icon-bar"></span>
          <span className="icon-bar"></span>
          <span className="icon-bar"></span>
        </button>
        <Link to="/" className="navbar-brand">
          <img src={'/assets/logo-brand.png'} />
        </Link>
      </div>
    );
  }

  render() {
    return(
      <div>
        <nav className="navbar navbar-default navbar-fixed-top shadow-1" role="navigation">
          <div className="container">
            {this.logo()}
            <div className="collapse navbar-collapse">
              <ul className="nav navbar-nav navbar-right">
                <li><Link to="/">Artistas</Link></li>
                <li><Link to="/">Workshops e Oficinas</Link></li>
                <li><Link to="/">Exposições</Link></li>
                <li><Link to="/">Contato</Link></li>
                <li><Link to="/opportunities">Oportunidades</Link></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    );
  }
}

