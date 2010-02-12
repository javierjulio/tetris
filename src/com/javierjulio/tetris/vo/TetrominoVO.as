package com.javierjulio.tetris.vo
{
	import com.javierjulio.tetris.enum.TetrominoTypeEnum;
	
	/**
	 * The <code>TetrominoVO</code> object defines a Tetromino's cell locations, 
	 * the size in which those cell coordinates are defined in, and the type 
	 * (L, T, Z, etc.). While you can create this class directly, you should 
	 * retrieve an instance using the <code>TetrominoFactory</code> class.
	 */
	public class TetrominoVO
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function TetrominoVO()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  cells
		//----------------------------------
		
		/**
		 * A collection of cell coordinates where each block for this Tetromino 
		 * appears at. The coordinates are relative to a grid defined by the 
		 * Tetromino size with a top left coordinate of 0, 0. So if the 
		 * <code>size</code> is 4 (say for an L Tetromino) then the coordinates are 
		 * relative to a 4x4 grid.
		 * 
		 * @default null
		 */
		public var cells:Array;
		
		//----------------------------------
		//  rotatable
		//----------------------------------
		
		/**
		 * A flag that indicates whether this Tetromino is rotatable. Almost all 
		 * Tetrominoes can rotate except those where the same amount of cell 
		 * coordinate pairs match the total amount of rows and columns. For 
		 * example, an O Tetromino has 4 cells and a size of 2 (2 rows and 2 
		 * columns) thus is not rotatable.
		 * 
		 * @default true
		 */
		public var rotatable:Boolean = true;
		
		//----------------------------------
		//  size
		//----------------------------------
		
		/**
		 * The size of the grid that Tetromino takes up. The number of grid 
		 * columns and rows will always be the same thus consolidated into this one 
		 * property.
		 * 
		 * @default NaN
		 */
		public var size:Number;
		
		//----------------------------------
		//  startGridPoint
		//----------------------------------
		
		// FIXME: might not be necessary to store here but instead store in the GridModel
		
		/**
		 * The starting, top left cell coordinate in the Tetris grid where the 
		 * Tetromino appears at.
		 * 
		 * <p>We use this coordinate with the cell coordinates defined in the 
		 * <code>cells</code> property to determine exactly where each block 
		 * in the Tetromino appears at in the Tetris grid.</p>
		 * 
		 * @default null
		 */
		public var startGridPoint:CellVO;
		
		//----------------------------------
		//  type
		//----------------------------------
		
		/**
		 * The type of Tetromino.
		 * 
		 * @default null
		 */
		public var type:TetrominoTypeEnum;
	}
}