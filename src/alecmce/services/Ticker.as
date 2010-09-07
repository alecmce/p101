package alecmce.services 
{
	import flash.display.Shape;
	import flash.events.Event;

	public class Ticker 
	{
		private var shape:Shape;
		private var priorities:Vector.<int>;
		private var functions:Vector.<Function>;
		private var len:uint;

		public function Ticker() 
		{
			shape = new Shape();
			priorities = new Vector.<int>();
			functions = new Vector.<Function>();
			len = 0;
		}
		
		public function add(fn:Function, priority:int = 0):void
		{
			var i:int = functions.indexOf(fn);
			if (i != -1)
				return;
			
			do ++i; while (i < len && priorities[i] < priority);
			
			priorities.splice(i, 0, priority);
			functions.splice(i, 0, fn);
			if (++len == 1)
				shape.addEventListener(Event.ENTER_FRAME, iterate);
		}
		
		public function remove(fn:Function):void
		{
			var i:int = functions.indexOf(fn);
			if (i == -1)
				return;
			
			functions.splice(i, 1);
			priorities.splice(i, 1);
			
			if (!(--len))
				shape.removeEventListener(Event.ENTER_FRAME, iterate);
		}
		
		
		public function removeAll():void
		{
			shape.removeEventListener(Event.ENTER_FRAME, iterate);
			
			priorities.length = 0;
			functions.length = 0;
			len = 0;
		}

		private function iterate(event:Event):void
		{
			for (var i:int = 0; i < len; i++)
				functions[i]();
		}
		
	}
}
