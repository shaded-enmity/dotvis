var fs = require('fs');
var path = require('path');
var dot = require('ngraph.fromdot');

module.exports = loadGraph;

function loadGraph(fileName) {
  fileName = fileName || process.argv[2];
  graphStr = fs.readFileSync(fileName, 'utf-8');
  console.log("Parsing with dot ...");
  return dot(graphStr);
}
