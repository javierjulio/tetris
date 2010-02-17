package com.javierjulio.tetris.view
{
	import com.javierjulio.tetris.model.grid.Grid;
	
	import flash.display.Graphics;
	import flash.display.Sprite;

	public class GridRenderer extends Sprite
	{
		public function GridRenderer()
		{
			super();
		}
		
		public var data:Grid;
		
		public function draw(height:Number, width:Number, cellSize:Number, rows:Number, cols:Number):void 
		{
			var g:Graphics = graphics;
			
			g.clear();
			
			// draw transparent hit area
			g.beginFill(0xFFFFFF, 0);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			g.lineStyle(1, 0xFFFFFF);
			
			// draw horizontal line dividers
			for (var row:int = 0; row < rows; row++) 
			{
				var newY:Number = cellSize * row;
				
				g.moveTo(0, newY);
				g.lineTo(width, newY);
			}
			
			// draw vertical line dividers
			for (var col:int = 0; col < cols; col++) 
			{
				var newX:Number = cellSize * col;
				
				g.moveTo(newX, 0);
				g.lineTo(newX, height);
			}
			
			// draw last vertical line
			g.moveTo(width, 0);
			g.lineTo(width, height);
			
			// draw last horizontal line
			g.moveTo(0, height);
			g.lineTo(width, height);
			/*
			// debug
			g.beginFill(0x666666);
			g.drawRect(cellSize * 2, cellSize * 2, cellSize, cellSize);
			g.endFill();
			// debug
			g.beginFill(0x666666);
			g.drawRect(cellSize * 9, cellSize * 19, cellSize, cellSize);
			g.endFill();
			*/
		}
	}
}