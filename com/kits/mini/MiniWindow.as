package com.kits.mini {
	import com.kits.Button;
	import com.kits.vo.WindowVo;
	import com.kits.Window;
	import flash.display.Shape;
	
	public class MiniWindow extends Window {
		private var _windowVo:WindowVo;
		
		public function MiniWindow(width:int = 200, height:int = 100) {
			redraw();
			_windowVo = new WindowVo();
			_width = width
			_height = height
			_windowVo.content = new MiniPanel(_width, _height - 20);
			_windowVo.content.move(0, 20);
			_windowVo.content.backgroundColor = MiniStyle.windowBackground;
			_windowVo.content.backgroundAlpha = 1;
			_windowVo.titlePanel = new MiniPanel(_width, 20);
			_windowVo.titlePanel.backgroundColor = MiniStyle.panelBackground
			_windowVo.titlePanel.backgroundAlpha = 1;
			_windowVo.closeButton = new MiniButton("X")
			_windowVo.closeButton.y = 1;
			_windowVo.title = new MiniLabel();
			super(_windowVo)
		}
		
		override public function draw():void {
			_windowVo.title.priorDraw();
			_windowVo.closeButton.priorDraw();
			_windowVo.closeButton.x = _width - _windowVo.closeButton.width - 1;
			_windowVo.title.x = _width / 2 - _windowVo.title.width / 2;
			_windowVo.titlePanel.width = _width;
			_windowVo.content.width = _width;
			_windowVo.content.height = _height - _windowVo.titlePanel.height;
			_windowVo.content.priorDraw();
			_windowVo.titlePanel.priorDraw();
			super.draw();
		}
		
		public function get title():String {
			return _windowVo.title.text;
		}
		
		public function set title(value:String):void {
			_windowVo.title.text = value;
			redraw();
		}
		//protected function get windowVo():WindowVo {
			//return _windowVo;
		//}
		
		public function get closeButton():Button {
			return _windowVo.closeButton;
		}
	}
}