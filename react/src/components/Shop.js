import React from 'react';

const Shop = props => {

  return(
    <div className="row">
      <div className="small-10 small-centered columns">
        <div className={props.style}>
          <h3><a href={`/shops/${props.id}`}>{props.name}</a></h3>
          <p>{props.address}, {props.city}, {props.state} {props.zip}</p>
        </div>
      </div>
    </div>
  );
}

export default Shop;
