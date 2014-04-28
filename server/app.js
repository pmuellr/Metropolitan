var app = require('gopher'),
    twilio = require('twilio');

var twilioNumber = '(ABC) DEF-GHIJ';

// Jeff quickie demo
app.get('/', function(request, response) {
    var client = twilio();

    client.sendMessage({
        to:'+1JIHGFEDCBA', //this should be your own phone
        from:twilioNumber,
        body:'Yo Impact! What up homies!'
    }, function(err, message) {
    		if (err) {
    			console.log("error sending message: ", err)
    			return;
    		}
        response.send('Message sent: '+message.sid);
    });

});

// Include functionality to power iOS demo app
require('./demo')(app, twilioNumber);
