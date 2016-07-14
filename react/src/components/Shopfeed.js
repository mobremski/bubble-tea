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
      url: "/api/shops",
      contentType: "application/json"
    })
    .done(data => {
      this.setState({ shops: data.shops });
    });
  }

  render() {
    let shopsList = this.state.shops.map(shop => {
      return(
        <Shop
          key={shop.id}
          id={shop.id}
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
