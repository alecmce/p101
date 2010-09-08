package 
{

	import alecmce.particles.ParticleProperties;
	import alecmce.particles.ParticleSystem;
	import alecmce.particles.util.ParticleData;
	import alecmce.services.Ticker;

	import flash.display.Sprite;
	
	[SWF(backgroundColor="#000000", frameRate="100", width="800", height="600")]
	public class Example extends Sprite
	{
		private static const MAX_PARTICLES:uint = 10000;
		
		private var ticker:Ticker;
		
		private var properties:ParticleProperties;
		private var system:ParticleSystem;
		
		private var data:ParticleData;
		
		public function Example()
		{
			init();
		}
		
		private function init():void
		{
			system = new ParticleSystem(generateProperties());
			addChild(system);
			
			data = new ParticleData(system);
			addChild(data);
			
			ticker = new Ticker();
			ticker.add(system.iterate);
			ticker.add(data.iterate);
		}
		
		private function generateProperties():ParticleProperties
		{
			var width:uint = stage.stageWidth;
			var height:uint = stage.stageHeight;
			
			// example 6a
			var properties:ExampleProperties = new ExampleProperties(MAX_PARTICLES, width, height);
			properties.particleClass = ExamplePixelParticle;
			
			return properties;
		}

	}
}
