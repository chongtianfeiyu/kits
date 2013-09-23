package com.kits.mini {
	import com.kits.Slider;
	import com.kits.vo.SliderVo;
	import com.xmas.utils.bound;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniHSlider extends Slider {
		private var sliderVo:SliderVo;
		
		public function MiniHSlider(long:int = 100) {
			sliderVo = new SliderVo();
			sliderVo.width = long;
			sliderVo.slip = new MiniNoneButton(14, 14)
			super(sliderVo);
		}
		
		public function get ratio():Number {
			return tutor.scaleX;
		}
		
		public function set ratio(vaule:Number):void {
			tutor.scaleX = bound(vaule, 0, 1);
			upSlip();
		}
		
		public function get long():int {
			return width;
		}
		
		public function set long(value:int):void {
			width = value;
		}
	}
}