

endpoint twilio:Client twilioEP {
    accountSId:"AC2853c72b72241afe20b1806f33dd667a",
    authToken:"3a5779569ab89abfd7116307065ae22a",
    xAuthyKey:""
};


function sendSms(string[] msg){
    foreach item in msg {
        var details = twilioEP->sendSms("+16786072701","+94776722111", item);
        io:println("Twitter Message: ",item);
        match details {
            twilio:SmsResponse smsResponse => io:println(smsResponse);
            twilio:TwilioError twilioError => {
                io:println(" Twilio Error");
                io:println(twilioError);
            }
        }
    }

}