# Description:
#   Provides work related stuff 
#
# Commands:
#   hubot wiki - Reply with URL for the wiki 
#   hubot android build server - Reply with URL for Android Build Server
#   hubot iphone config - Reply with URL for iPhone config
#   hubot android config - Reply with URL for Android config
#   hubot live stream - Reply with URL for live stream
#   hubot service desk - Reply with contact details for the DC service desk
#   hubot who ate all the brownies - Reply with the person that ate all the brownies


module.exports = (robot) ->
  robot.respond /wiki$/i, (msg) ->
    msg.send "http://wiki.scoop.bskyb.com/wiki/Main_Page"

  robot.respond /android build server$/i, (msg) ->
    msg.send "http://mobile-build.scoop.bskyb.com/"

  robot.respond /iphone config$/i, (msg) ->
    msg.send "http://app.news.sky.com/ios/config.json"

  robot.respond /android config$/i, (msg) ->
    msg.send "http://app.news.sky.com/android/config.json"

  robot.respond /live stream$/i, (msg) ->
    msg.send "http://skydvn-ssmtv-mobile-prod.mobile-tv.sky.com/ssmtv-skynews/1404/sn.m3u8"

  robot.respond /service desk$/i, (msg) ->
    msg.send "Business hours: 0113 243 2973, dcservicedesk@sky.uk, Out of Hours: 0113 243 2973"

  robot.respond /whos fault is it(.*)$/i, (msg) ->
    msg.send "It's Jamie's fault!"  

  robot.respond /who ate all the (.*)$/i, (msg) ->
    foodItem = msg.match[1]
    msg.send "Djenan ate all the #{foodItem}!"

  banter = [
    "You mean that guy who sold out and went to Gravy town?",
    "Who? He is nothing to me.",
    "He'll never fit in. He doesn't eat enough gravy.",
    "GRRAAAVVEEEHHHH",
    "*KAVEY",
    "Aw I miss that guy... NOT",
    "Pretty sure it's his turn to run a retro",
    "Ooo he said he would bring everyone some donuts!",
    "Does he support Leeds United yet?",
    "He is a strong independent man.",
    "I heard he killed a guy",
    "Nope, don't know him",
    "WHAT A BEARD",
    "Get that man a tequila",
    "Will anyone keep him company in his spare bedroom?",
    "Stratford was better",
    "Fiesty one he is",
    "Bad boy 4 lyf",
    "Think he's missed a semicolon again"
  ]
  
  nzBanter = [
    "I hear New Zealand won more medals per capita",
    "I'm not quite sure where New Zealand is, but you can dance your way there from Old Zealand",
    "Didn't he lose that boxing match?",
    "Don't get him started on the cafe menu",
    "He's probably at Wetherspoons",
    "There's a sheep at reception asking for a Mr. Jonker?"
  ]
  
  jamieBanter = [
    "Beefcake? Yeah, beefcake.",
    "Don't mention Jira to him",
    "I hear the steroids make him angry"
  ]
  
  scouseBanter = [
    "Gerrard is just a poor man's Carrick"
    "He's only here so he can punch Dan in the face again",
    "Everton's finest"
    "He wasn't even that good at beer pong"
  ]
  
  jessBanter = [
    "Cheesy balls please",
    "Isn't her supervillain name 'The Jessticle'?"
  ]
  
  philBanter = [
    "I don't think Frankie & Benny's is over priced"
  ]
  
  lateComments = [
    "TEN POINTS FROM GRYFFINDOR",
    "Late? A wizard is never late",
    "Tut tut",
    "*tutting noise*",
    "Ummmmm... I'm telling",
    "TEN POINTS FROM SLYTHERIN",
    "TEN POINTS FROM RAVENCLAW",
    "TEN POINTS FROM HUFFLEPUFF",
    "*Better three hours too soon than a minute too late* - William Shakespeare",
    "*A man who dreads trials and difficulties cannot become a revolutionary. If he is to become a revolutionary with an indomitable fighting spirit, he must be tempered in the arduous struggle from his youth. As the saying goes, early training means more than late earning.* - Kim Jong Il"
  ]

  crappium = [
    ":poop:ium",
    "*CRAPPIUM*",
    "More like crappium :smirk:"
  ]

  robot.hear /.*(appium).*/i, (msg) ->
    msg.send msg.random crappium
  
  #robot.hear /.*(jonker).*/i, (msg) ->
  #  msg.send msg.random nzBanter
  
  #robot.hear /.*(jamie).*/i, (msg) ->
  #  msg.send msg.random jamieBanter
  
  #robot.hear /.*(khaleel).*/i, (msg) ->
  #  msg.send msg.random scouseBanter

  #robot.hear /.*(jess).*/i, (msg) ->
  #  msg.send msg.random jessBanter
  
  #robot.hear /.*(phil).*/i, (msg) ->
  #  msg.send msg.random philBanter
  
  #robot.hear /.*(Leeds).*/i, (msg) ->
  #  msg.send "GRAAAAAYVVVEEEH"
  
  #robot.hear /.*(late ).*/i, (msg) ->
  #  msg.send msg.random lateComments
  
  robot.hear /.*( late).*/i, (msg) ->
    msg.send msg.random lateComments




