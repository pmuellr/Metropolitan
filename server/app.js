var app = require('gopher'),
    twilio = require('twilio');

var twilioNumber = '(919) 926-0835';

// Jeff quickie demo
app.get('/', function(request, response) {
    var client = twilio();

    client.sendMessage({
        to:'+19192448670', //this should be your own phone
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
