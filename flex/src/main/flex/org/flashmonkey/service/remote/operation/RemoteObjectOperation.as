package org.flashmonkey.service.remote.operation
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.operations.service.AbstractOperation;
	
	public class RemoteObjectOperation extends AbstractOperation
	{
		private var _remoteObject:RemoteObject;
		
		protected function get remoteObject():RemoteObject
		{
			return _remoteObject;
		}
		
		public function RemoteObjectOperation(remoteObject:RemoteObject)
		{
			super();
			
			_remoteObject = remoteObject;
		}
		
		public override function execute():void
		{
			addListeners();
		}
		
		protected function addListeners():void 
		{
			_remoteObject.addEventListener(FaultEvent.FAULT, faultHandler);
		}
		
		protected function removeListeners():void
		{
			_remoteObject.removeEventListener(FaultEvent.FAULT, faultHandler);
		}
		
		protected function faultHandler(e:FaultEvent, token:Object = null):void 
		{
			removeListeners();
			
			dispatchError(e.fault);
		}
		
		protected function resultHandler(e:ResultEvent, token:Object = null):void
		{
			removeListeners();
			
			dispatchComplete(e.result);
		}
	}
}