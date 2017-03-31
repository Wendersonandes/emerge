import React, { Component } from 'react';

class OpportunitySugestModal extends Component {
  render() {
    return (
      <div>
        <div className="modal fade" id="opportunitySugestModal" tabIndex="-1" role="dialog">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 className="modal-title">Ajude-nos a tornar nosso Catálogo melhor</h4>
              </div>
              <div className="modal-body">
                <form>
                  <div className="form-group">
                    <label htmlFor="InputOpportunityName">Título da Oportunidade</label>
                    <input type="text" className="form-control" id="InputOpportunityName" placeholder="Use este campo para o nome da Oportunidade" />
                  </div>
                  <div className="form-group">
                    <label htmlFor="InputOpportunityUrlSource">Link onde você encontrou esta Oportunidade</label>
                    <input type="text" className="form-control" id="InputOpportunityUrlSource" placeholder="Link apontando onde econtrou a Oportunidade" />
                  </div>

                  <div className="row">
                    <div className="col-sm-6">
                      <div className="form-group">
                        <label htmlFor="InputOpportunityUrlSource">Data Início Inscrições</label>
                        <input type="text" className="form-control" id="InputOpportunityUrlSource" />

                      </div>
                    </div>
                    <div className="col-sm-6">
                      <div className="form-group">
                        <label htmlFor="InputOpportunityUrlSource">Data Encerramento Inscrições</label>
                        <input type="text" className="form-control" id="InputOpportunityUrlSource" placeholder="Link apontando onde econtrou a Oportunidade" />

                      </div>
                    </div>

                </div>

                <div className="form-group">
                  <label htmlFor="emailSubject">Principal categoria</label>
                  <select className="form-control" id="emailSubject">
                    <option>Escolha um categoria</option>
                    <option>Video Arte</option>
                    <option>Residência</option>
                    <option>Instalação</option>
                    <option>Fotografia</option>
                    <option>Pintura</option>
                  </select>
                </div>
                <div className="form-group">
                  <label htmlFor="exampleInputPassword1">Mensagem</label>
                  <textarea className="form-control" rows="4" placeholder="Use este campo para incluir alguma observação sobre este edital"></textarea>
                </div>
              </form>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-default" data-dismiss="modal">Cancelar</button>
              <button type="button" className="btn btn-primary">Enviar</button>
            </div>
          </div>
        </div>
      </div>






      </div>
    );
  }
}

export default OpportunitySugestModal;
