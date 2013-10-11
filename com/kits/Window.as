package com.kits {
	import com.kits.vo.WindowVo;
	import com.xmas.standard.IPoint;
	import com.xmas.utils.bound;
	import com.xmas.utils.Drager;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Window extends Panel implements IPoint {
		private var _windowVo:WindowVo;
		private var _drager:Drager;
		
		public function Window(windowVo:WindowVo) {
			super(windowVo)
			_windowVo = windowVo;
			_drager = new Drager()
			_drager.boundStage = true;
			_drager.start(this, windowVo.titlePanel);
			_drager.useHandCursor = true;
			addChild(windowVo.content)
			addChild(windowVo.titlePanel)
			addChild(windowVo.closeButton)
			windowVo.titlePanel.addChild(windowVo.title)
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			this.addEventListener(MouseEvent.MOUSE_DOWN, this_mouseDown);
		}
		
		private function this_mouseDown(e:MouseEvent):void {
			this.parent.addChild(this);
		}
		
		private function addedToStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			stage.addEventListener(Event.RESIZE, resize);
		}
		
		private function resize(e:Event):void {
			x = bound(x, 0, stage.stageWidth - width);
			y = bound(y, 0, stage.stageHeight - height);
		}
		
		private function removedFromStage(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			stage.removeEventListener(Event.RESIZE, resize);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		public function get content():Panel {
			return _windowVo.content;
		}
		
		//override public function draw():void {
			//super.draw();
		//}
		//override public function get width():Number {
		//return super.width;
		//}
		//
		//override public function set width(value:Number):void {
		//super.width = value;
		//_windowVo.content.width = value;
		//_windowVo.titlePanel.width = value;
		//}
		//override public function get height():Number {
		//return super.height;
		//}
		//
		//override public function set height(value:Number):void {
		//super.height = value;
		//_windowVo.content.height = value - _windowVo.titlePanel.height;
		//}
	}
}