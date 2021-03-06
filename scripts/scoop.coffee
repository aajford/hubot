# Description:
#   Returns status of Scoop
#
# Dependencies:
#   "jsdom": "0.8.10"
#   "underscore": "1.3.3"
#
# Configuration:
#
# Commands:
#   hubot stage scoop status - Returns status of stage Scoop
#	hubot prod scoop status - Returns status of prod Scoop
#
# Author:
#   aajford

jsdom = require 'jsdom'
_     = require 'underscore'

module.exports = (robot) ->

  ignoredusers = []
  if process.env.HUBOT_HTTP_INFO_IGNORE_USERS?
    ignoredusers = process.env.HUBOT_HTTP_INFO_IGNORE_USERS.split(',')

  robot.respond /stage scoop status/i, (msg) ->
    url = 'http://stage.feeds.skynews.com/status'

    ignore = url.match(/\.(png|jpg|jpeg|gif|txt|zip|tar\.bz|js|css)/)

    ignorePattern = process.env.HUBOT_HTTP_INFO_IGNORE_URLS
    if !ignore && ignorePattern
      ignore = url.match(ignorePattern)

    jquery = 'http://code.jquery.com/jquery-1.9.1.min.js'

    done = (errors, window) ->
      unless errors
        $ = window.$
        title = $('head title').text().replace(/(\r\n|\n|\r)/gm,'').replace(/\s{2,}/g,' ').trim()
        description = $('head meta[name=description]')?.attr('content')?.replace(/(\r\n|\n|\r)/gm,'')?.replace(/\s{2,}/g,' ')?.trim() || ''

        if title and description and not process.env.HUBOT_HTTP_INFO_IGNORE_DESC
          msg.send "#{title}\n#{description}"

        else if title
          if title is 'Service Unavailable'
          	msg.send "Stage Scoop is down (AGAIN) :skull:"
          	return
          if title is 'Application scoop'
          	msg.send "Stage Scoop is looking good! :sunglasses:"
          	return
          else
          	msg.send "Don't know don't care :robot_face:"

    jsdom.env
      url: url
      scripts: [ jquery ]
      done: done

  robot.respond /prod scoop status/i, (msg) ->
    url = 'http://feeds.skynews.com/status'

    ignore = url.match(/\.(png|jpg|jpeg|gif|txt|zip|tar\.bz|js|css)/)

    ignorePattern = process.env.HUBOT_HTTP_INFO_IGNORE_URLS
    if !ignore && ignorePattern
      ignore = url.match(ignorePattern)

    jquery = 'http://code.jquery.com/jquery-1.9.1.min.js'

    done = (errors, window) ->
      unless errors
        $ = window.$
        title = $('head title').text().replace(/(\r\n|\n|\r)/gm,'').replace(/\s{2,}/g,' ').trim()
        description = $('head meta[name=description]')?.attr('content')?.replace(/(\r\n|\n|\r)/gm,'')?.replace(/\s{2,}/g,' ')?.trim() || ''

        if title and description and not process.env.HUBOT_HTTP_INFO_IGNORE_DESC
          msg.send "#{title}\n#{description}"

        else if title
          if title is 'Service Unavailable'
          	msg.send "Prod Scoop doesn't look so good... :scream:"
          	return
          if title is 'Application scoop'
          	msg.send "Prod Scoop is looking good! :sunglasses:"
          	return
          else
          	msg.send "Don't know don't care :robot_face:"

    jsdom.env
      url: url
      scripts: [ jquery ]
      done: done 