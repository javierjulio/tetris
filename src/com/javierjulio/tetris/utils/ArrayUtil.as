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
		 * array and returns the same instance.
		 * 
		 * @param list The array to be randomly shuffled.
		 * 
		 * @return Modified array instance where elements are shuffled and placed 
		 * in random indexes.
		 */
		public static function shuffle(list:Array):Array 
		{
			var newIndex:Number;
			var temp:Object;
			
			for (var i:int = 0; i < list.length; i++) 
			{
				newIndex = Math.floor(Math.random() * (i + 1));
				
				temp = list[i];
				
				list[i] = list[newIndex];
				list[newIndex] = temp;
			}
			
			return list;
		}
	}
}