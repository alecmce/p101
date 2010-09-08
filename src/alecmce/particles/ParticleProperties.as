package alecmce.particles
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * The ParticleProperties class holds a collection of properties that allow a
	 * Particle object to be configured at runtime, and encapsulates three methods
	 * that determine how a ParticleSystem will be filtered before and after the
	 * particles are drawn, and what persistent filters are applied to it at
	 * startup
	 *
	 * (c) 2010 alecmce.com
	 *
	 * @author Alec McEachran
	 */
	public class ParticleProperties
	{
		public static const ORIGIN:Point = new Point(0, 0);
		
		private var _max:uint;
		
		/** the working maximum number of particles that can be in the system. Must be <= _max */
		public var throttle:uint;
		
		/** how many new particles are created per frame, when available */
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
			
		/**
		 * the maximum number of particles that can be created by the system
		 */
		public function get max():uint
		{
			return _max;
		}
		
		/**
		 * referenced once at the start of a ParticleSystem's initialization routine, configures
		 * the 'permanent' filters that are applied to the system
		 */
		public function generateEmitterFilters():Array
		{
			return [];
		}
		
		/**
		 * called before the particles of a particle system are drawn into the BitmapData
		 */
		public function pre(data:BitmapData):void
		{
			// to be overridden
		}
		
		/**
		 * called after the particles of a particle system are drawn into the BitmapData
		 */
		public function post(data:BitmapData):void
		{
			// to be overridden
		}
		
	}
}
