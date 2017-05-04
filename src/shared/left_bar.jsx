import React, { Component } from 'react';
import { Link } from 'react-router';
import Recents from './recents';
import OpportunitySugestModal from './opportunity_sugest_modal';

class LeftBar extends Component {
  render() {
    return (
      <div>
        <p>Left Bar</p>
        <div className="well well-sm hidden-xs">
          <h3 className="f4 fw3 mt0">Não encontrou alguma oportunidade?</h3>
          <div className="row pb2">
            <div className="col-sm-4">
              <Link to={'https://www.sympla.com.br/colapso---workshop-de-experimentacao-tipografica__38534'} className={"img-responsive"}>
                <img src={'/assets/tipografiaWorkshopThumb.png'} alt={"Image Description"}/>
              </Link>
            </div>
            <div className="col-sm-8">
              <h3 className="f4 fw3 mt0 mb1">Ajude-nos a tornar o Emerge melhor e mais completo 				Se encontrou por aí alguma oportunidade que ainda não está cadastrada no Emerge use nosso formulário</h3>
              <button className="btn btn-xs btn-default" data-toggle="modal" data-target="#opportunitySugestModal">
                Contribuir
              </button>
            </div>
          </div>
          <h3 className="f4 fw3 mt0">Situação Economica de Artistas no Brasil</h3>
          <div className="row pb2">
            <div className="col-sm-4">
              <Link to={'https://www.sympla.com.br/colapso---workshop-de-experimentacao-tipografica__38534'} className={"img-responsive"}>
                <img src={'/assets/tipografiaWorkshopThumb.png'} alt={"Image Description"}/>
              </Link>
            </div>
            <div className="col-sm-8">
              <p className ="f5">
                Participe da nossa pesquisa para compreender melhor a situação economica de artistas e profissionais das artes visuais que atuam no Brasil
              </p>
              <button className="btn btn-xs btn-default">
                Participar da pesquisa
              </button>
            </div>
          </div>
          <h3 className="f4 fw3 mt0">Cursos, Aberturas e Eventos</h3>
          <div className="row pb2">
            <div className="col-sm-4">
              <Link to={'https://www.sympla.com.br/colapso---workshop-de-experimentacao-tipografica__38534'} className="img-responsive">
                <img src={'/assets/tipografiaWorkshopThumb.png'} alt={"Image Description"}/>
              </Link>
		        </div>
            <div className="col-sm-8">
              <Link to={"https://www.sympla.com.br/colapso---workshop-de-experimentacao-tipografica__38534"} className="f5 ma0 mb1 mt2">
                Colapso - Workshop de Experimentação Tipográfica
              </Link>
			        <p className="f5">COLAPSO objetiva a exposição de 4 famílias tipográficas e sua posterior fragmentação, retirando sua função primeira de leitura e instaurando o sentido de textura.</p>
		        </div>
          </div>
          <Recents />
        </div>
        <OpportunitySugestModal />
      </div>
    );
  }
}
export default LeftBar;
