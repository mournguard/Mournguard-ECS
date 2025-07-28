[![Godot](https://img.shields.io/badge/Godot_Engine-4.5beta3-blue?logo=godotengine)](https://godotengine.org)
# Mournguard ECS
Simple Entity/Component System to make the composition of nodes simpler. Entity nodes hold component nodes, Component nodes have a standardized way to access their parent Entity and it's other components.

# Usage
- Build features into `Component` Nodes.
- Compose Game Objects as `Entity` Nodes.
- Component nodes can required their parent Entity to have other specific component nodes.
- Recommended to wrap any other Godot node into a Component.
- Use `__(type)` from a Component or Entity to access any of its children via a Type.
- Use `C(type)` from a Component or Entity to access a Component via a Type. (`__()` but with casting, only to a `Component` though so you still lose types, hopefully this can be changed if gscript ever has generics)
- Use `E()` from a Component to access the Entity. (Again this is just casting `get_parent()` to `Entity`)
- Add required Component Siblings to the output of a Component's `_get_configuration_requirements()`. This is the main part that will add warnings for incompatibility in the editor.
- Supplies basic `Body` components, a special case that allows the parent Entity to pass down it's transform so you can still do things like move an entity around with the editor gizmo from the main `Entity` node, but still being optional - Node all Entities need to have an actual visual component.

# Requires
- [![Mournguard-EditorTools](https://img.shields.io/badge/Mournguard-EditorTools-blue?logo=github)](https://github.com/mournguard/Mournguard-EditorTools)
	- `git submodule add -- git@github.com:mournguard/Mournguard-EditorTools.git .\addons\Mournguard-EditorTools`
