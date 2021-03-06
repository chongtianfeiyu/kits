package com.kits.mini {
	import com.kits.Label;
	import com.kits.vo.LabelVo;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniLabel extends Label {
		private var _labelVo:LabelVo;
		private var _textField:TextField;
		
		public function MiniLabel(text:String = "") {
			_textField = new TextField();
			_textField.mouseEnabled = false;
			_textField.selectable = false;
			_textField.embedFonts = true;
			_textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			_labelVo = new LabelVo();
			_labelVo.textField = _textField
			_labelVo.autoSize = true;
			_labelVo.wordWrap = false;
			super(_labelVo)
			this.text = text;
			this.color = int(MiniStyle.defaultTextFormat.color);
			this.disableColor = MiniStyle.textEnabledColor;
		}
		
		override public function draw():void {
			_width = _textField.width >> 0;
			_height = _textField.height >> 0;
			super.draw();
		}
	}
}