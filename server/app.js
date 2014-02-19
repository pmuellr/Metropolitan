var app = require('gopher'),
    twilio = require('twilio');

var twilioNumber = '(612) 260-5740';

// Jeff quickie demo
app.get('/', function(request, response) {
    var client = twilio();

    client.sendMessage({
        to:'+16512080532',
        from:twilioNumber,
        body:'Yo Pulse! What up homies!'
    }, function(err, message) {
        response.send('Message sent: '+message.sid);
    });

});

// Include functionality to power iOS demo app
require('./demo')(app, twilioNumber);