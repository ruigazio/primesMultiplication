#! /usr/bin/node

var files = {
  prime: './test/build/prime.js',
  permutation: './test/build/permutation.js',
  table: './test/build/table.js'
};

function testAll(){
  var file;
  for (f in files){
    file = files[f];
    console.log(file);
    require(file);
  }
}

switch (process.argv[2]) {
  case 'table': return require(files.table);
  case 'primes': return require(files.prime);
  case 'permutations': return require(files.permutation);
  case undefined: 
  case 'all': return testAll();
  default : console.log('No such test');
}
