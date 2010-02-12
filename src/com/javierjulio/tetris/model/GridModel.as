package com.javierjulio.tetris.model
{
	import com.javierjulio.tetris.vo.CellVO;

	public class GridModel
	{
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * A 2D array of the cells within the grid. Generated based on the number 
		 * of columns and rows given. Each location contains a <code>CellVO</code> 
		 * instance.
		 */
		protected var cells:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function GridModel(columns:Number, rows:Number)
		{
			super();
			
			_columns = columns;
			_rows = rows;
			
			cells = [];
			
			for (var row:int = 0; row < rows; row++) 
			{
				cells.push([]);
				
				for (var col:int = 0; col < columns; col++) 
				{
					cells[row][col] = new CellVO(col, row);
				}
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  columns
		//----------------------------------
		
		/**
		 * @private
		 * Storage for the columns property.
		 */
		private var _columns:Number;
		
		/**
		 * The number of columns in this Grid.
		 * 
		 * @default NaN
		 */
		public function get columns():Number 
		{
			return _columns;
		}
		
		//----------------------------------
		//  rows
		//----------------------------------
		
		/**
		 * @private
		 * Storage for the rows property.
		 */
		private var _rows:Number;
		
		/**
		 * The number of rows in this Grid.
		 * 
		 * @default NaN
		 */
		public function get rows():Number 
		{
			return _rows;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 
		 */
		public function clearCellAt(column:Number, row:Number):void 
		{
			if (!isInRange(column, row)) 
				return;
			
			var cell:CellVO = CellVO(cells[row][column]);
			cell.occupied = false;
			cell.data = null;
		}
		
		/**
		 * 
		 */
		public function getCellAt(column:Number, row:Number):CellVO 
		{
			if (!isInRange(column, row)) 
				return null;
			
			return cells[row][column];
		}
		
		/**
		 * 
		 */
		public function getRowAt(column:Number, row:Number):Array 
		{
			if (!isNaN(row) && row >= 0 && row < _rows) 
				return null;
			
			return cells[row];
		}
		
		/**
		 * 
		 */
		public function isCellOccupied(column:Number, row:Number):Boolean 
		{
			// TODO: add isInRange check and throw error if not in range
			
			return CellVO(cells[row][column]).occupied;
		}
		
		/**
		 * 
		 */
		public function isInRange(column:Number, row:Number):Boolean 
		{
			return (!isNaN(row) && !isNaN(column) 
					&& row >= 0 && row < _rows 
					&& column >= 0 && column < _columns);
		}
		
		/**
		 * 
		 */
		public function isRowOccupied(row:Number):Boolean 
		{
			// TODO: add isInRange check and throw error if not in range
			
			var entireRowOccupied:Boolean = true;
			
			for (var col:int = 0; col < _columns; col++) 
			{
				if (!CellVO(cells[row][col]).occupied) 
				{
					entireRowOccupied = false;
					break;
				}
			}
			
			return entireRowOccupied;
		}
		
		/**
		 * 
		 */
		public function occupyCellAt(column:Number, row:Number, data:Object=null):CellVO 
		{
			// TODO: throw error if not in range, instead of returning null
			if (!isInRange(column, row)) 
				return null;
			
			var cell:CellVO = cells[row][column];
			cell.occupied = true;
			cell.data = data;
			
			return cell;
		}
	}
}