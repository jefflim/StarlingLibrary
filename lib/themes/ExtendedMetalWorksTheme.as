package feathers.themes {
	import flash.text.Font;
	import flash.text.TextFormat;
	
	import feathers.controls.Button;
	import feathers.controls.ScrollText;
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	
	import ui.EmbeddedAssets;
	import feathers.controls.Scroller;

	public class ExtendedMetalWorksTheme extends MetalWorksMobileTheme {
		public static const ALTERNATE_NAME_MY_CUSTOM_BUTTON:String = "my-custom-button";

		public function ExtendedMetalWorksTheme(root:DisplayObjectContainer, scaleToDPI:Boolean = true) {
			super(root, scaleToDPI);
		}

		override protected function initialize():void {
			super.initialize();

			this.setInitializerForClass( Button, myCustomButtonInitializer, ALTERNATE_NAME_MY_CUSTOM_BUTTON );
		}

		private function myCustomButtonInitializer(button:Button):void {
			button.defaultSkin = new Image(this.atlas.getTexture("button-up-skin"));
			button.downSkin = new Image(this.atlas.getTexture("button-down-skin"));
			button.hoverSkin = new Image(this.atlas.getTexture("button-selected-up-skin"));
			
			
			var __font:Font = new EmbeddedAssets.Balloon();
			button.defaultLabelProperties.textFormat = new TextFormat("Balloon", 38);
			button.defaultLabelProperties.embedFonts = true;
			button.disabledLabelProperties.textFormat = this.smallUIDisabledTextFormat;
			button.selectedDisabledLabelProperties.textFormat = this.smallUIDisabledTextFormat;
		}
		
		override protected function scrollTextInitializer(text:ScrollText):void{
			super.scrollTextInitializer(text);
			text.textFormat = new TextFormat("Balloon", 16);
			text.embedFonts = true;
		}
		
		override protected function scrollerInitializer(scroller:Scroller):void{
			super.scrollerInitializer(scroller);
			scroller.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			
			//* change to mouse controller mode
			scroller.interactionMode = Scroller.INTERACTION_MODE_MOUSE;
		}
			
	}
}
