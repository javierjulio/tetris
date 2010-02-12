package com.javierjulio.tetris.vo
{
	public class CellVO
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function CellVO(column:Number, row:Number)
		{
			super();
			
			this.column = column;
			this.row = row;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  column
		//----------------------------------
		
		/**
		 * The zero-based column coordinate.
		 * 
		 * @default NaN
		 */
		public var column:Number;
		
		//----------------------------------
		//  data
		//----------------------------------
		
		/**
		 * The <code>data</code> property lets you pass a value to the component 
		 * that renders this cell.
		 * 
		 * @default null
		 */
		public var data:Object;
		
		//----------------------------------
		//  occupied
		//----------------------------------
		
		/**
		 * Indicates whether this cell is occupied by an object. If 
		 * <code>true</code> an object currently resides in this cell, otherwise 
		 * it is considered empty.
		 * 
		 * @default false
		 */
		public var occupied:Boolean = false;
		
		//----------------------------------
		//  row
		//----------------------------------
		
		/**
		 * The zero-based row coordinate.
		 * 
		 * @default NaN
		 */
		public var row:Number;
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 
		 */
		public function toString():String 
		{
			return "[CellVO column=" + column +  ", row=" + row + ", occupied=" + occupied + "]";
		}
	}
}