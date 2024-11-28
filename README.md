# ECS
Simple Entity/Component System to make the composition of nodes simpler. Entity nodes hold component nodes, Component nodes have a standardized way to access their parent Entity and it's other components.

# Usage
- Build features into Component Nodes.
- Compose Game Objects as Entity Nodes.
- Recommended to wrap any other Godot node into a component.
- Use `E` from a Component to access the Entity.
- Use `C` from a Component or Entity to access a Component via a Type.
- Add required Component Siblings to the output of a Component's `_get_configuration_requirements()`

# Requires
- Mournguard-EditorTools : https://github.com/mournguard/Mournguard-EditorTools
	- `git submodule add -- git@github.com:mournguard/Mournguard-EditorTools.git .\addons\Mournguard-EditorTools`
