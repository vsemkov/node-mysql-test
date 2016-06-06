mysql = require 'mysql'

# Configuration
process.env.NODE_CONFIG_DIR = __dirname + '/config'
cfg = require 'config'

# Database connection
{host, dbname, username, password} = cfg.database

connection = mysql.createConnection
	host: host
	user: username
	password: password
	database: dbname

connection.connect (err) ->
	console.log "Database connection Error:", err if err?

module.exports = connection