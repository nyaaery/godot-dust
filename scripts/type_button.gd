extends Control

signal pressed;

export(StyleBoxFlat) var style;
export(StyleBoxFlat) var selected_style;

const names = [ "normal", "hover", "pressed" ];

onready var button = $"./button";

func _ready():
	button.connect("pressed", self, "_pressed");
	change_style(false);

func change_style(selected: bool):
	var overriding_style = selected_style if selected else style;
	
	for name in names:
		button.add_stylebox_override(name, overriding_style);

func _pressed():
	emit_signal("pressed", self);