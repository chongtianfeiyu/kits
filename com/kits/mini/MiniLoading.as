package com.kits.mini {
	import com.kits.ProgressBar;
	import com.kits.vo.ProgressBarVo;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniLoading extends ProgressBar {
		private var barSkin:Shape;
		private var progressBarVo:ProgressBarVo
		private var bg:Shape;
		private var miniLabel:MiniLabel;
		
		public function MiniLoading(width:int = 100) {
			_width = width;
			miniLabel = new MiniLabel("LOADING...");
			miniLabel.y = 5;
			progressBarVo = new ProgressBarVo();
			barSkin = new Shape();
			barSkin.graphics.beginFill(MiniStyle.panelBackground, 1);
			barSkin.graphics.drawRect(0, 0, 5, 5);
			barSkin.graphics.endFill();
			barSkin.x = 5
			barSkin.y = 25
			bg = new Shape();
			addChild(bg)
			addChild(miniLabel)
			progressBarVo.barSkin = barSkin;
			super(progressBarVo);
			redraw();
		}
		
		override public function draw():void {
			miniLabel.text = Math.random() > 0.5 ? "LOADING.." : "LOADING...";
			progressBarVo.width = _width - 10
			miniLabel.x = _width / 2 - 25
			bg.graphics.beginFill(MiniStyle.windowBackground, 1);
			bg.graphics.drawRect(0, 0, _width, 40);
			bg.graphics.endFill();
			super.draw();
		}
	}
}