extends Node

onready var trash = preload("res://Trash.tscn")
onready var trash_container = get_node("trash_container")
onready var score_label = get_node("Panel/score_label")
onready var finish_label = get_node("Panel/finish_label")

var screensize
var score = 0
var message = 'Well done...You are awesome:D!'


func _ready():
    randomize()     
    screensize = get_viewport().get_rect().size        
    set_process(true)
    spawn_trashes(10)
        
		
		
func spawn_trashes(num):
	for i in range(num):
        var t = trash.instance()
        trash_container.add_child(t)
        t.connect("trash_grabbed", self, "_on_trash_grabbed")
        t.set_pos(Vector2(rand_range(40, screensize.width-40), rand_range(40, screensize.height-40)))

func _on_trash_grabbed():
	score += 10
	score_label.set_text(str(score))
	
func _process(delta):
	if trash_container.get_child_count() == 0:
		finish_label.set_text(message)