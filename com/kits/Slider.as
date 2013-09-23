package com.kits {
	import com.kits.vo.SliderVo;
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.original.PlaneScaleVo;
	import com.xmas.utils.bound;
	import com.xmas.utils.Drager;
	import flash.events.Event;
	import flash.geom.Rectangle;
	[Event(name="drag",type="com.xmas.utils.DragerEvent")]
	
	public class Slider extends Kit {
		private var _sliderVo:SliderVo;
		private var _drager:Drager;
		private var _tutor:PlaneScaleVo;
		
		public function Slider(sliderVo:SliderVo) {
			_sliderVo = sliderVo;
			_drager = new Drager();
			_width = sliderVo.width;
			_height = sliderVo.height;
			_drager.boundRect = new Rectangle(0, 0, sliderVo.width, sliderVo.height);
			_tutor = new PlaneScaleVo(sliderVo.width, sliderVo.height);
			_drager.start(_tutor, sliderVo.slip);
			_drager.addEventListener(PlusMouseEvent.DRAG, drager_drag);
			addChild(sliderVo.slip);
		}
		
		override public function draw():void {
			var scaleX:Number = _tutor.scaleX;
			var scaleY:Number = _tutor.scaleY;
			_drager.boundRect.height = _tutor.height = bound(_height - _sliderVo.slip.height, 0, _height);
			_drager.boundRect.width = _tutor.width = bound(_width - _sliderVo.slip.width, 0, _width);
			_tutor.scaleX = isNaN(scaleX) ? 0 : scaleX;
			_tutor.scaleY = isNaN(scaleY) ? 0 : scaleY;
			upSlip()
		}
		
		private function drager_drag(e:PlusMouseEvent):void {
			upSlip()
			dispatchEvent(PlusMouseEvent(e))
		}
		
		public function upSlip():void {
			_sliderVo.slip.x = _tutor.x;
			_sliderVo.slip.y = _tutor.y;
		}
		
		public function get tutor():PlaneScaleVo {
			return _tutor;
		}
	}
}