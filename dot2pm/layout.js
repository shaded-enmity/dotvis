var loadGraph = require('./loadGraph.js');
var graph = loadGraph();

console.log('Loaded graph with ' + graph.getLinksCount() + ' edges; ' + graph.getNodesCount() + ' nodes');

var layout = require('ngraph.offline.layout')(graph);

console.log('Starting layout');
layout.run();

var save = require('ngraph.tobinary');
save(graph, {
  outDir: '/opt/dotvis/data-stage'
});
