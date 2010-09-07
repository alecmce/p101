package alecmce.particles
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class ParticleProperties
	{
		public static const ORIGIN:Point = new Point(0, 0);
		
		private var _max:uint;
		
		public var throttle:uint;
		public var releasedPerFrame:Number;
		
		public var width:uint;
		public var height:uint;
		public var baseColor:uint;
		public var smoothing:Boolean;
		
		public var particleClass:Class;

		public function ParticleProperties(max:uint, width:uint, height:uint)
		{
			_max = max;
			throttle = _max;
			this.width = width;
			this.height = height;
			
			releasedPerFrame = 1;
		}

		public function get max():uint
		{
			return _max;
		}
		
		public function generateEmitterFilters():Array
		{
			return [];
		}
		
		public function pre(data:BitmapData):void
		{
			
		}
		
		public function post(data:BitmapData):void
		{
			
		}
		
	}
}
