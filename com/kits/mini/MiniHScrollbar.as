package com.kits.mini {
	import com.kits.Scrollbar;
	import com.kits.vo.ScrollbarVo;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniHScrollbar extends Scrollbar {
		private var _scrollbarVo:ScrollbarVo;
		
		public function MiniHScrollbar(long:int) {
			_scrollbarVo = new ScrollbarVo();
			_scrollbarVo.isHorizontal = true;
			_scrollbarVo.upSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.downSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.barSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.long = long;
			_scrollbarVo.lineNumber = 20;
			super(_scrollbarVo)
		}
		
		override public function draw():void {
			_scrollbarVo.downSkin.x = _scrollbarVo.long + _scrollbarVo.upSkin.width;
			slider.x = _scrollbarVo.upSkin.width;
			super.draw();
		}
	}
}