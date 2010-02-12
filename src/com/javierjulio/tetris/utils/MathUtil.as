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
		 * 
		 */
		public static function randRange(min:Number, max:Number):Number 
		{
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
	}
}