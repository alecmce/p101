package alecmce.particles
{
	import flash.display.BitmapData;
	
	/**
	 * The Particle class holds a position in the Euclidean plane and expects
	 * to draw to the target BitmapData each time it is iterated.
	 *
	 * (c) 2010 alecmce.com
	 *
	 * @author Alec McEachran
	 */
	public class Particle
	{
		
		public var x:Number;
		public var y:Number;
		
		public var width:uint;
		public var height:uint;
		
		public var color:uint;
		
		/**
		 * init is called each time the particle object is to become active; the
		 * properties object is passed through generically because of a language
		 * limitation
		 *
		 * FIXME when Adobe finally implement generics, do this properly!
		 */
		public function init(properties:ParticleProperties):void
		{
			// to be overridden
		}
		
		/**
		 * iterate should draw to data as appropriate, and then return true iff
		 * the particle should be recycled
		 */
		public function iterate(data:BitmapData):Boolean
		{
			return false;
		}

	}
	
}
