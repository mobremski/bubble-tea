import React, { Component } from 'react';
import Shop from './Shop.js'

class Shopfeed extends Component {
  constructor(props) {
    super(props);
    this.state = {
      shops: []
    };
  }

  componentDidMount() {
    $.ajax({
      method: "GET",
      url: "/api/shops" + window.location.search,
      contentType: "application/json"
    })
    .done(data => {
      this.setState({ shops: data.shops });
    });
  }

  render() {
    let shopsList = this.state.shops.map((shop, i) => {
      let shopClass;

      if(i % 2 === 0){
        shopClass = "callout primary"
      } else {
        shopClass = "callout secondary"
      }

      return(
        <Shop
          key={shop.id}
          id={shop.id}
          style={shopClass}
          name={shop.name}
          description={shop.description}
          address={shop.address}
          city={shop.city}
          state={shop.state}
          zip={shop.zip}
          pricing={shop.pricing}
          hours={shop.hours}
        />
      );
  });

  return(
    <ul className="shops-list">
    {shopsList}
    </ul>
  );
  };
};

export default Shopfeed;
