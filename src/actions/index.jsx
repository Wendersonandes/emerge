import axios from 'axios';

export const FETCH_OPPORTUNITIES = 'FETCH_OPPORTUNITIES';
export const FETCH_OPPORTUNITY = 'FETCH_OPPORTUNITY';
export const ADD_LIKES = 'ADD_LIKES';
export const FETCH_LIKES = 'FETCH_LIKES';


const ROOT_URL_OPPORTUNITIES = '/opportunities';

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

export function addLikes(opportunity_id) {
  const request = axios.post(`${ROOT_URL_OPPORTUNITIES}/${opportunity_id}/likes`);
  return {
    type: ADD_LIKES,
    payload: request
  };
}


export function fetchLikes(opportunity_id) {
  const request = axios.get(`${ROOT_URL_OPPORTUNITIES}/${opportunity_id}.json`);
  return {
    type: FETCH_LIKES,
    payload: request
  };
}

