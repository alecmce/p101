package
{
	import alecmce.particles.Particle;
	import alecmce.particles.ParticleProperties;

	import flash.display.BitmapData;
	
	public class ExamplePixelParticle extends Particle
	{
		private static const TWO_PI:Number = Math.PI * 2;
		
		public var dX:Number;
		public var dY:Number;
		private var gX:Number;
		private var gY:Number;
		
		override public function init(properties:ParticleProperties):void
		{
			var props:ExampleProperties = ExampleProperties(properties);
			gX = props.gX;
			gY = props.gY;
			
			var a:Number = props.initAngle;
			var v:Number = props.initVelocity * (0.9 + Math.random() * .2);
			dX = Math.cos(a) * v;
			dY = Math.sin(a) * v;

			var ang:Number = Math.random() * TWO_PI;
			var radius:Number = Math.random() * props.radius;
			x = props.centerX + Math.cos(ang) * radius;
			y = props.centerY + Math.sin(ang) * radius;
		}
		
		override public function iterate(data:BitmapData):Boolean
		{
			x += dX;
			y += dY;
			dX += gX;
			dY += gY;
			
			if (x < 0 || x > width || y < 0 || y > height)
				return true;
			
			data.setPixel32(x, y, 0xFFFFFFFF);
			return false;
		}
		
	}
}		
