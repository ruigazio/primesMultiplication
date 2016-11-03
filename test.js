#! /usr/bin/node

require('coffee-script').register()


var help = 'I accept one of these parameters:\n';
help += 'all\n';
//see below for more

var args = process.argv;
var testArgs = args.slice(2);

function requireAndRun(file){
    f = require(file);
    f(testArgs);
}

var folder = './test/'
var files = {
  prime: 'prime.coffee',
  table: 'table.coffee',
  permutation: 'permutation.coffee',
  csv: 'csv.coffee'
};

for (f in files){
  files[f] = folder + files[f];
  help += f + '\n';
}

function testAll(){
  var file;
  for (f in files){
    file = files[f];
    console.log('using test file: ', file);
    requireAndRun(file);
  }
}

var testName = args[2];

if (testName == 'all')
  testAll();
else if (files[testName])
  requireAndRun(files[testName]);
else
  console.log(help);
