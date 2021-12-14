const api = require('../utils/api');

module.exports = async function (context) {
  try {
    const products = [];
    let page = 1;
    while (page) {
      const { data } = await api.get('v3/catalog/products', {
        params: { ...context.req.query, page }
      });

      if (data && data.data && data.data.length) {
        products.push(...data.data); // add page products to array
        page++; // increase page and get the next set of products
      } else {
        page = false; // no more pages, break out the while loop
      }
    }

    context.res = {
      body: products
    };
  } catch (error) {
    console.log('AzureFunction.Products.Error', error);
    context.res = {
      status: 500,
      body: error.message
    };
  }
};
