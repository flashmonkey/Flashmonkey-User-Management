package org.flashmonkey.service.remote.operation
{
	import org.flashmonkey.model.api.IUser;
	
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class RegisterOperation extends RemoteObjectOperation
	{
		private var _user:IUser;
		
		public function RegisterOperation(remoteObject:RemoteObject, user:IUser)
		{
			super(remoteObject);
			
			_user = user;
		}
		
		public override function execute():void
		{
			var token:AsyncToken = remoteObject.register(_user);
			token.addResponder(new AsyncResponder(resultHandler, faultHandler));
		}
		
		protected override function resultHandler(e:ResultEvent, token:Object = null):void
		{
			trace("Registration result: " + e.result);
		}
	}
}