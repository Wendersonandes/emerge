import React, { Component } from 'react';
import { connect } from 'react-redux';
import { fetchOpportunities } from '../../actions/index';
import { Link } from 'react-router';

let imgUrl = '/assets/tipografiaWorkshopThumb.png';
let divStyle = {
  backgroundImage: 'url(' + imgUrl + ')',
};

class Cards extends Component{

  componentDidMount() {
    this.props.fetchOpportunities();
  }

  onLikesClick(event, id) {
    console.log(`O valor do ID é de:${event}`);
  }

  updateLikes(id) {
    console.log('Valor total');
  }

  renderOpportunities() {
    return this.props.opportunities.map((opportunity) => {
      return (
        <div className="col-sm-12 col-md-6 col-lg-4" key={opportunity.id}>
          <div className="thumbnail pa0">
            <Link to={`opportunities/${opportunity.id}`}>
              <div className="card__opportunities relative h5 h5-l bg-top cover bg-black" style={divStyle}>
              </div>
            </Link>
            <div className="caption">
              <Link to={`opportunities/${opportunity.id}`}>
                <h4 className="f3">{opportunity.title}</h4>
              </Link>
              <p className="f4 measure avenir">{opportunity.summary}</p>
              <button value={opportunity.id} className="btn btn-default btn-xs"  onClick={this.onLikesClick.bind(this, opportunity.id)}>
                <i id="recommend_opportunity" className="glyphicon glyphicon-heart-empty"></i>
                <span className="ml1">
                  {opportunity.likes_count}
                </span>
              </button>
              <Link className="btn btn-primary btn-xs" role={"button"}>
                <i className="glyphicon glyphicon-bookmark"></i>
                <span className="ml1">
                  {opportunity.followers_count}
                </span>
              </Link>
              <Link to={"#"} className="btn btn-default btn-xs pull-right" role={"button"}>
                <i className="glyphicon glyphicon-eye-open"></i>
                40
              </Link>
            </div>
          </div>
        </div>

      );
    });
  }

  render() {
    return (
      <div>
        {this.renderOpportunities()}
     </div>
    );
  }
}

function mapStateToProps(state) {
  return { opportunities: state.opportunities.all }
}

export default connect(mapStateToProps, { fetchOpportunities })(Cards);

