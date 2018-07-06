

endpoint twitter:Client twitterClient {
    clientId:"r6D9ci72uXYr5bsHshmuM1t1o",
    clientSecret:"LMdLx10ZawiUJ93PRzqfPaTwaTmU9ce3lJxAXMaMZl6bM2umI5",
    accessToken:"1045422476-tlc2dAhioHnPXM0lNlWgarHDu84qH76tWkVhRVc",
    accessTokenSecret:"fB1yWusn5K0IiHEi8ZZMvZuUq3QHYSIlrl5q1ayJe6I39"
};


function getMsg() returns (string[]){
    int tweetId;
    int idPosition;
    int[] idList;
    string[] msgList;
    var tweetResponse = twitterClient->search ("@htamahc");
    match tweetResponse {
        twitter:Status[] twitterStatus => {
            if (lengthof twitterStatus > 0){
                foreach item in twitterStatus  {
                    tweetId = item.id;
                    idList[lengthof idList] = tweetId;
                }
                idPosition = indexOf(idList,lastId);
                int tempLastId = twitterStatus[0].id;
                lastId = tempLastId;
            }
            msgList = createMsg(twitterStatus,idPosition);
        }
        twitter:TwitterError e => {
            io:print("Twitter Error");
            io:println(e);
        }
    }
    io:println(idList);
    //io:println(idPosition);
    return msgList;
}

function indexOf(int[] list1,int id) returns (int) {
    int i=0;
    int itemIndex=-1;
    while (i<lengthof (list1)) {
        if(list1[i]==id){
            itemIndex = i;
        }
        i++;
    }
    return itemIndex;
}

function createMsg(twitter:Status[] allTweets,int idIndex) returns (string[]){
    int i=0;
    string[] tagMsgList;
    string fullMsg;
    while (i<idIndex) {
        fullMsg = allTweets[i].text;
        tagMsgList[lengthof (tagMsgList)] = fullMsg;
        i++;
    }
    return tagMsgList;
}
