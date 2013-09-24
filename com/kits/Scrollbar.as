package com.kits {
	import com.kits.vo.ScrollbarVo;
	import com.kits.vo.SliderVo;
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.plus.PlusMousePress;
	import com.xmas.utils.bound;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Scrollbar extends Kit {
		private var _scrollbarVo:ScrollbarVo;
		private var _sliderVo:SliderVo;
		private var downPress:PlusMousePress;
		private var upPress:PlusMousePress;
		private var _slider:Slider;
		private var _long:Number;
		
		public function Scrollbar(scrollbarVo:ScrollbarVo) {
			_scrollbarVo = scrollbarVo;
			_sliderVo = new SliderVo();
			_sliderVo.slip = _scrollbarVo.barSkin;
			_slider = new Slider(_sliderVo);
			long = _scrollbarVo.long;
			addChild(slider)
			if (_scrollbarVo.downSkin) {
				addChild(_scrollbarVo.downSkin)
				downPress = new PlusMousePress();
				downPress.interactiveObject = _scrollbarVo.downSkin;
				downPress.addEventListener(PlusMouseEvent.LONG_PRESSING, downSkin_mouseDown);
				_scrollbarVo.downSkin.addEventListener(MouseEvent.MOUSE_DOWN, downSkin_mouseDown);
			}
			if (_scrollbarVo.upSkin) {
				addChild(_scrollbarVo.upSkin)
				upPress = new PlusMousePress();
				upPress.interactiveObject = _scrollbarVo.upSkin;
				upPress.addEventListener(PlusMouseEvent.LONG_PRESSING, upSkin_mouseDown);
				_scrollbarVo.upSkin.addEventListener(MouseEvent.MOUSE_DOWN, upSkin_mouseDown);
			}
			super();
			redraw();
		}
		
		public function get long():Number {
			return _long;
		}
		
		public function set long(value:Number):void {
			_long = value;
			if (_scrollbarVo.isHorizontal) {
				_slider.width = value;
			} else {
				_slider.height = value
			}
		}
		
		private function downSkin_mouseDown(e:MouseEvent):void {
			if (_scrollbarVo.isHorizontal) {
				_slider.tutor.scaleX = bound(_slider.tutor.scaleX + 1 / _scrollbarVo.lineNumber, 0, 1);
			} else {
				_slider.tutor.scaleY = bound(_slider.tutor.scaleY + 1 / _scrollbarVo.lineNumber, 0, 1);
			}
			_slider.upSlip();
		}
		
		private function upSkin_mouseDown(e:MouseEvent):void {
			if (_scrollbarVo.isHorizontal) {
				_slider.tutor.scaleX = bound(_slider.tutor.scaleX - 1 / _scrollbarVo.lineNumber, 0, 1);
			} else {
				_slider.tutor.scaleY = bound(_slider.tutor.scaleY - 1 / _scrollbarVo.lineNumber, 0, 1);
			}
			_slider.upSlip();
		}
		
		public function get slider():Slider {
			return _slider;
		}
		
		public function set slider(value:Slider):void {
			_slider = value;
		}
	}
}