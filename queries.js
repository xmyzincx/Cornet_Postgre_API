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
// extract(epoch from "timestamp") as 

function getAllChannels(req, res, next) {
  db.any('SELECT "sensorid", "channel", "power", "earfcn", "freq", "ch_scan_bw", "timestamp", "latitude", "longitude", "ant_height" as "antHeight", "ant_gain" as "antGain", "area_type" as "areaType" from sensors')
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

function insertChannelInfo(req, res, next) {
  query = makeSqlQuery(req.body)
  db.any(query)
    .then(function (data) {
      res.status(200).json({
        status: 'success',
        message: 'Received data!'
      })
      
    })
}


function makeSqlQuery(req_body) {
  var sensor_details = req_body.sensor_details
  var channel_data = req_body.channel_data
  var timestamp = (new Date).getTime()
  var query_string = 'INSERT INTO sensing ("sensorid", "channel", "power", "timestamp", "latitude", "longitude", "ant_height", "ant_gain", "area_type") VALUES '
  var total_channels = Object.keys(channel_data).length
  var key_counter = 1
  for (var key in channel_data) {
    if (channel_data.hasOwnProperty(key)) {
      try {
        var qstr = `('${sensor_details.sensorId}', ${key.replace(/^\D+/g, '')}, ${channel_data[key]}, ${timestamp}, ${sensor_details.latitude}, ${sensor_details.longitude}, ${sensor_details.ant_height}, ${sensor_details.ant_gain}, '${sensor_details.area_type}')`
        if (key_counter != total_channels) {
          qstr = qstr.concat(', ')
        }
        query_string = query_string.concat(qstr)
      } catch (error) {
        console.log(error)
      }
    }
    key_counter++
  }
  query_string = query_string.concat(' ON CONFLICT ON CONSTRAINT "unique_sensorId_channel" DO UPDATE SET "power"=excluded.power, "timestamp"=excluded.timestamp, "latitude"=excluded.latitude, "longitude"=excluded.longitude, "ant_height"=excluded.ant_height, "ant_gain"=excluded.ant_gain, "area_type"=excluded.area_type;')
  return query_string
}

module.exports = {
  getAllChannels: getAllChannels,
  getAllNodes: getAllNodes,
  insertChannelInfo: insertChannelInfo,
};
