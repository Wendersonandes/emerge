import React, { Component } from 'react';
import { Link } from 'react-router';

export default class LeftBar extends Component {
  render() {
    return(
      <div className="well well-sm hidden-xs">
        <h3 className="f4 fw3 mt0">Não encontrou alguma oportunidade?</h3>

        	<div className="row pb2">
            <div className="col-sm-4">
              <Link >teste</Link>
            </div>
            <div className="col-sm-8">
              <h3 className="f4 fw3 mt0 mb1">Ajude-nos a tornar o Emerge melhor e mais completo Se encontrou por aí alguma oportunidade que ainda não está cadastrada no Emerge use nosso formulário</h3>


              <button className="btn btn-xs btn-default" data-toggle="modal" data-target="#opportunitySugestModal">
                Contribuir
              </button>

            </div>
          </div>
      </div>
    );
  }
}
