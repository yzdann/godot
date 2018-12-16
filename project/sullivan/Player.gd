extends Area2D

export var speed = 400

var screensize
var extents
var vel = Vector2()

const GRAVITY = 2000

func _ready():
        set_fixed_process(true)
        screensize = get_viewport_rect().size
        extents = get_node("sprite").get_texture().get_size() / 2
        set_pos(screensize / 2)

func _fixed_process(delta):
        var input = Vector2(0, 0)
        input.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
        input.y = Input.is_action_pressed("ui_down") - Input.is_action_pressed("ui_up")
        vel = input.normalized() * speed
        var pos = get_pos() + vel * delta
        pos.x = clamp(pos.x, extents.width-100, screensize.width - (extents.width-100))
        pos.y = clamp(pos.y, extents.height-100, screensize.height - (extents.height-100))
        set_pos(pos)