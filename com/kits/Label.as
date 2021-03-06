package com.kits {
	import com.kits.vo.LabelVo;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Label extends Kit {
		private var _labelVo:LabelVo;
		private var _color:int;
		
		public function Label(labelVo:LabelVo) {
			_labelVo = labelVo;
			mouseEnabled = false;
			mouseChildren = false;
			if (_labelVo.autoSize) {
				_labelVo.textField.autoSize = TextFieldAutoSize.LEFT;
			} else {
				_labelVo.textField.autoSize = TextFieldAutoSize.NONE;
			}
			_labelVo.textField.wordWrap = _labelVo.wordWrap
			addChild(_labelVo.textField);
		}
		
		override public function draw():void {
			_labelVo.textField.text = _labelVo.text;
			_width = (_labelVo.textField.width >> 0);
			_height = (_labelVo.textField.height >> 0);
			super.draw();
		}
		
		public function get text():String {
			return _labelVo.text;
		}
		
		public function set text(value:String):void {
			_labelVo.text = value;
			redraw()
		}
		
		public function get color():int {
			return _labelVo.color;
		}
		
		public function set color(value:int):void {
			_labelVo.color = value;
			enabled = super.enabled;
		}
		
		public function get disableColor():int {
			return _labelVo.disableColor;
		}
		
		public function set disableColor(value:int):void {
			_labelVo.disableColor = value;
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			_labelVo.textField.textColor = super.enabled ? _labelVo.color : _labelVo.disableColor;
		}
	}
}