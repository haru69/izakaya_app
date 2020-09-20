// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


async function callapi(){
    const base = await fetch ("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=a53d2b44f8d80d6d&address=%E5%85%AD%E6%9C%AC%E6%9C%A8&ktai_coupon=0&lunch=1&english=0&pet=1&child=0&format=json");
    console.log (base);
    }
    
    callapi();