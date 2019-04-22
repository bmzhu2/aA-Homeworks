const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case 'SWITCH_LOCATION':
      let nextState = merge({}, state);
      nextState.city = action.city;
      nextState.jobs = action.jobs;
    default:
      return state;
  }
};


export default reducer;
