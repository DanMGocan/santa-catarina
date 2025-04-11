class_name Clock
extends Node2D

# Values are initialized with 0, 1, 2, 3, their place in the enumeration
enum StartTimeMode { 
		SYSTEM_TIME, 
		RANDOM_TIME, 
		FIXED_TIME, 
		OFFSET_TIME 
		}


@export var timescale = 2000000.0

# The @export annotation exports this variable to the Inspector
# The inspector value overrides that value here 
@export var start_time = StartTimeMode.SYSTEM_TIME

@export_group("Fixed or Offset Start Time")
@export_range(-11, 11) var start_hour := 0
@export_range(0, 59) var start_minute := 0
@export_range(0, 59) var start_second := 0

var total_seconds := 0.0


# := means that a variable's type is determined by its value
# in this case, that would be Node2D
# @onready annotation moves everything at the start of the _ready() function
# and everything is initialized when the node is ready 
@onready var seconds_arm := $SecondsArm as Node2D
@onready var minutes_arm := $MinuteArm as Node2D
@onready var hours_arm := $HourArm as Node2D

## This is a test, this will appear when using the dummy function below
@export var dummy_var := 100.0 # currently does not work



# This function is called automatically when the node enters the scene.
# This means that total_seconds is assigned a value. 
func _ready() -> void:
	if start_time == StartTimeMode.RANDOM_TIME:
		total_seconds = randf_range(0.0, 43200.0)
	else:
		if start_time != StartTimeMode.FIXED_TIME:
			var current_time := Time.get_time_dict_from_system()
			total_seconds = float(
					current_time.second +
					current_time.minute * 60 +
					current_time.hour * 3600
			)
		if start_time != StartTimeMode.SYSTEM_TIME:
			total_seconds += start_second + start_minute * 60 + start_hour * 3600

func _process(delta: float) -> void:
	total_seconds += delta * timescale
	hours_arm.rotation = fmod((total_seconds / 3600.0), 60.0) * TAU / 12.0
	minutes_arm.rotation = fmod((total_seconds / 60.0), 60) * TAU / 60.0
	seconds_arm.rotation = fmod(total_seconds, 60.0) * TAU / 60.0
	

	
