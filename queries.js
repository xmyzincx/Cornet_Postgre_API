var promise = require('bluebird');

var options = {
  // Initialization Options
  promiseLib: promise
};

var pgp = require('pg-promise')(options);
var db = pgp({
  host: 'localhost',
  port: 5432,
  database: 'vttdb',
  user: 'postgres',
  password: 'root'
});


// db.any('SELECT "sensorId", "channel", "power", to_char("timestamp", \'DD-MM-YYYY HH24:MI:SS\') as "timestamp", "latitude", "longitude", "ant_height" as "antHeight", "ant_gain" as "antGain", "area_type" as "areaType" from sensing')

function getAllChannels(req, res, next) {
  db.any('SELECT "sensorId", "channel", "power", extract(epoch from "timestamp") as "timestamp", "latitude", "longitude", "ant_height" as "antHeight", "ant_gain" as "antGain", "area_type" as "areaType" from sensing')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          channels: data,
          message: 'Retrieved all channles'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

function getAllNodes(req, res, next) {
  db.any('SELECT "nodeId", "nodeName", "freq", "latitude", "longitude" FROM nodes')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          nodes: data,
          message: 'Retrieved all nodes'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}


module.exports = {
  getAllChannels: getAllChannels,
  getAllNodes: getAllNodes,
};
