package com.kits.mini {
	import com.kits.Button;
	import com.kits.Kit;
	import com.kits.LabelButton;
	import com.kits.vo.ButtonVo;
	import com.kits.vo.LabelButtonVo;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniButton extends LabelButton {
		private var _labelButtonVo:LabelButtonVo;
		private var overSkin:Sprite;
		private var normalSkin:Sprite;
		private var disableSkin:Sprite;
		
		public function MiniButton(label:String = "") {
			_labelButtonVo = new LabelButtonVo();
			overSkin = new Sprite();
			normalSkin = new Sprite();
			disableSkin = new Sprite();
			
			_labelButtonVo.overSkin = overSkin
			_labelButtonVo.normalSkin = normalSkin
			_labelButtonVo.disableSkin = disableSkin
			_labelButtonVo.label = new MiniLabel(label)
			_labelButtonVo.label.move(3, 0)
			super(_labelButtonVo)
			redraw();
		}
		
		override public function draw():void {
			referSize(_labelButtonVo.label, 4, 0);
			MiniStyle.drawSkin(overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(normalSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(disableSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor, _width, _height);
			super.draw();
		}
	}
}