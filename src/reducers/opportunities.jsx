import { FETCH_OPPORTUNITIES, FETCH_OPPORTUNITY } from '../actions/index';

const INITIAL_STATE = { all: [], opportunity: null };

export default function(state = INITIAL_STATE, action) {
  switch (action.type) {
    case FETCH_OPPORTUNITY:
      return { ...state, opportunity: action.payload.data };
    case FETCH_OPPORTUNITIES:
      return { ...state, all: action.payload.data }
    default:
      return state;
  }
}

