const api = require('../utils/api');

module.exports = async function (context) {
  try {
    const { data } = await api.get(
      `v3/catalog/products/${context.req.query.productId}/variants/${context.req.query.variantId}`
    );
    if (!data || !data.data) {
      throw 'No variant found.';
    }
    context.res = {
      body: data.data
    };
  } catch (error) {
    console.log('AzureFunction.Product.Error', error);
    context.res = {
      status: 500,
      body: error.message
    };
  }
};
