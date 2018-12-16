extends Area2D

signal trash_grabbed

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Trash_area_enter( area ):
	if area.get_name() == "Player":
		emit_signal("trash_grabbed")
		queue_free()