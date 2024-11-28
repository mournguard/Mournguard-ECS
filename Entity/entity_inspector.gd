class_name EntityInspectorPlugin extends ECSInspectorPlugin

func _can_handle(object): return object is Entity

func _has_components(object) -> bool:
	var has_components = false
	for c in object.get_children():
		if c is Component:
			has_components = true
			break
	return has_components

func _parse_end(object: Object) -> void:
	if not _has_components(object): return

	var content = Control.new()

	for c in object.get_children():
		if c is Component:
			var btn = Button.new()
			btn.text = c.name
			btn.pressed.connect(func():EditorInterface.edit_node(c), CONNECT_DEFERRED)
			content.add_child(btn)

	var inspector = _render_inspector("Components", COMPONENT_ICON, content)

	add_custom_control(inspector)
