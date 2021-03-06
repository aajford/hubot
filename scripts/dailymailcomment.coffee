# Description:
#   Returns a random upvoted Daily Mail comment
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot dm comment - Gives a random top rated Daily Mail comment
#
# Author:
#   GantMan

module.exports = (robot) ->
  robot.respond /dm comment/i, (msg) ->
    msg.http("https://floating-sands-4358.herokuapp.com/")
      .get() (err, res, body) ->
        msg.send "_*'" + JSON.parse(body).comment + "'*_. " + JSON.parse(body).numberOfLikes + " likes, " + JSON.parse(body).numberOfDislikes + " dislikes. " + JSON.parse(body).storyTitle

