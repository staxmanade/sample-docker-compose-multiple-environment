var http = require('http');

var server = http.createServer(function(req, res){
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end(`
Hello World!

VIRTUAL_HOST: ${process.env.VIRTUAL_HOST}
NODE_ENV: ${process.env.NODE_ENV}
PORT: ${process.env.PORT}

`.split('/n').join('<br>'));
});

server.listen(80);