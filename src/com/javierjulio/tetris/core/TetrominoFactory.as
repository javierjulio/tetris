package com.javierjulio.tetris.core
{
	import com.javierjulio.tetris.enum.TetrominoTypeEnum;
	import com.javierjulio.tetris.utils.ArrayUtil;
	import com.javierjulio.tetris.utils.MathUtil;
	import com.javierjulio.tetris.vo.CellVO;
	import com.javierjulio.tetris.vo.TetrominoVO;
	
	// FIXME: change static methods to be instanced based, this way we can customize 
	// the factory and use dependency injection for variant play styles
	
	public class TetrominoFactory
	{
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 * Storage for the randomly generated list of 
		 * <code>TetrominoTypeEnum</code>'s used when calling 
		 * <code>getRandomTetromino()</code>.
		 */
		private static var types:Array;
		
		/**
		 * Returns a random, fully initialized <code>TetrominoVO</code>.
		 * 
		 * @return The random, fully initialized <code>TetrominoVO</code>
		 */
		public static function getRandomTetromino():TetrominoVO 
		{
			// if we are just starting off for the first time, we won't have any 
			// tetrominoes so go ahead and create the initial bag
			if (!types) 
			{
				types = ArrayUtil.shuffle(TetrominoTypeEnum.list());
			}
			
			// TODO: this number below should be configurable, as it represents 
			// the number of Tetrominoes being previewed
			
			// TODO: should make initial list of types accessible for previewing
			
			// as we start to retrieve tetrominoes from the initial bag we've 
			// generated, at some point we'll need to create a new bag, we'll need 
			// at least 5 since we have a falling tetromino plus 4 shown coming up
			if (types.length < 5) 
			{
				var newSet:Array = ArrayUtil.shuffle(TetrominoTypeEnum.list());
				
				types = types.concat(newSet);
			}
			
			trace(types);
			
			return getTetromino(types.shift());
		}
		
		/**
		 * Returns a new fully initialized TetrominoVO based on the type given.
		 * 
		 * @param type The type of Tetromino.
		 * 
		 * @return The fully initialized TetrominoVO object.
		 */
		public static function getTetromino(type:TetrominoTypeEnum):TetrominoVO 
		{
			var tetromino:TetrominoVO;
			var cells:Array = [];
			var size:Number = 3;
			var startGridPoint:CellVO;
			
			// FIXME: don't think that we should track the starting top left 
			// cell location of the falling tetromino within the TetrominoVO 
			// object but rather in the GameModel
			
			// specify initial cell positions for each tetromino
			switch (type) 
			{
				case TetrominoTypeEnum.I:
					size = 4;
					cells.push(new CellVO(1, 0));
					cells.push(new CellVO(1, 1));
					cells.push(new CellVO(1, 2));
					cells.push(new CellVO(1, 3));
					startGridPoint = new CellVO(0, 0); // this should be row 0 of the grid and column is half the grid size rounded down
					break;
				
				case TetrominoTypeEnum.O:
					size = 2;
					cells.push(new CellVO(0, 0));
					cells.push(new CellVO(1, 0));
					cells.push(new CellVO(0, 1));
					cells.push(new CellVO(1, 1));
					startGridPoint = new CellVO(0, 0);
					break;
				
				case TetrominoTypeEnum.T:
					cells.push(new CellVO(1, 0));
					cells.push(new CellVO(0, 1));
					cells.push(new CellVO(1, 1));
					cells.push(new CellVO(1, 2));
					startGridPoint = new CellVO(0, 0);
					break;
				
				case TetrominoTypeEnum.S:
					cells.push(new CellVO(1, 0));
					cells.push(new CellVO(0, 1));
					cells.push(new CellVO(1, 1));
					cells.push(new CellVO(0, 2));
					startGridPoint = new CellVO(0, 0);
					break;
				
				case TetrominoTypeEnum.Z:
					cells.push(new CellVO(0, 0));
					cells.push(new CellVO(0, 1));
					cells.push(new CellVO(1, 1));
					cells.push(new CellVO(1, 2));
					startGridPoint = new CellVO(0, 0);
					break;
				
				case TetrominoTypeEnum.J:
					cells.push(new CellVO(0, 0));
					cells.push(new CellVO(1, 0));
					cells.push(new CellVO(1, 1));
					cells.push(new CellVO(1, 2));
					startGridPoint = new CellVO(0, 0);
					break;
				
				case TetrominoTypeEnum.L:
					cells.push(new CellVO(1, 0));
					cells.push(new CellVO(1, 1));
					cells.push(new CellVO(0, 2));
					cells.push(new CellVO(1, 2));
					startGridPoint = new CellVO(0, 0);
					break;
				
			}
			
			tetromino = new TetrominoVO();
			tetromino.cells = cells;
			tetromino.size = size;
			tetromino.type = type;
			tetromino.rotatable = (size * 2 != cells.length);
			tetromino.startGridPoint = startGridPoint;
			
			return tetromino;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function TetrominoFactory()
		{
			super();
		}
	}
}