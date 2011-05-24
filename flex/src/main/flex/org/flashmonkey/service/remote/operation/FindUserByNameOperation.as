package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class FindUserByNameOperation extends RemoteObjectOperation
	{
		private var _username:String;
		
		public function FindUserByNameOperation(remoteObject:RemoteObject, username:String)
		{
			super(remoteObject);
			
			_username = username;
		}
		
		public override function execute():void
		{
			var token:AsyncToken = remoteObject.findByName(_username);
			token.addResponder(new AsyncResponder(resultHandler, faultHandler));
		}
		
		protected override function resultHandler(e:ResultEvent, token:Object=null):void
		{
			dispatchComplete(e.result);
		}
	}
}