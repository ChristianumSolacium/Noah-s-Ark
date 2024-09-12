shader_type canvas_item;

uniform vec2 pos0 = vec2(0,0);
uniform vec2 pos1 = vec2(200,300);

uniform bool active;


void fragment() {
	float m = (pos1.y - pos0.y) / (pos1.x - pos0.x);
	float q = pos0.y - pos0.x * m;
	COLOR = (!active || FRAGCOORD.y < m * FRAGCOORD.x + q) ? COLOR : vec4(0,0,0,0);
	
	
}
