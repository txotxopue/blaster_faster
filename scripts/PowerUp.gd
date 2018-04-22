# PowerUp.gd

extends Area2D

var velocity = Vector2(0, 200)

func _ready():
    pass

func _process(delta):
    translate(velocity * delta)
    
    # If it's out of screen.
    if position.y >= (Utils.view_size.y + 7):
        queue_free()
    pass