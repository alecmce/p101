package alecmce.particles
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PixelSnapping;

	public class ParticleSystem extends Bitmap
	{
		private var properties:ParticleProperties;
		
		private var _list:Vector.<Particle>;
		private var _max:uint;
		private var _count:uint;
		private var _stack:Number;
		
		public function ParticleSystem(properties:ParticleProperties)
		{
			this.properties = properties;
			
			super(generateBitmapData(), PixelSnapping.NEVER, properties.smoothing);
			_list = generateParticles();
			filters = properties.generateEmitterFilters();
		}

		private function generateBitmapData():BitmapData
		{
			var width:uint = properties.width;
			var height:uint = properties.height;
			var base:uint = properties.baseColor;
			
			return new BitmapData(width, height, true, base);
		}
		
		private function generateParticles():Vector.<Particle>
		{
			_max = properties.max;
			_list = new Vector.<Particle>(_max, true);
			_count = 0;
			_stack = 0;
			
			var particleClass:Class = properties.particleClass;
			
			var i:int = properties.max;
			while (i--)
			{
				var p:Particle = new particleClass();
				p.width = properties.width;
				p.height = properties.height;
				
				_list[i] = p;
			}
			
			return _list;
		}
		
		public function iterate():void
		{
			var i:uint;
			var p:Particle;

			bitmapData.lock();
			properties.pre(bitmapData);

			if (_count < properties.throttle)
			{
				_stack += properties.releasedPerFrame;
				i = properties.throttle - _count;
				if (i > _stack)
					i = _stack;
				
				while (_count < _max && i > 0)
				{
					--i;
					--_stack;
					p = _list[_count++];
					p.init(properties);
				}
			}
			
			i = _count;
			while (i--)
			{
				p = _list[i];
				if (p.iterate(bitmapData))
				{
					_list[i] = _list[--_count];
					_list[_count] = p;
				}
			}
			
			properties.post(bitmapData);
			bitmapData.unlock();
		}

		public function get count():uint
		{
			return _count;
		}

		public function get list():Vector.<Particle>
		{
			return _list;
		}

		public function dispose():void
		{
			_list = null;
			bitmapData.dispose();
		}
		
	}
}
