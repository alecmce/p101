package alecmce.particles
{
	import flash.display.BitmapData;
	
	public class Particle
	{
		
		public var x:Number;
		public var y:Number;
		
		public var width:uint;
		public var height:uint;
		
		public var color:uint;

		public function init(properties:ParticleProperties):void
		{
			// do nothing
		}

		public function iterate(data:BitmapData):Boolean
		{
			data;	// avoid unused-variable warning
			
			return false;
		}

	}
	
}
