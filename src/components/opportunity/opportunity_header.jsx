import React, { Component } from 'react';
import { Link } from 'react-router';

let imgUrl = '/assets/tipografiaWorkshopThumb.png';
let divStyle = {
  backgroundImage: 'url(' + imgUrl + ')',
};


class OpportunityHeader extends Component {
  render() {
    const { opportunity } = this.props;
    console.log(this.props);
    return (
      <div>
        <div className="header__opportunity relative h8 h7-l bg-top cover bg-black mb3 shadow-1" style={divStyle}>
          <div className="overlay__container w-100 h-100 bg-black-60">
            <div className="info__container pl4 absolute">
              <div className="row">
                <div className="col-sm-9">
                  <h3 className="white fw4">{opportunity.title}</h3>
                </div>
              </div>
              <div className="row">
                <div className="col-sm-12">
                  <span className="label label-info mb2"><a href="#">Fotografia</a></span>
                  <span className="label label-info">Artes Visuais</span>
                  <span className="label label-info">Pintura</span>
                  <span className="label label-info">Instalação</span>
                  <span className="label label-info">Performance</span>
                  <span className="label label-info">Video Arte</span>
                  <span className="label label-info">Objeto</span>
                  <span className="label label-info">Arte Contemporânea</span>
                </div>
              </div>

              <h6 className="white-90 fw4">
                <span className="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                Início das inscrições: {opportunity.beginning}
              </h6>

              <h6 className="white-90 fw4">
                <span className="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                Encerramento das inscrições: {opportunity.end_subscription}
              </h6>

              <h6 className="white-90 fw4">
                <span className="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                Forma de Inscrição: Correios
              </h6>
              <h6 className="white-90 fw4">
                <span className="glyphicon glyphicon-euro" aria-hidden="true"></span>
                Premiação total: R$ 5.000,00
              </h6>
              <h6 className="white-90 fw4">
                <span className="glyphicon glyphicon-link" aria-hidden="true"></span>
                <a href="#">Fonte online</a>
              </h6>
              <h6 className="white-90 fw4">
                <span className="glyphicon glyphicon-send" aria-hidden="true"></span>
                Email contato:
                <a href="mailto:#">{opportunity.email_contact}</a>
              </h6>
            </div>

            <div className="buttons__container absolute ba b--light-gray bottom-0 w-100 h-15 bg-light-gray">
              <div className="relative">
                <div className="social__buttons absolute left-1 top-1">
                  <div className="btn-group">
                    <span className="f5">Compartilhe:</span>
                    <p>Botão para social shared</p>
                  </div>
                </div>
                <div className="follow__like__buttons absolute right-1 top-1">
                  <div className="btn-group hidden-xs">
                    <button className="btn btn-sm btn-default" data-toggle="modal" data-target="#opportunityQuestModal">
                      <span className="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                      Dúvidas e Sugestões
                    </button>
                  </div>
                  <div className="btn-group">
                    <button className="btn btn-sm btn-default">
                      <span className="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                      Recomendar
                    </button>
                  </div>
                  <div className="btn-group">
                    <button className="btn btn-sm btn-default">
                      <span className="glyphicon glyphicon-bookmark" aria-hidden="true"></span>
                      Seguir
                    </button>
                  </div>
                  <div className="btn-group hidden-xs">
                    <button type="button" className="btn btn-sm btn-primary dropdown-toggle"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >Downloads
                      <span className="caret"></span>
                    </button>
                    <ul className="dropdown-menu">
                      <li><Link to={"/"}>Regulamento</Link></li>
                      <li role="separator" className="divider"></li>
                      <li><Link to={"/"}>Ficha de Inscrição</Link></li>
                      <li role="separator" className="divider"></li>
                      <li><Link to={"/"}>Anexo</Link></li>
                      <li role="separator" className="divider"></li>
                      <li><Link to={"/"}>Modelo currículo</Link></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
       </div>
      </div>
    );
  }
}

export default OpportunityHeader;
