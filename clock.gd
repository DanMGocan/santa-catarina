extends Node2D

func _process(_delta) -> void:
	# A location in system memory, rather than the actual node
	# get_node(^"MinuteArm")
	# delta = 1.0
	# Shorthand version:	
	var current_time = Time.get_time_dict_from_system()
	var total_seconds = (
			current_time.second +
			current_time.minute * 60 + 
			current_time.hour * 3600
	)
	
	$HourArm.rotation = fmod((total_seconds / 3600.0), 60.0) * TAU / 12.0
	$MinuteArm.rotation = fmod((total_seconds / 60.0), 60) * TAU / 60.0
	$SecondsArm.rotation = fmod(total_seconds, 60.0) * TAU / 60.0
	
	
	
