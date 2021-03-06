package com.kits.mini {
	import com.kits.TextButton;
	import com.kits.vo.TextButtonVo;
	import flash.text.TextField;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniTextButton extends TextButton {
		private var _textField:TextField;
		private var _textButtonVo:TextButtonVo;
		public function MiniTextButton(text:String = "") {
			_textField = new TextField();
			_textField.selectable = false;
			_textField.embedFonts = true;
			_textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			_textButtonVo = new TextButtonVo();
			_textButtonVo.textField = _textField
			_textButtonVo.normalColor = int(MiniStyle.defaultTextFormat.color);
			_textButtonVo.overColor = MiniStyle.textOverColor;
			_textButtonVo.disableColor = MiniStyle.textEnabledColor;
			super(_textButtonVo)
			this.label = text;
		}
	}
}