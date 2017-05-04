import { combineReducers } from 'redux';
import OpportunitiesReducer from './opportunities';
const rootReducer = combineReducers({
  opportunities:  OpportunitiesReducer
});

export default rootReducer;



