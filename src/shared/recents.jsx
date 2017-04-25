import React, { Component } from 'react';
import { Link } from 'react-router';


class Recents extends Component {
  render() {
    return (
      <div>
        <h3 className="f4 fw3 mt0">Oportunidades mais recomendadas</h3>
        <div className="row pb2">
          <div className="col-sm-4">
            <Link className="img-responsive">
              <img src={'http://placehold.it/140x140'} alt={"Image Description"}/>
            </Link>
          </div>
          <div className="col-sm-8">
            <Link to={"#"} className="f5 ma0 mb1 mt2">
              Bolsa Pampulha 2017
            </Link>
            <p className ="f5">O objeto do XV Prêmio FCW de Arte é a Fotografia, profissão e atividade empresarial do Instituidor Ubaldo Augusto Conrado Wess</p>
            </div>
        </div>

      </div>
    );
  }
}


export default Recents;
