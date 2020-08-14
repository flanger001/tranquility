const { environment } = require('@rails/webpacker')
const webpack = require("webpack");
const provide = new webpack.ProvidePlugin({
    $: "jquery",
    jquery: "jquery",
    jQuery: "jquery"
});

environment.plugins.prepend("Provide", provide);
module.exports = environment
