# Explosion.gd

extends Sprite

func _ready():
    randomize()
    rotate(deg2rad(rand_range(0, 360)))
    
    $PSmoke.set_emitting(true)
    $PFlare.set_emitting(true)
    
    Utils.remote_call("Camera", "shake", 8, 0.2)
    AudioPlayer.play(AudioPlayer.as_explosion)
    
    $AnimationPlayer.play("fade_out")
    
    yield($AnimationPlayer, "animation_finished")
    queue_free()
    
    pass
