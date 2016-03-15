# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   jamie quote - Returns a random jamie barton quote
#
# Author:
#   kavi

quotes = [
  "Eat the meat!"
]

module.exports = (robot) ->
  robot.hear /.*(jamie quote).*/i, (msg) ->
    msg.send msg.random quote
