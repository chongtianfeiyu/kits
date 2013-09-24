package com.kits.mini {
	import com.kits.Panel;
	import com.kits.vo.PanelVo;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniPanel extends Panel {
		private var _panelVo:PanelVo;
		
		public function MiniPanel(width:int = 100, height:int = 100) {
			_panelVo = new PanelVo();
			_panelVo.mask = new Shape()
			_width = width;
			_height = height;
			super(_panelVo);
			redraw();
		}
		
		override public function draw():void {
			_panelVo.mask.graphics.clear();
			_panelVo.mask.graphics.beginFill(0,0);
			_panelVo.mask.graphics.drawRect(0, 0, _width, _height);
			_panelVo.mask.graphics.endFill();
			super.draw();
		}
	}
}