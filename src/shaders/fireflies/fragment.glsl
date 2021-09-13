uniform float uTime;
uniform vec3 uColor;
varying vec4 vPos;

void main()
{
    float distanceToCenter=distance(gl_PointCoord,vec2(.5));
    float strength=(.05/distanceToCenter-.1)*(sin(uTime*1.7+vPos.x+vPos.y+vPos.z)+1.1);
    gl_FragColor=vec4(uColor,strength);
    
}