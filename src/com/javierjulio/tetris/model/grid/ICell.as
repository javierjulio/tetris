package com.javierjulio.tetris.model.grid
{
	/**
	 * The ICell interface defines the interface for objects that represent a cell 
	 * within a grid.
	 */
	public interface ICell
	{
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  column
		//----------------------------------
		
		/**
		 * The column index.
		 */
		function get column():Number;
		
		/**
		 * @private
		 */
		function set column(value:Number):void;
		
		//----------------------------------
		//  data
		//----------------------------------
		
		/**
		 * The data associated with this cell.
		 */
		function get data():Object;
		
		/**
		 * @private
		 */
		function set data(value:Object):void;
		
		//----------------------------------
		//  occupied
		//----------------------------------
		
		/**
		 * Indicates whether this cell is occupied by an object.
		 */
		function get occupied():Boolean;
		
		/**
		 * @private
		 */
		function set occupied(value:Boolean):void;
		
		//----------------------------------
		//  row
		//----------------------------------
		
		/**
		 * The row index.
		 */
		function get row():Number;
		
		/**
		 * @private
		 */
		function set row(value:Number):void;
	}
}