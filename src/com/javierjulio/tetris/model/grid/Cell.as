package com.javierjulio.tetris.model.grid
{
	public class Cell implements ICell
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function Cell(column:Number, row:Number)
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
		 * @private
		 * Storage for the column property.
		 */
		private var _column:Number;
		
		/**
		 * The zero-based column coordinate.
		 * 
		 * @default NaN
		 * @see ICell
		 */
		public function get column():Number 
		{
			return _column;
		}
		
		/**
		 * @private
		 */
		public function set column(value:Number):void 
		{
			_column = value;
		}
		
		//----------------------------------
		//  data
		//----------------------------------
		
		/**
		 * @private
		 * Storage for the data property.
		 */
		private var _data:Object;
		
		/**
		 * The <code>data</code> property lets you pass a value to the component 
		 * that renders this cell.
		 * 
		 * @default null
		 * @see ICell
		 */
		public function get data():Object 
		{
			return _data;
		}
		
		/**
		 * @private
		 */
		public function set data(value:Object):void 
		{
			_data = value;
		}
		
		//----------------------------------
		//  occupied
		//----------------------------------
		
		/**
		 * @private
		 * Storage for the occupied property.
		 */
		private var _occupied:Boolean = false;
		
		/**
		 * Indicates whether this cell is occupied by an object. If 
		 * <code>true</code> an object currently resides in this cell, otherwise 
		 * it is considered empty.
		 * 
		 * @default false
		 * @see ICell
		 */
		public function get occupied():Boolean 
		{
			return _occupied;
		}
		
		/**
		 * @private
		 */
		public function set occupied(value:Boolean):void 
		{
			_occupied = value;
		}
		
		//----------------------------------
		//  row
		//----------------------------------
		
		/**
		 * @private
		 * Storage for the row property.
		 */
		private var _row:Number;
		
		/**
		 * The zero-based row coordinate.
		 * 
		 * @default NaN
		 * @see ICell
		 */
		public function get row():Number 
		{
			return _row;
		}
		
		/**
		 * @private
		 */
		public function set row(value:Number):void 
		{
			_row = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Returns a string representation of the cell.
		 * 
		 * @return String representation of the cell.
		 */
		public function toString():String 
		{
			return "[Cell column=" + column +  ", row=" + row 
				+ ", occupied=" + occupied + ", data=" + data + "]";
		}
	}
}