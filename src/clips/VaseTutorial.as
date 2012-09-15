package clips
{
	import away3d.containers.View3D;
	import away3d.debug.AwayStats;
	import away3d.events.AssetEvent;
	import away3d.events.LoaderEvent;
	import away3d.library.AssetLibrary;
	import away3d.loaders.Loader3D;
	import away3d.loaders.misc.AssetLoaderToken;
	import away3d.loaders.parsers.Parsers;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Vector3D;
	import flash.net.URLRequest;
	import flash.utils.describeType;
	
	
	public class VaseTutorial extends Sprite
	{
		private var _view:View3D;
		private var _stats:AwayStats;
		private var _loader:Loader3D;

	
		public function VaseTutorial()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		protected function onAdded(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			_view = new View3D();
			_view.backgroundColor = 0x446666;
			_view.antiAlias = 4;			
			addChild(_view);
			
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(MouseEvent.CLICK, onClick);
			
			
			
			Parsers.enableAllBundled();

			
			_loader = new Loader3D();
			_loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
			_loader.addEventListener(LoaderEvent.LOAD_ERROR, onLoadError);
			_loader.addEventListener( AssetEvent.ASSET_COMPLETE, onAssetComplete );
			
			//bear.awd DOES trigger RESOURCE_COMPLETE
			//vase.awd DOES NOT trigger RESOURCE_COMPLETE
			_loader.load( new URLRequest('bear.awd') );
			
			_view.scene.addChild(_loader);
			
			
			
			_stats = new AwayStats(_view); 
			addChild(_stats); 
			
		}		
		
		protected function onClick(event:MouseEvent):void
		{
			
			return;
			
			//not using
			
			var str:String = "";
			
			log( str);
			
		}
		
		
		
		protected function onResourceComplete(evt:LoaderEvent):void
		{
			
			log( "resource complete");

			removeListeners();
			
			_view.scene.addChild( _loader );
			
		}
		
		protected function onEnterFrame(evt:Event):void
		{
			_view.render();
		}
		
		
		
		
		
		
		
		
		
		
		
		protected function onAssetComplete(evt:AssetEvent):void
		{
			//log( "asset complete" );
		}
		
		private function log(str:String):void
		{
			trace(str);
			ExternalInterface.call("alert", str );
		}
		
		protected function onLoadError(evt:LoaderEvent):void
		{
			log( "can't load " + evt.url );
			removeListeners();
		}
		
		private function removeListeners():void
		{
			_loader.removeEventListener( AssetEvent.ASSET_COMPLETE, onAssetComplete );
			_loader.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
			_loader.removeEventListener(LoaderEvent.LOAD_ERROR, onLoadError);
			
		}
	}
}