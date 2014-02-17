// Create a simple web app, load config, and import the Twilio helper
var app = require('gopher'),
    twilio = require('twilio'),
    config = require('./config');

// Configure a Twilio number to use for outbound communication
var twilioNumber = '+16122605740';

// Include routes which handle the generation of capability tokens
require('./capability')(app);

// Create a route which handles sending an outbound text message
app.post('/sms', function(request, response) {
    // The actual body of the message and the number to send to are POST params
    var smsBody = request.param('body'),
        smsTo = request.param('to');

    // create an authenticated Twilio REST API client
    var client = twilio(config.sid, config.tkn);

    // Send the requested text message
    client.sendMessage({
        from:twilioNumber,
        to:smsTo,
        body:smsBody
    }, function(err, data) {
        // Send error info as JSON, if any
        response.send(err);
    });
});

// Define TwiML to be used in the outbound call
app.post('/outbound', function(request, response) {
    // Get number to call from request
    var number = request.param('to');

    // Create TwiML instructions for the outbound dial
    var twiml = new twilio.TwimlResponse();
    twiml.dial(number, {
        callerId:twilioNumber,
    });

    // Send TwiML response as XML
    response.type('text/xml');
    response.send(twiml.toString());
});