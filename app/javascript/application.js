// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

const Chart = require('chart.js')
console.log("Chart:",Chart);
import "@hotwired/turbo-rails"
import "controllers"


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")