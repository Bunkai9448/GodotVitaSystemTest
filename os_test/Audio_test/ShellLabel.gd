extends Label

var messages = [
	"Script code from: https://gist.github.com/EricEzaM/c8d3cd4e3f031df1191dfe45b183b69f",
	"Courier Prime is a new take on IBM's Courier which was designed in 1956 by Howard Kettler.\n\nIt's a monospaced family, designed specifically for screenplays. Overall the family is more refined than its predecessor. The serifs are crisper and less rounded. The counters are subtly wider. The bold weight is a bit darker and the italics are more cursive."
]

var char_timer: Timer
var message_timer: Timer
var current_message_idx = 0

func _ready():
	visible_characters = 0
	text = messages[current_message_idx]
	
	# Timer to increment number of chars visible
	char_timer = Timer.new()
	add_child(char_timer)
	char_timer.wait_time = 0.1
	char_timer.autostart = true
	char_timer.connect("timeout", self, "timer_tick")
	char_timer.start()
	
	# Timer to go to next message in messages list
	message_timer = Timer.new()
	add_child(message_timer)
	message_timer.wait_time = 2
	message_timer.connect("timeout", self, "next_message")
	message_timer.one_shot = true
	

func timer_tick():
	visible_characters += 1
	if visible_characters >= text.length():
		visible_characters = -1
		char_timer.stop()
		message_timer.start()
		

func next_message():
	current_message_idx += 1
	if current_message_idx < messages.size():
		visible_characters = 0
		text = messages[current_message_idx]
		char_timer.start()
