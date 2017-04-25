import axios from 'axios';

export const FETCH_HOME = 'FETCH_HOME';
export const FETCH_OPPORTUNITIES = 'FETCH_OPPORTUNITIES';
export const FETCH_OPPORTUNITY = 'FETCH_OPPORTUNITY';

const ROOT_URL_OPPORTUNITIES = '/opportunities';

export function fetchHome() {
  return {
    type: FETCH_HOME,
    payload: ''
  };
}


export function fetchOpportunities() {
  const request = axios.get(`${ROOT_URL_OPPORTUNITIES}.json`);
  return {
    type: FETCH_OPPORTUNITIES,
    payload: request
  };
}

export function fetchOpportunity(id) {
  const request = axios.get(`${ROOT_URL_OPPORTUNITIES}/${id}.json`);
  return {
    type: FETCH_OPPORTUNITY,
    payload: request
  };
}



