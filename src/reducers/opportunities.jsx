import { FETCH_OPPORTUNITIES } from '../actions/index';

const INITIAL_STATE = { all: [], opportunities: null };

export default function(state = INITIAL_STATE, action) {
  switch (action.type) {
    case FETCH_OPPORTUNITIES:
      return { ...state, all: action.payload.data }
    default:
      return state;
  }
}

