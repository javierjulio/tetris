package com.javierjulio.tetris.model
{
	import com.javierjulio.tetris.core.MoveDirection;
	import com.javierjulio.tetris.model.grid.Cell;
	import com.javierjulio.tetris.model.grid.Grid;
	import com.javierjulio.tetris.utils.ArrayUtil;
	import com.javierjulio.tetris.vo.TetrominoVO;

	public class GameModel
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function GameModel()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  fallingTetromino
		//----------------------------------
		
		/**
		 * The Tetromino that is currently falling in the Tetris grid.
		 * 
		 * @default null
		 */
		public var fallingTetromino:TetrominoVO;
		
		
		
		public var grid:Grid;
		
		
		//----------------------------------
		//  heldTetromino
		//----------------------------------
		
		/**
		 * The Tetromino that is being held in storage for later usage.
		 * 
		 * @default null
		 */
		public var heldTetromino:TetrominoVO;
		
		//----------------------------------
		//  shadowTetromino
		//----------------------------------
		
		/**
		 * The Tetromino that acts as a shadow.
		 * 
		 * @default null
		 */
		public var shadowTetromino:TetrominoVO;
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 
		 */
		public function move(tetromino:TetrominoVO, direction:String):Boolean 
		{
			var cells:Array = tetromino.cells;
			var cell:Cell;
			var movedCells:Array = [];
			var newColumn:Number;
			var newRow:Number;
			var canMove:Boolean = true;
			
			for (var i:int = 0; i < cells.length; i++) 
			{
				cell = Cell(cells[i]);
				
				// calculate the new column and row for the specified direction
				switch (direction) 
				{
					
					// TODO: move each case statement into its own protected 
					// function so its easily overriddable for variants
					
					case MoveDirection.MOVE_DOWN:
						newColumn = cell.column;
						newRow = cell.row + 1;
						break;
					
					case MoveDirection.MOVE_LEFT:
						newColumn = cell.column - 1;
						newRow = cell.row;
						break;
					
					case MoveDirection.MOVE_RIGHT:
						newColumn = cell.column + 1;
						newRow = cell.row;
						break;
					
					case MoveDirection.ROTATE_CLOCKWISE:
						// we perform rotation within a relative grid for the 
						// tetromino, where the top left cell is 0, 0 and that 
						// relative grid is determined by the tetromino size 
						// which will always be the same for the number of rows 
						// and columns, so we'll have 2x2, 3x3 and 4x4 grids 
						// where that top left cell starts at 0,0... think of 
						// it as a 2D array which is 0 based.
						newColumn = cell.column - tetromino.location.column;
						newRow = cell.row - tetromino.location.row;
						
						// the rotation magic.. sweet and simple.. basically 
						// we swap the values
						newRow = newColumn;
						newColumn = tetromino.size - (cell.row - tetromino.location.row) - 1; 
						
						newColumn = newColumn + tetromino.location.column;
						newRow = newRow + tetromino.location.row;
						break;
					
					case MoveDirection.ROTATE_COUNTER_CLOCKWISE:
						newColumn = cell.column - tetromino.location.column;
						newRow = cell.row - tetromino.location.row;
						
						newColumn = newRow;
						newRow = tetromino.size - (cell.column - tetromino.location.column) - 1;
						
						newColumn = newColumn + tetromino.location.column;
						newRow = newRow + tetromino.location.row;
						break;
				}
				
				// a cell location is invalid or is occupied so we can't rotate or move
				if (!grid.isInRange(newColumn, newRow) || grid.isCellOccupied(newColumn, newRow)) 
				{
					canMove = false;
					continue;
				} 
				else 
					movedCells.push(new Cell(newColumn, newRow));
			}
			
			if (canMove) 
			{
				switch (direction) 
				{
					case MoveDirection.MOVE_DOWN:
						tetromino.location.row = tetromino.location.row + 1;
						break;
					
					case MoveDirection.MOVE_LEFT:
						tetromino.location.column = tetromino.location.column - 1;
						break;
					
					case MoveDirection.MOVE_RIGHT:
						tetromino.location.column = tetromino.location.column + 1;
						break;
				}
				
				// commit moved cell locations
				for (var j:int = 0; j < movedCells.length; j++) 
				{
					cell = Cell(movedCells[j]);
					
					Cell(tetromino.cells[j]).column = cell.column;
					Cell(tetromino.cells[j]).row = cell.row;
				}
			}
			
			return canMove;
		}
	}
}