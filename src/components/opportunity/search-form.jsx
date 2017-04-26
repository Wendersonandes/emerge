import React, { Component } from 'react';

class SearchForm extends Component {
  render() {
    return (
      <div>
        <div className="col-sm-12">
          <form className="form-inline">
            <div className="form-group">
              <label className="sr-only" htmlFor="InputOpportunityName">Nome da Oportunidade</label>
              <input type="text" className="form-control" id="InputOpportunityName" placeholder="Nome da Oportunidade" />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="InputOpportunityCategory">Categoria da Oportunidade</label>
              <select className="form-control">
                <option>Escolha um categoria</option>
                <option>Video Arte</option>
                <option>Residência</option>
                <option>Instalação</option>
                <option>Fotografia</option>
                <option>Pintura</option>
              </select>
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="InputOpportunityEnd">Password</label>
              <select className="form-control">
                <option>Status</option>
                <option>Abertos</option>
                <option>Encerrados</option>
                <option>Adiados</option>
                <option>Próximos do Encerramento</option>
                <option>Próximos do Resultado</option>
              </select>
            </div>
            <button type="search" className="btn btn-primary">Buscar oportunidades</button>
          </form>
        </div>
      </div>
    );
  }
}

export default SearchForm;
