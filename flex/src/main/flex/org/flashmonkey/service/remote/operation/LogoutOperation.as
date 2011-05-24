package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class LogoutOperation extends RemoteObjectOperation
	{
		public function LogoutOperation(remoteObject:RemoteObject)
		{
			super(remoteObject);
		}
		
		public override function execute():void
		{
			var token:AsyncToken = remoteObject.channelSet.logout();
			token.addResponder(new AsyncResponder(resultHandler, faultHandler));
		}
		
		protected override function resultHandler(e:ResultEvent, token:Object=null):void
		{
			trace("logout complete: " + e.result);
			
			dispatchComplete();
		}
	}
}