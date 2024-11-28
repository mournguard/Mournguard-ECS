class_name ComponentInspectorPlugin extends ECSInspectorPlugin

func _can_handle(object): return object is Component

func _parse_end(object: Object) -> void:
	var content = Control.new()

	for c in object.get_children():
		if c is Component:
			var btn = Button.new()
			btn.text = c.name
			btn.pressed.connect(func():EditorInterface.edit_node(c), CONNECT_DEFERRED)
			content.add_child(btn)

	var inspector = _render_inspector("Entity", ENTITY_ICON, content)

	add_custom_control(inspector)
