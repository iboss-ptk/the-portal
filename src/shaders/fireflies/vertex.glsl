uniform float uPixelRatio;
uniform float uSize;
uniform float uTime;
attribute float aScale;
varying vec4 vPos;

void main()
{
    vec4 modelPosition=modelMatrix*vec4(position,1.);
    modelPosition.y+=sin(uTime+modelPosition.x*100.)*aScale*.2;
    
    modelPosition.x+=sin(uTime+modelPosition.x*100.)*aScale*.25;
    modelPosition.z-=cos(uTime+modelPosition.z*100.)*aScale*.2;
    
    vPos=modelPosition;
    
    vec4 viewPosition=viewMatrix*modelPosition;
    vec4 projectionPosition=projectionMatrix*viewPosition;
    
    gl_Position=projectionPosition;
    gl_PointSize=aScale*uSize*uPixelRatio;
    gl_PointSize*=(1./-viewPosition.z);
}