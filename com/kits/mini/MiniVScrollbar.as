package com.kits.mini {
	import com.kits.Scrollbar;
	import com.kits.vo.ScrollbarVo;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniVScrollbar extends Scrollbar {
		private var _scrollbarVo:ScrollbarVo;
		
		public function MiniVScrollbar(long:int) {
			_scrollbarVo = new ScrollbarVo();
			_scrollbarVo.isHorizontal = false;
			_scrollbarVo.upSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.downSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.barSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.long = long;
			_width = 14
			_height = long + 28
			_scrollbarVo.lineNumber = 20;
			super(_scrollbarVo)
		}
		
		override public function draw():void {
			_scrollbarVo.downSkin.y = _height - _scrollbarVo.upSkin.height;
			slider.y = 14;
		}
		
		override public function get height():Number {
			return super.height;
		}
		
		override public function set height(value:Number):void {
			super.height = value;
			long = value-28;
		}
	}
}