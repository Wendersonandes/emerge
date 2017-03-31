import React, { Component } from 'react';
import { connect } from 'react-redux';
import { fetchOpportunity  } from '../../actions/index';
import LeftBar from '../../shared/left_bar';
import OpportunityHeader from '../opportunity/opportunity_header';
import CommentBox from '../opportunity/comment_box';

class OpportunityShow extends Component {
  componentDidMount() {
    this.props.fetchOpportunity(this.props.params.id);
  }
  render() {

    const { opportunity } = this.props;

    if (!opportunity) {
      return <div>Loading ...</div>
    }
    return (
      <div>
        <div className="row">
          <div className="col-md-4 col-sm-12">
            <LeftBar />
          </div>
          <div className="col-md-8 col-sm-12">
            <OpportunityHeader {...this.props} />
            <div className="row">
              <div className="col-sm-8 opportunity__text__container f4">
                <div className="well well-sm">
                  {opportunity.summary}
                </div>
              </div>
              <div className="col-sm-4">
                <ul className="list-group">
                  <li className="list-group-item">
                    <address>
                      <strong>Premio FWC de Arte</strong> <br />
                      1355 Market Street, Suite 900 <br />
                      San Francisco, CA 94103 <br />
                      <abbr title="Phone">P:</abbr> (123) 456-7890
                    </address>
                  </li>
                </ul>
              </div>
            </div>
            <div className="row comment_container">
              <div className="comment_container col-sm-8">
                <CommentBox />
              </div>
            </div>
          </div>
        </div>
        <div>Aqui vai o modal</div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return { opportunity: state.opportunities.opportunity};
}

export default connect(mapStateToProps, { fetchOpportunity })(OpportunityShow);

