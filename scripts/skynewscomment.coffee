# Description:
#   Returns a random top rated Sky News comment
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot sn comment - Gives a random top rated Sky News comment
#
# Author:
#   GantMan

module.exports = (robot) ->
  robot.respond /sn comment/i, (msg) ->
    msg.http("https://powerful-falls-8724.herokuapp.com/")
      .get() (err, res, body) ->
        msg.send "'" + JSON.parse(body).comment + "' - " + JSON.parse(body).numberOfLikes + " likes " + JSON.parse(body).storyTitle 
