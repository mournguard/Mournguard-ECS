@tool
@abstract class_name Body extends Component

static func IsBodyCollider(node: Node) -> bool:
	return node.get_parent() and node.get_parent() is Body and node.get_parent().get_parent() and node.get_parent().get_parent() is Entity

@abstract func get_collision_object() -> CollisionObject3D

func _get_configuration_warnings() -> PackedStringArray: return super()
