var express = require('express');
var router = express.Router();
var db = require('../queries');


// application -------------------------------------------------------------

// Route homepage
router.get('/', function (req, res) {
    res.json({"Message" : "Hello World !"});
});

// all Channels API
router.get('/allChannels', db.getAllChannels);

// allNodes API
router.get('/allNodes', db.getAllNodes);

// Insert API
router.post('/insertChannelData', db.insertChannelInfo)


module.exports = router;
