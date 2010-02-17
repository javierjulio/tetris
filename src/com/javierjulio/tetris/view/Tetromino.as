package com.javierjulio.tetris.view
{
	import com.javierjulio.tetris.model.grid.Cell;
	import com.javierjulio.tetris.vo.TetrominoVO;
	
	import flash.display.Graphics;
	import flash.display.Sprite;

	public class Tetromino extends Sprite
	{
		public function Tetromino()
		{
			super();
		}
		
		public function draw(tetromino:TetrominoVO):void 
		{
			var g:Graphics = graphics;
			
			var cellSize:Number = 20;
			var cell:Cell;
			
			g.clear();
			
			var cells:Array = tetromino.cells;
			
			for (var i:int = 0; i < cells.length; i++) 
			{
				cell = Cell(cells[i]);
				
				var x:Number = cellSize * cell.column;
				var y:Number = cellSize * cell.row;
				
				g.beginFill(0x888888);
				g.drawRect(x + 1, y + 1, cellSize - 2, cellSize - 2);
				g.endFill();
			}
			/*
			for (var row:int = 0; row < rows; row++) 
			{
				var y:Number = cellSize * row;
				
				for (var col:int = 0; col < cols; col++) 
				{
					if (tetromino.cells[row][col] == 0) 
						continue;
					
					var x:Number = cellSize * col;
					
					g.beginFill(0x888888);
					g.drawRect(x + 1, y + 1, cellSize - 2, cellSize - 2);
					g.endFill();
				}
			}
			*/
		}
	}
}