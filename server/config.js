// Configure Twilio account credentials for development environment
var sid = process.env.TWILIO_ACCOUNT_SID,
    tkn = process.env.TWILIO_AUTH_TOKEN,
    twilioNumber = '+16122605740';

// If we're running in IBM, pull in Twilio account information from the system
// environment
/*
if (process.env.VCAP_SERVICES) {
    var twilioService = 'Twilio-lxrcq';
    var config = JSON.parse(process.env.VCAP_SERVICES);
    sid = config[twilioService].credentials.accountSID;
    tkn = config[twilioService].credentials.authToken;
}
*/

// Export config variables
exports.sid = sid;
exports.tkn = tkn;