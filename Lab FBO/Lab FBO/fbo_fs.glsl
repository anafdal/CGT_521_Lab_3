#version 400

uniform sampler2D texture;
uniform int pass;
uniform int blur;
uniform vec4 col;


out vec4 fragcolor;           
in vec2 tex_coord;
uniform sampler2D screenTexture;
 
      
void main(void)
{   
	if(pass == 1)
	{
		//fragcolor = texture2D(texture, tex_coord)*col;
	    fragcolor = texture2D(texture, tex_coord);

	}
	else if(pass == 2)
	{
       fragcolor = texture2D(texture, tex_coord)*col;//normal
		

   if(gl_FragCoord.x<500.0 )
    {
        fragcolor = 1.0-texture2D(texture, tex_coord);//invert colors+
	    float average = (fragcolor.r + fragcolor.g + fragcolor.b) / 3.0;
        fragcolor = vec4(average, average, average, 1.0);//grayscale effect
	};

	if(gl_FragCoord.x>750.0)
	{
	 fragcolor = 1.0-texture2D(texture, tex_coord);//invert colors+

	};
	
}
	else
	{
		fragcolor = vec4(1.0, 0.0, 1.0, 1.0); //error
	}

}




















