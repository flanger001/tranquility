// Run this example by adding <%= javascript_pack_tag 'hello_typescript' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
import Rails from "@rails/ujs";
Rails.start()

const images = require.context("../images");
images.keys().forEach(images);

import "../js/application";
import "../css/application";
import "bootstrap-sass";
console.log('Hello there. Fancy meeting you in the console.');
