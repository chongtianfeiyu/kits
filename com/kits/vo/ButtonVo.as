package com.kits.vo {
	import com.kits.KitVo;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ButtonVo extends KitVo {
		public var normalSkin:DisplayObject;
		public var downSkin:DisplayObject;
		public var overSkin:DisplayObject;
		public var disableSkin:DisplayObject;
		public function ButtonVo() {
			super();
		}
	}
}