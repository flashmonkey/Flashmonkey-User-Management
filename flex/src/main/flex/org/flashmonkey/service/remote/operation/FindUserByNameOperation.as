package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.service.operation.RemoteObjectOperation;
	
	public class FindUserByNameOperation extends RemoteObjectOperation
	{
		private var _username:String;
		
		protected override function get token():AsyncToken
		{
			return remoteObject.findByName(_username);
		}
		
		public function FindUserByNameOperation(remoteObject:RemoteObject, username:String)
		{
			super(remoteObject);
			
			_username = username;
		}
	}
}