import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}
          <NavLink exact to='/red' >Red</NavLink>
          <NavLink to='/red/orange' >Add orange</NavLink>
          <NavLink to='/red/yellow' >Add yellow</NavLink>
          <NavLink to='/green' >Green only</NavLink>
          <NavLink exact to='/blue' >Blue only</NavLink>
          <NavLink to='/blue/indigo' >Add indigo</NavLink>
          <NavLink to='/violet' >Violet only</NavLink>

        <div id="rainbow">
          {/* Your routes should go here */}
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
};

export default Rainbow;
