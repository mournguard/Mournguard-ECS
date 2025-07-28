extends ECSInspectorPlugin

func _can_handle(object: Object) -> bool: return object is Component

func _parse_begin(object: Object) -> void:
	var parent: Object = object.get_parent()

	if !parent or parent is not Entity: return

	var container := MarginContainer.new()
	container.add_theme_constant_override("margin_top", 2)
	container.add_theme_constant_override("margin_bottom", 6)

	var btn := Button.new()
	btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
	btn.text = "← " + parent.name
	btn.pressed.connect(func() -> void: EditorInterface.edit_node(parent), CONNECT_DEFERRED)

	container.add_child(btn)
	add_custom_control(container)
