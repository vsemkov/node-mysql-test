http = require 'http'
express = require 'express'
stylus = require 'stylus'

# Configure Express
app = express()

compile = (str, path) ->
	stylus(str).set('filename', path)

app.use stylus.middleware
	src: __dirname + '/assets/css'
	dest: __dirname + '/public/css'
	compile: compile
app.use express.static(__dirname + '/public')
app.use app.router
app.set 'views', 'views'

# Routes
app.get '/', (req, res) ->
	Message = require './Message'
	Message.getText (err, text) ->
		res.render 'index.jade', message: text

# Run server
server = http.createServer app

port = 8020
server.listen port

console.log 'Server running at http://127.0.0.1:' + port
