package alecmce.math.stats 
{

	/**
	 * 
	 * @author Alec McEachran
	 * 
	 * (c) 2010 alecmce.com
	 * 
	 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
	 */
	public class RollingMean 
	{
		
		private var _values:Array;
		private var _count:int;
		private var _sum:int;
		
		private var _valuesToCount:int;
		private var _inverseValuesToCount:Number;
		private var _maxIndex:int;
		private var _isEstablished:Boolean;

		public function RollingMean(valuesToCount:int) 
		{
			_values = [];
			_count = 0;
			_sum = 0;
			
			_valuesToCount = valuesToCount;
			_inverseValuesToCount = 1 / valuesToCount;
			_maxIndex = valuesToCount - 1;
		}
		
		public function reset():void
		{
			_values.length = 0;
			_count = 0;
			_sum = 0;
			_isEstablished = false;
		}
		
		public function update(value:Number):Boolean
		{
			_sum += value;
			if (_isEstablished ||= (_count == _valuesToCount))
			{
				_sum -= _values.shift();
				_values[_maxIndex] = value;
			}
			else
			{
				_values[_count++] = value;
			}
			
			return _isEstablished;
		}
		
		public function get mean():Number
		{
			if (_isEstablished)
				return _sum * _inverseValuesToCount;
			else
				return _sum / _count;
		}
		
		public function get isEstablished():Boolean
		{
			return _isEstablished;
		}
	}
}
