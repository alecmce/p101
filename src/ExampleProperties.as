package
{
	import alecmce.particles.ParticleProperties;

	import flash.display.BitmapData;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;

	public class ExampleProperties extends ParticleProperties
	{
		private var origin:Point;
		private var blur:BitmapFilter;
		
		private var ct:ColorTransform;
		
		public var radius:Number;
		public var gX:Number;
		public var gY:Number;
		
		public var centerX:uint;
		public var centerY:uint;
		
		public var initAngle:Number;
		public var initVelocity:Number;
		
		public function ExampleProperties(max:uint, width:uint, height:uint)
		{
			super(max, width, height);
			
			origin = new Point();
			blur = new BlurFilter(4, 4, 1);
			
			ct = new ColorTransform(1,1,1,0.9,0,0,0,0);
			
			radius = 30;
			gX = 0;
			gY = 0.2;
			
			centerX = 100;
			centerY = height * .5;
			
			initAngle = -Math.PI / 6;
			initVelocity = 10;
			releasedPerFrame = 60;
		}

		override public function generateEmitterFilters():Array
		{
			return [];
		}

		override public function pre(data:BitmapData):void
		{
			data.colorTransform(data.rect, ct);
		}

		override public function post(data:BitmapData):void
		{
			data.applyFilter(data, data.rect, origin, blur);
		}
	}
}
