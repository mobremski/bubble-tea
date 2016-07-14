import React from 'react';
import { Callout } from 'react-foundation';

const Shop = props => {

  return(
    <div className="row">
      <Callout>
        <h3><a href={`/shops/${props.id}`}>{props.name}</a></h3>
        <p>{props.address}, {props.city}, {props.state} {props.zip}</p>
      </Callout>
    </div>
  );
}

export default Shop;
