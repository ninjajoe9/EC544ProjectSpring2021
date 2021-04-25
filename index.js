const AWS = require('aws-sdk');
var iotdata = new AWS.IotData({ endpoint: 'a2g30iz4de7z09-ats.iot.us-west-2.amazonaws.com' });
const bent = require('bent');
const initialval = 0x1fad3ebafe6b6600;

exports.handler = async (event, context, callback) => {
    const post = bent('https://ropsten.infura.io/', 'POST', 'json', 200);
    const response = await post('v3/77577d650ecb43258de239c72648780b', {"jsonrpc":"2.0", "method":"eth_getBalance", "params": ["0x71e0c6E76eEbA00C48641e4321916d9f755599EC", "latest"], "id":1});

    const second = JSON.parse(JSON.stringify(response));
    console.log(second.result);
    if(second.result > initialval){
        const value = {"message":"f"};
        var params = {
        topic: "RoboCar/Command",
        payload: JSON.stringify(value),
        qos: 0
        };

        return iotdata.publish(params, function(err, data) {
            if (err) {
              console.log("ERROR => " + JSON.stringify(err));
            }
            else {
                console.log("Success");
            }
            }).promise();
    }
};
