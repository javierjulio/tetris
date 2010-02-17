package
{
	import com.javierjulio.tetris.core.MoveDirection;
	import com.javierjulio.tetris.core.TetrominoFactory;
	import com.javierjulio.tetris.enum.TetrominoTypeEnum;
	import com.javierjulio.tetris.model.GameModel;
	import com.javierjulio.tetris.model.grid.Cell;
	import com.javierjulio.tetris.model.grid.Grid;
	import com.javierjulio.tetris.utils.ArrayUtil;
	import com.javierjulio.tetris.view.GridRenderer;
	import com.javierjulio.tetris.view.Tetromino;
	import com.javierjulio.tetris.vo.TetrominoVO;
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	[SWF(width="800", height="600", backgroundColor="#333333", framerate="30")]
	public class Tetris extends Sprite
	{
		private var grid:GridRenderer;
		private var randomTetromino:TetrominoVO;
		private var shadowTetromino:TetrominoVO;
		private var tetromino:Tetromino;
		
		private var gameModel:GameModel;
		private var gridModel:Grid;
		
		public function Tetris()
		{
			super();
			
			gridModel = new Grid(10, 22, Cell);
			gameModel = new GameModel();
			gameModel.grid = gridModel;
			
			grid = new GridRenderer();
			grid.data = gridModel;
			grid.draw(440, 200, 20, 22, 10);
			addChild(grid);
			
			randomTetromino = TetrominoFactory.getNextTetromino();
			
			shadowTetromino = TetrominoFactory.getTetrominoByType(randomTetromino.type);
			
			tetromino = new Tetromino();
			tetromino.draw(randomTetromino);
			
			grid.addChild(tetromino);
			
			grid.addEventListener(MouseEvent.CLICK, grid_clickHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUpHandler);
		}
		
		private function grid_clickHandler(event:MouseEvent):void 
		{
			if (grid.contains(tetromino)) 
				grid.removeChild(tetromino);
			
			randomTetromino = TetrominoFactory.getNextTetromino();
			tetromino = new Tetromino();
			tetromino.draw(randomTetromino);
			
			grid.addChild(tetromino);
		}
		
		private function stage_keyUpHandler(event:KeyboardEvent):void 
		{
			var direction:String;
			
			switch (event.keyCode) 
			{
				case Keyboard.DOWN:
					direction = MoveDirection.MOVE_DOWN;
					break;
				
				case Keyboard.LEFT:
					direction = MoveDirection.MOVE_LEFT;
					break;
				
				case Keyboard.RIGHT:
					direction = MoveDirection.MOVE_RIGHT;
					break;
				
				case Keyboard.UP:
					if (!randomTetromino.rotatable) 
						return;
					
					direction = MoveDirection.ROTATE_CLOCKWISE;
					break;
				
				case Keyboard.TAB:
					if (!randomTetromino.rotatable) 
						return;
					
					direction = MoveDirection.ROTATE_COUNTER_CLOCKWISE;
					break;
			}
			
			var result:Boolean = gameModel.move(randomTetromino, direction);
			trace(direction, result);
			if (result) 
			{
				shadowTetromino.location.column = randomTetromino.location.column;
				shadowTetromino.location.row = randomTetromino.location.row;
				
				for (var i:int = 0; i < randomTetromino.cells.length; i++) 
				{
					shadowTetromino.cells[i].column = randomTetromino.cells[i].column;
					shadowTetromino.cells[i].row = randomTetromino.cells[i].row;
				}
				
				switch (event.keyCode) 
				{
					case Keyboard.DOWN:
						while (gameModel.move(shadowTetromino, direction));
						break;
					
					case Keyboard.LEFT:
						while (gameModel.move(shadowTetromino, MoveDirection.MOVE_DOWN));
						break;
					
					case Keyboard.RIGHT:
						while (gameModel.move(shadowTetromino, MoveDirection.MOVE_DOWN));
						break;
					
					case Keyboard.UP:
						while (gameModel.move(shadowTetromino, MoveDirection.MOVE_DOWN));
						break;
					
					case Keyboard.TAB:
						while (gameModel.move(shadowTetromino, MoveDirection.MOVE_DOWN));
						break;
				}
				
				shadow.draw(shadowTetromino);
				
				if (!grid.contains(shadow)) 
					grid.addChild(shadow);
				
				tetromino.draw(randomTetromino);
			}
		}
		
		private var shadow:Tetromino = new Tetromino();
	}
}