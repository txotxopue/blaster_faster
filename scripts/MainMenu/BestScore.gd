# BestScore.gd

extends TextureRect

func _ready():
    $Label.set_text(str(Game.best_score))
    pass
