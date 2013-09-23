package com.kits.mini {
	import com.kits.Slider;
	import com.kits.vo.SliderVo;
	import com.xmas.utils.bound;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniVSlider extends Slider {
		private var sliderVo:SliderVo;
		
		public function MiniVSlider(long:int = 100) {
			sliderVo = new SliderVo();
			sliderVo.height = long;
			sliderVo.slip = new MiniNoneButton(14, 14)
			super(sliderVo);
		}
		
		public function get ratio():Number {
			return tutor.scaleY;
		}
		
		public function set ratio(vaule:Number):void {
			tutor.scaleY = bound(vaule, 0, 1);
			upSlip();
		}
		
		public function get long():int {
			return height;
		}
		
		public function set long(value:int):void {
			height = value;
		}
	}
}