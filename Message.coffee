db = require './database'

class Message
	@getText: (cb) ->
		db.query 'SELECT Message FROM JobTest', (err, results) ->
			cb err, results[0]?.Message

module.exports = Message