package com.kits.mini {
	import com.kits.Slider;
	import com.xmas.events.PlusMouseEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class AllMini extends Sprite {
		private var miniButton:MiniButton;
		private var enabledButton:MiniButton;
		private var miniLabel:MiniLabel;
		private var colorButton:MiniButton;
		private var miniTextbox:MiniTextbox;
		private var miniTextButton:MiniTextButton;
		private var miniPanel:MiniPanel;
		private var miniPrompt:MiniPrompt;
		private var miniWindow:MiniWindow;
		private var miniSlider:MiniVSlider;
		private var miniVScrollbar:MiniVScrollbar;
		
		public function AllMini() {
			//---------------------------
			miniLabel = new MiniLabel("miniLabel");
			miniLabel.move(2, 2);
			addChild(miniLabel);
			//---------------------------
			miniTextbox = new MiniTextbox("MiniTextbox__MiniTextbox", 50);
			miniTextbox.move(100, 2);
			addChild(miniTextbox);
			//---------------------------
			miniTextButton = new MiniTextButton("MiniTextButton");
			miniTextButton.addEventListener(MouseEvent.CLICK, miniTextButton_click);
			miniTextButton.move(200, 40);
			addChild(miniTextButton);
			//---------------------------
			enabledButton = new MiniButton("ENABLED:false");
			enabledButton.addEventListener(MouseEvent.CLICK, enabledButton_click);
			enabledButton.move(300, 300);
			addChild(enabledButton);
			//-------------------
			colorButton = new MiniButton("change color");
			colorButton.addEventListener(MouseEvent.CLICK, click);
			colorButton.move(400, 300);
			addChild(colorButton);
			//-------------------------------
			miniPanel = new MiniPanel(200, 100)
			miniPanel.move(400, 200);
			addChild(miniPanel);
			miniButton = new MiniButton("MiniButton\nMiniButton");
			miniButton.width = 10; //无效操作
			miniButton.move(-10, -10);
			miniPanel.addChild(miniButton);
			miniWindow = new MiniWindow();
			miniWindow.title = "MiniWindow"
			miniWindow.height = 50;
			//miniWindow.text = "MiniWindowMiniWindowMiniWindowMiniWindowMiniWindowMiniWindow"
			miniWindow.move(400, 2);
			addChild(miniWindow);
			miniPrompt = new MiniPrompt(200)
			miniPrompt.title = "MiniPrompt"
			miniPrompt.text = "MiniPromptMiniProiniPromptMiiniPromptMiniPromptMiniPromptMiniPrompt"
			miniPrompt.move(20, 130);
			addChild(miniPrompt);
			miniPrompt.submitButton.addEventListener(MouseEvent.CLICK, submitButton_click);
			miniPrompt.closeButton.addEventListener(MouseEvent.CLICK, closeButton_click);
			//--------------------
			miniSlider = new MiniVSlider();
			miniSlider.move(300, 100)
			miniSlider.addEventListener(PlusMouseEvent.DRAG, miniSlider_drag);
			addChild(miniSlider)
			miniVScrollbar = new MiniVScrollbar(200);
			miniVScrollbar.move(400, 100)
			addChild(miniVScrollbar);
		}
		
		private function miniTextButton_click(e:MouseEvent):void {
			miniVScrollbar.height+=10
		}
		
		private function miniSlider_drag(e:PlusMouseEvent):void {
			trace(miniSlider.ratio)
		}
		
		private function closeButton_click(e:MouseEvent):void {
			miniPrompt.removeFromParent()
		}
		
		private function submitButton_click(e:MouseEvent):void {
			miniPrompt.text += "tMiniPromptMiniPromptMiniPromptMiniPromptMiniPromptM"
			miniPrompt.width += 4;
		}
		
		private function click(e:MouseEvent):void {
			miniLabel.color = Math.random() * 0xFFFFFF
			miniTextbox.color = Math.random() * 0xFFFFFF
			miniTextButton.color = Math.random() * 0xFFFFFF
		}
		
		private function enabledButton_click(e:MouseEvent):void {
			miniButton.enabled = !miniButton.enabled;
			miniLabel.enabled = !miniLabel.enabled;
			colorButton.enabled = !colorButton.enabled
			enabledButton.label = "ENABLED:" + !miniLabel.enabled;
			miniTextButton.enabled = !miniTextButton.enabled
			miniPrompt.enabled = !miniPrompt.enabled
			miniSlider.ratio += 0.1
		}
	}
}