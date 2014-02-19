// Note that this functionality requires the following system environment 
// variables to be set:
// 
// TWILIO_ACCOUNT_SID - your account sid
// TWILIO_AUTH_TOKEN - your auth token
//
var twilio = require('twilio');

// Configure the Express web app with new routes to power the sales associate
// demo app.  Requires the gopher-generated Express app and a Twilio number
module.exports = function(app, twilioNumber) {

    // Generate capability tokens to use with client
    app.get('/capability', function(request, response) {
        var capability = new twilio.Capability();
        capability.allowClientOutgoing('AP078af4a55e23443001238bb157c32a73');
        response.send({
            token:capability.generate()
        });
    });

    // Define route to send outbound text message
    app.post('/sms', function(request, response) {
        var client = twilio();
        
        client.sendMessage({
            to:request.param('to'),
            from:twilioNumber,
            body:request.param('body')
        }, function(err, message) {
            response.send({
                success:true
            });
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
};