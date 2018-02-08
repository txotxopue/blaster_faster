# Ship.gd

extends Area2D

func _ready():
    pass

func _process(delta):
    # Tracking mouse.
    var motion = (get_global_mouse_position().x - position.x) * 0.2
    translate(Vector2(motion, 0))

    # Clamping to view.
    var view_size = get_viewport_rect().size
    var pos = position
    pos.x = clamp(pos.x, 0 + 16, view_size.x - 16)
    position = pos

    pass
