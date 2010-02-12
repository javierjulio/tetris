package com.javierjulio.tetris.utils
{
	public class ArrayUtil
	{
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Shuffles the given array by picking random elements and placing them in 
		 * a random location in that same array. This method modifies the given 
		 * array.
		 * 
		 * @param list The list of elements to be shuffled.
		 * 
		 * @return Returns the same array instance but the elements within are now 
		 * shuffled in different indexes.
		 */
		public static function shuffle(list:Array):Array 
		{
			var j:Number;
			var temp:Object;
			
			for (var i:int = 0; i < list.length; i++) 
			{
				j = Math.floor(Math.random() * (i + 1));
				
				temp = list[i];
				
				list[i] = list[j];
				list[j] = temp;
			}
			
			return list;
		}
	}
}