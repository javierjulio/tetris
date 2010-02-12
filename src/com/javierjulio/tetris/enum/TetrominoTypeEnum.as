package com.javierjulio.tetris.enum
{
	public class TetrominoTypeEnum
	{
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 
		 */
		public static const I:TetrominoTypeEnum = new TetrominoTypeEnum("I", 0);
		
		public static const O:TetrominoTypeEnum = new TetrominoTypeEnum("O", 1);
		public static const T:TetrominoTypeEnum = new TetrominoTypeEnum("T", 2);
		public static const S:TetrominoTypeEnum = new TetrominoTypeEnum("S", 3);
		public static const Z:TetrominoTypeEnum = new TetrominoTypeEnum("Z", 4);
		public static const J:TetrominoTypeEnum = new TetrominoTypeEnum("J", 5);
		public static const L:TetrominoTypeEnum = new TetrominoTypeEnum("L", 6);
		
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Returns an array of all TetrominoTypeEnum objects.
		 * 
		 * @return An array of TetrominoTypeEnum objects.
		 */
		public static function list():Array 
		{
			return [I, O, T, S, Z, J, L];
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor. 
		 * 
		 * @param label The enumerated value label for easy selection.
		 * @param index The index (position) to be placed in.
		 * @param data The data value.
		 */
		public function TetrominoTypeEnum(label:String, index:Number, data:String=null) 
		{
			super();
			
			this.label = label;
			this.index = index;
			this.data = data;
			
			// if no data value was provided default to the label given
			if (!data) 
				this.data = label;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The data value.
		 */
		public var data:String;
		
		/**
		 * The index (position) this enumerated value is in.
		 */
		public var index:Number;
		
		/**
		 * The label used for display for easy selection.
		 */
		public var label:String;
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Returns the enum label.
		 */
		public function toString():String 
		{
			return label;
		}
	}
}