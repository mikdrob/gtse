const axios = require('axios');

module.exports = axios.create({
  baseURL: `https://api.bigcommerce.com/stores/${process.env.STORE_HASH}/`,
  headers: {
    'X-Auth-Token': process.env.API_TOKEN
  }
});
