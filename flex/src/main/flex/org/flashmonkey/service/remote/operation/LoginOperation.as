package org.flashmonkey.service.remote.operation
{
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.impl.User;
	
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class LoginOperation extends RemoteObjectOperation
	{
		private var _username:String;
		
		private var _password:String;
		
		public function LoginOperation(remoteObject:RemoteObject, username:String, password:String)
		{
			super(remoteObject);
			
			_username = username;
			_password = password;
		}
		
		public override function execute():void
		{
			trace("remoteObject.channelSet " + remoteObject.channelSet);
			var token:AsyncToken = remoteObject.channelSet.login(_username, _password);
			token.addResponder(new AsyncResponder(resultHandler, faultHandler));
		}
		
		protected override function resultHandler(e:ResultEvent, token:Object = null):void
		{
			var user:IUser = User.from(e.result);
			
			if (user)
			{
				dispatchComplete(user);
			}
			else
			{
				var fault:Fault = new Fault("", "No object returned from server");
				var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT, false, true, fault);
				dispatchComplete(faultEvent);
			}
		}
	}
}