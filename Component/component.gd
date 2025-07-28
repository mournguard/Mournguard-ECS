@tool
@icon("res://addons/Mournguard-ECS/Component/icon.png")
@abstract class_name Component extends TypeAccessor

func E() -> Entity: return get_parent()
func C(component: Variant) -> Component: return E().C(component)

@abstract func _get_configuration_requirements() -> Array[Variant]

func _get_configuration_warnings() -> PackedStringArray:
	var warnings := []

	# Warn when components with scene structures are added as scripts on empty nodes instead of with the full scene.
	var path := '.'.join(get_script().resource_path.split('.').slice(0, -1)) + '.tscn'
	if FileAccess.file_exists(path) and not get_child_count(true):
		warnings.append("[Component] seems to have a related scene but is currently empty. This must be an error.")

	# Warn when components are used outside an entity.
	if not E() or not E() is Entity:
		warnings.append("[Component] nodes are only valid as children of [Entity] nodes.")
	else:
		# Check for other required components.
		var config_reqs := _get_configuration_requirements()
		for req: Variant in config_reqs:
			var found := false
			for c in E().get_children():
				if is_instance_of(c, req):
					found = true
					break
			if found == false:
				warnings.append("Parent [Entity] missing required ["+str(req.get_global_name())+"] component.")

	return warnings
