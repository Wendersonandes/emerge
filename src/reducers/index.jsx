import { combineReducers } from 'redux';
import HomeReducer from './home';
import OpportunitiesReducer from './opportunities';

const rootReducer = combineReducers({
  home: HomeReducer,
  opportunities:  OpportunitiesReducer
});

export default rootReducer;


