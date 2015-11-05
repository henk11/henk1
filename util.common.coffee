Plugin = require 'plugin'
{tr} = require 'i18n'

exports.qToQuestion = (q) ->
	if typeof q is 'string'
		tr("Who") + ' ' + q.charAt(0).toLowerCase() + q.slice(1) + '?'

exports.selfRankToText = (nr) ->
	if nr is 1
		tr("1st")
	else if nr is 2
		tr("2nd")
	else if nr is 3
		tr("3rd")
	else if nr is 4 and Plugin.users.count().get() is 4
		tr("4th")
	else if nr is 4
		tr("Middle rank")
	else if nr is 5
		tr("Bottom rank")
	else
		'?'

exports.scoring = -> [10, 4, 1, 0]

# determines duration of the round started at 'currentTime'
exports.getRoundDuration = (currentTime) ->
	return false if !currentTime

	duration = 6*3600 # six hours
	while 22 <= (hrs = (new Date((currentTime+duration)*1000)).getHours()) or hrs <= 9
		duration += 6*3600
		#duration += Math.round(Math.random()*6*3600) # delay randomly

	duration

exports.questions = -> [
	# WARNING: indices are used, so don't remove items from this array (and add new questions at the end)
	# Use null as second array entry if you want to stop a question from being selected (or true if 18+)
	["kijkt het meest porno", false]
	["Vind stiekem joshua leuk", false]
	["Blowed het meest", false]
	["Zou graag een pik in zijn kont willen", false]
	

	
	# WARNING: always add new questions to the end of this array
]
