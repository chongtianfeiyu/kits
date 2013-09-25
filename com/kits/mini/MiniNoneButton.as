package com.kits.mini {
	import com.kits.Button;
	import com.kits.vo.ButtonVo;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniNoneButton extends Button {
		private var _buttonVo:ButtonVo;
		private var overSkin:Sprite;
		private var normalSkin:Sprite;
		private var disableSkin:Sprite;
		
		public function MiniNoneButton(width:int = 5, height:int = 5) {
			_buttonVo = new ButtonVo();
			overSkin = new Sprite();
			normalSkin = new Sprite();
			disableSkin = new Sprite();
			_buttonVo.overSkin = overSkin;
			_buttonVo.normalSkin = normalSkin;
			_buttonVo.disableSkin = disableSkin;
			super(_buttonVo)
			this.width = width;
			this.height = height;
		}
		
		override public function draw():void {
			MiniStyle.drawSkin(overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(normalSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(disableSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor, _width, _height);
			super.draw();
		}
	}
}