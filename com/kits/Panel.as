package com.kits {
	import com.kits.vo.PanelVo;
	
	public class Panel extends Kit {
		private var _panelVo:PanelVo;
		
		public function Panel(panelVo:PanelVo) {
			_panelVo = panelVo;
			if (panelVo.mask) {
				addChild(panelVo.mask);
				this.mask = panelVo.mask
			}
		}
		
		public function get backgroundColor():int {
			return _panelVo.backgroundColor;
		}
		
		public function set backgroundColor(value:int):void {
			_panelVo.backgroundColor = value;
			redraw()
		}
		
		public function get backgroundAlpha():Number {
			return _panelVo.backgroundAlpha;
		}
		
		public function set backgroundAlpha(value:Number):void {
			_panelVo.backgroundAlpha = value;
			redraw()
		}
		
		override public function draw():void {
			graphics.clear();
			graphics.beginFill(_panelVo.backgroundColor, _panelVo.backgroundAlpha);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
			super.draw()
		}
		
		//override public function set vo(value:KitVo):void {
			//super.vo = value;
			//_panelVo = value as PanelVo;
		//}
	}
}