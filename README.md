[![Godot](https://img.shields.io/badge/Godot_Engine-4.4dev5-blue?logo=godotengine)](https://godotengine.org)
# Mournguard ECS
Simple Entity/Component System to make the composition of nodes simpler. Entity nodes hold component nodes, Component nodes have a standardized way to access their parent Entity and it's other components.

# Usage
- Build features into Component Nodes.
- Compose Game Objects as Entity Nodes.
- Recommended to wrap any other Godot node into a component.
- Use `E` from a Component to access the Entity.
- Use `C(type)` from a Component or Entity to access a Component via a Type.
- Use `__(type)` form a Component to access any of its children via a Type.
- Add required Component Siblings to the output of a Component's `_get_configuration_requirements()`

# Requires
- [![Mournguard-EditorTools](https://img.shields.io/badge/Mournguard-EditorTools-blue?logo=github)](https://github.com/mournguard/Mournguard-EditorTools)
	- `git submodule add -- git@github.com:mournguard/Mournguard-EditorTools.git .\addons\Mournguard-EditorTools`
