import React, { Component } from 'react';

class CommentBox extends Component {
  render() {
    return (
      <div>
        <form>
          <div className="form-group">
            <textarea className="form-control" rows="3" placeholder="Junte-se a conversa e comente esta oportunidade"></textarea>
          </div>
          <div className="form-group">
            <button type="button" className="btn btn-primary btn-default pull-right">Enviar comentário</button>
          </div>
        </form>
      </div>
    );
  }
}

export default CommentBox;
