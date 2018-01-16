var express = require('express');
var router = express.Router();
var db = require('../queries');


router.get('/allChannels', db.getAllChannels);
router.get('/allNodes', db.getAllNodes);


// application -------------------------------------------------------------
router.get('/', function (req, res) {
    res.json({"Message" : "Hello World !"});
});

module.exports = router;
