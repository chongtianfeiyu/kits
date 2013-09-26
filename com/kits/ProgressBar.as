package com.kits {
	import com.kits.vo.ProgressBarVo;
	import com.xmas.utils.bound;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ProgressBar extends Kit {
		private var progressBarVo:ProgressBarVo;
		private var _progress:Number;
		
		public function ProgressBar(progressBarVo:ProgressBarVo) {
			this.progressBarVo = progressBarVo;
			addChild(progressBarVo.barSkin)
		}
		
		public function get progress():Number {
			return _progress;
		}
		
		public function set progress(value:Number):void {
			_progress = bound(value, 0, 1);
			redraw()
		}
		
		override public function draw():void {
			progressBarVo.barSkin.width = progressBarVo.width * _progress;
			super.draw();
		}
	}
}