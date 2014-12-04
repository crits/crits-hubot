# Description:
#   CRITs Hubot script.
#

module.exports = (robot) ->

  # setup CRITs access
  # API URL: The full URL to your CRITs instance's API:
  #     Example: "http://localhost/api/v1"
  # USERNAME: The user the bot will attempt to authenticate with.
  # API_KEY: The API Key to use for the user to authenticate with.
  api_url = ""
  username = ""
  api_key = ""

  # look for commands in the form of [TLO] [url parameters]
  # Ex: "ips c-ip=1.1.1.1"
  robot.respond /(.*) (.*)/i, (msg) ->
    tlo = msg.match[1]
    params = msg.match[2]
    msg.reply "Looking up #{tlo} in CRITs..."
    msg.http("#{api_url}/#{tlo}/?#{params}&username=#{username}&api_key=#{api_key}")
        .get() (error, response, body) ->
            # lazily return results for now
            msg.send body
