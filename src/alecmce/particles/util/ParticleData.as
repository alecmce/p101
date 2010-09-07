package alecmce.particles.util
{
	import alecmce.math.stats.RollingMean;
	import alecmce.particles.ParticleSystem;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	public class ParticleData extends Sprite
	{
		private var tf:TextField;
		
		private var target:ParticleSystem;
		
		private var mean:RollingMean;
		private var time:int;
		
		public function ParticleData(target:ParticleSystem, count:uint = 10)
		{
			this.target = target;
			
			tf = new TextField();
			tf.selectable = false;
			tf.defaultTextFormat = new TextFormat("_sans", 10, 0, false);
			tf.background = true;
			tf.multiline = false;
			tf.height = 15;
			tf.backgroundColor = 0xFFFFFF;
			addChild(tf);
			
			mean = new RollingMean(count);
			time = -1;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			tf.width = target.stage.stageWidth;
			
		}

		public function iterate():void
		{
			var t:int = getTimer();
			if (time != -1)
				mean.update(t - time);
			
			tf.text =  target.count + " particles, " + (1000 / mean.mean).toFixed(0) + " fps";
			
			time = t;
		}
		
		public function finalize():void
		{
			removeChild(tf);
			tf = null;
			target = null;
		}
		
	}
}
