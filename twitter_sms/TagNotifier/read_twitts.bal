import ballerina/io;
import wso2/twitter;
import wso2/twilio;
import ballerina/runtime;
public int lastId;

function main(string... args) {
    lastId = 0;
    while (true){
        sendSms(getMsg());
        runtime:sleep(1000*5);
    }
}


//during the first itteration it will record the id of the last tagged tweet.
// then check for new tagged tweets for every 5 seconds.
// if found a new tagged tweet, the system notifies it to user via sms.
//here, for the demo, the @htamahc user's tagged tweets will be checked.


