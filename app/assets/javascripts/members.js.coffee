# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	map = null
	latlng = new L.LatLng(-33.867, 151.206)
	
	cloudmadeUrl = 'http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png'
	cloudmadeAttribution = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade'
	cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution})
	
	if($('#map').length > 0)
		map = new L.Map($('#map')[0])
		map.setView(latlng,13).addLayer(cloudmade)

	# $.getJSON("#{member.aphkey}.json",(data)=>
	# 	colors = ["#A2D39C","#FFF79A","#F7977A", "#6ECFF6", "#A187BE"]
	# 	items = []
	# 	if data.length > 0
	# 		wordcloud(data)
	# 	return false
	# )
	# 
