shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
vec2 random(vec2 uv){
    uv = vec2(dot(uv, vec2(127.1,311.7)), dot(uv, vec2(269.5,183.3)));
    return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

void fragment() {
	COLOR.r += random(UV + (TIME / 1000.0)).g;
	COLOR.g += random(UV + (TIME / 1000.0)).g;
	COLOR.b += random(UV + (TIME / 1000.0)).g;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
