# Log-to-Discord
Tail and Curl into a Discord Webhook

Thanks to https://github.com/shamasis for contributing the original version of this script for use with SLACK. 

Use of this script is to run with up to 3 variables as explained in https://blog.postman.com/stream-any-log-file-to-slack-using-curl/. Each variable is to set within quotes. $1 is the log file, variable $2 is the webhook link copied from Discordapp.com (or the application), and the optional $3 is to be used by grep to pull only wanted lines of text.

Example:
$ ./log-to-discord.sh "/srv/minecraft/logs/latest.log" "https://discord.com/api/webhooks/000000000000000000000000000000000000000000" "game"

This example will continuously read the minecraft file for users entering or exiting the "game" and send those to Discord. 

Output:
[10:53:07] [Server thread/INFO]: RvolvrWest joined the game
