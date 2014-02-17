var twilio = require('twilio'),
    config = require('./config');

module.exports = function(app) {
    app.get('/capability', function(request, response) {
        var capability = new twilio.Capability(config.sid, config.tkn);
        capability.allowClientOutgoing('AP078af4a55e23443001238bb157c32a73');
        response.type('text/plain');
        response.send({
            token:capability.generate()
        });
    });
};