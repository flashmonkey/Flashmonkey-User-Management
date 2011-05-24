package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class GetAuthenticationOperation extends RemoteObjectOperation
	{
		public function GetAuthenticationOperation(remoteObject:RemoteObject)
		{
			super(remoteObject);
		}
		
		public override function execute():void
		{
			trace("executing authentication request");
			var token:AsyncToken = remoteObject.getAuthentication();
			token.addResponder(new AsyncResponder(resultHandler, faultHandler));
		}
		
		protected override function resultHandler(e:ResultEvent, token:Object = null):void
		{
			trace("authentication result: " + e.result);
			
			for (var i:String in e.result)
			{
				trace(i + " => " + e.result[i]);
			}
			
			dispatchComplete(e.result);
		}
	}
}