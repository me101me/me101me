var key = process.argv[2];
process.stdin.resume();
process.stdin.setEncoding('utf8');
var str = "";
process.stdin.on('data', function(chunk) {
  str += chunk;
});
process.stdin.on('end', function() {
  var obj = JSON.parse(str);
  console.log(obj[key]);
  process.exit(0);
});
