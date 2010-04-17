package com.javierjulio.tetris.utils
{
	public class MathUtil
	{
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Calculates a random number within the specified range given.
		 * 
		 * @param min The minimum acceptable number as a result.
		 * @param max The maximum acceptable number as a result.
		 * 
		 * @return A random number within the specified range given.
		 */
		public static function randRange(min:Number, max:Number):Number 
		{
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
	}
}