package com.kits {
	import com.xmas.standard.IPoint;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	/**
	 * ...
	 * @author 蓝面包
	 */
	[Event(name="draw",type="com.kits.KitEvent")]
	
	public class Kit extends Sprite implements IPoint {
		private static var _tag:int
		//protected var _vo:KitVo;
		protected var _tag:int;
		protected var _enabled:Boolean;
		protected var _width:int;
		protected var _height:int;
		
		public function Kit() {
			_tag = Kit.tag
			_enabled = true;
			//redraw();
		}
		
		protected function redraw():void {
			addEventListener(Event.EXIT_FRAME, onRedraw);
		}
		
		/**
		 * 进入下一帧进行重绘组件
		 */
		protected function onRedraw(e:Event):void {
			draw();
			removeEventListener(Event.EXIT_FRAME, onRedraw);
			dispatchEvent(new KitEvent(KitEvent.DRAW));
		}
		
		public function referSize(kit:Kit, width:int = 0, height:int = 0):void {
			kit.priorDraw()
			_width = (kit.width >> 0) + width;
			_height = (kit.height >> 0) + height;
		}
		
		/**
		 * 抽象部位绘图,用于子类覆盖实现.
		 */
		public function draw():void {
		}
		
		public function priorDraw():void {
			if (hasEventListener(Event.EXIT_FRAME)) {
				draw()
				removeEventListener(Event.EXIT_FRAME, onRedraw);
			}
		}
		
		public function move(x:Number, y:Number):void {
			this.x = x >> 0;
			this.y = y >> 0;
		}
		
		public function removeFromParent():void {
			if (parent) {
				parent.removeChild(this)
			}
		}
		
		/**
		 * 设置组件尺寸大小.
		 * @param	width
		 * @param	height
		 */ //public function setSize(width:int, height:int):void {
		//_width = width;
		//_height = height;
		//redraw();
		//}
		//
		/**
		 * 设置/获取 组件标识号
		 */
		public function set tag(value:int):void {
			_tag = value;
		}
		
		public function get tag():int {
			return _tag;
		}
		
		public function get enabled():Boolean {
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void {
			mouseEnabled = value;
			mouseChildren = value;
			tabEnabled = value;
			_enabled = value;
		}
		
		override public function get width():Number {
			return _width;
		}
		
		override public function set width(value:Number):void {
			_width = value;
			redraw();
		}
		
		override public function get height():Number {
			return _height;
		}
		
		override public function set height(value:Number):void {
			_height = value;
			redraw();
		}
		
		override public function get x():Number {
			return super.x;
		}
		
		override public function set x(value:Number):void {
			super.x = value >> 0;
		}
		
		override public function get y():Number {
			return super.y;
		}
		
		override public function set y(value:Number):void {
			super.y = value >> 0;
		}
		
		/**
		 * 获取 内容宽度;
		 */
		public function get contentWidth():Number {
			return super.width
		}
		
		/**
		 * 获取 内容高度;
		 */
		public function get contentHeight():Number {
			return super.height
		}
		
		static public function get tag():int {
			_tag++
			return _tag;
		}
		
		//public function set vo(value:KitVo):void {
		//_vo = value;
		//}
		/**
		 * 本组件系统希望能在不缩放的舞台的上显示.
		 */
		public static function initStage(stage:Stage):void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
	}
}