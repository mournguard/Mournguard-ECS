extends ECSInspectorPlugin

func _can_handle(object: Variant) -> bool: return object is Entity

func _has_components(object: Variant) -> bool:
	if not object is Node: return false
	var has_components := false
	for c: Node in object.get_children():
		if c is Component:
			has_components = true
			break
	return has_components

func _parse_end(object: Object) -> void:
	if not _has_components(object): return
	if not object is Node: return

	var content := HFlowContainer.new()
	content.set_anchors_preset(Control.PRESET_FULL_RECT)

	for c: Node in object.get_children():
		if c is Component:
			var btn := Button.new()
			btn.text = c.name
			btn.pressed.connect(func() -> void: EditorInterface.edit_node(c), CONNECT_DEFERRED)
			content.add_child(btn)

	var inspector := _render_inspector("Components", COMPONENT_ICON, content)

	add_custom_control(inspector)
