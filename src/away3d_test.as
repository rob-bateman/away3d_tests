package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import clips.VaseTutorial;
	
	[SWF(width="960", height="540")]
	
	public class away3d_test extends Sprite
	{
		public function away3d_test()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			var tut = new VaseTutorial();
			addChild (tut);
			
		}
	}
}