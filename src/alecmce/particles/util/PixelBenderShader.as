package alecmce.particles.util
{

	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;
	
	public class PixelBenderShader extends ShaderFilter
	{
		
		public function PixelBenderShader(bytes:ByteArray):void
		{
			shader = new Shader(bytes);
			super(shader);
		}
		
	}
}