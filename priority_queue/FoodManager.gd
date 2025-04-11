extends Node


#if pirate.is_busy(): 
	## Reschedule check in 10–30s depending on urgency
	#schedule_hunger_check(pirate.id, current_time + 30)

#We need a math formula to reschedule this. If the pirate is busy but has 19 hunger left
#they should be readded to the queue based on 19 * urgency or whatever. 
