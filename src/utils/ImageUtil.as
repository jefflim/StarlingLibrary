package utils {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import starling.display.Image;
	import starling.textures.Texture;

	public class ImageUtil {
		public static const NAME:String = "ImageUtil";
		public function ImageUtil() {
		}
		
		public static function bytesToImage($rect:Rectangle, $bytes:ByteArray):Image{
			try{
				var $bmd:BitmapData = new BitmapData($rect.width, $rect.height);
				$bytes.position = 0;
				$bmd.setPixels($rect, $bytes);
				return new Image(Texture.fromBitmapData($bmd));
			}catch(e:Error){
				throw new Error(NAME + "bytesToImage Error", e.getStackTrace());
			}
		}
		
		public static function bitmapToBytes($bm:Bitmap):ByteArray{
			try{
				return $bm.bitmapData.getPixels(new Rectangle(0, 0, $bm.width, $bm.height));	
			}catch(e:Error){
				throw new Error(NAME + "Bitmap Error", e.getStackTrace());
			}
			
		}
	}
}
