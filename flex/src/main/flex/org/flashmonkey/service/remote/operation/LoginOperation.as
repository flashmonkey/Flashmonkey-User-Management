package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.impl.User;
	import org.flashmonkey.service.operation.RemoteObjectOperation;
	
	public class LoginOperation extends RemoteObjectOperation
	{
		private var _username:String;
		
		private var _password:String;
		
		protected override function get token():AsyncToken
		{
			return remoteObject.channelSet.login(_username, _password);
		}
		
		public function LoginOperation(remoteObject:RemoteObject, username:String, password:String)
		{
			super(remoteObject);
			
			_username = username;
			_password = password;
		}
	}
}