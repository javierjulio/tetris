package com.javierjulio.tetris.model.grid
{
	public class Grid
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
		public function Grid(columns:Number, rows:Number, cellClass:Class)
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
					cells[row][col] = new cellClass(col, row);
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
		 * Clears a cell located at the specified column and row by resetting its 
		 * <code>occupied</code> property to <code>false</code> and nullifying the 
		 * <code>data</code> property. If the column and row is not within the grid 
		 * size, the function call is canceled.
		 * 
		 * @param column The column index.
		 * @param row The row index.
		 */
		public function clearCellAt(column:Number, row:Number):void 
		{
			if (!isInRange(column, row)) 
				return;
			
			var cell:ICell = ICell(cells[row][column]);
			cell.occupied = false;
			cell.data = null;
		}
		
		/**
		 * Returns a cell by the specified column and row. If the colum and row 
		 * is not within the grid size <code>null</code> is returned.
		 * 
		 * @param column The column index.
		 * @param row The row index.
		 * 
		 * @return The cell by the specified column and row.
		 */
		public function getCellAt(column:Number, row:Number):ICell 
		{
			if (!isInRange(column, row)) 
				return null;
			
			return cells[row][column];
		}
		
		/**
		 * 
		 */
		public function getRowAt(row:Number):Array 
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
			
			return ICell(cells[row][column]).occupied;
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
			
			var rowOccupied:Boolean = true;
			
			for (var col:int = 0; col < _columns; col++) 
			{
				if (!ICell(cells[row][col]).occupied) 
				{
					rowOccupied = false;
					break;
				}
			}
			
			return rowOccupied;
		}
		
		/**
		 * 
		 */
		public function occupyCellAt(column:Number, row:Number, data:Object=null):ICell 
		{
			// TODO: throw error if not in range, instead of returning null
			if (!isInRange(column, row)) 
				return null;
			
			var cell:ICell = cells[row][column];
			cell.occupied = true;
			cell.data = data;
			
			return cell;
		}
		
		/**
		 * 
		 */
		public function swapCell(fromColumn:Number, fromRow:Number, toColumn:Number, toRow:Number):void 
		{
			if (!isInRange(fromColumn, fromRow) || !isInRange(toColumn, toRow)) 
				return;
			
			var srcCell:ICell = cells[fromRow][fromColumn];
			var destCell:ICell = cells[toRow][toColumn];
			
			var srcColumn:Number = srcCell.column;
			var srcRow:Number = srcCell.row;
			
			srcCell.column = destCell.column;
			srcCell.row = destCell.row;
			
			destCell.column = srcColumn;
			destCell.row = srcRow;
			
			cells[toRow][toColumn] = srcCell;
			cells[fromRow][fromColumn] = destCell;
		}
	}
}