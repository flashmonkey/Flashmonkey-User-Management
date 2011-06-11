package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.service.operation.RemoteObjectOperation;
	
	public class RegisterOperation extends RemoteObjectOperation
	{
		private var _user:IUser;
		
		protected override function get token():AsyncToken
		{
			return remoteObject.register(_user);
		}
		
		public function RegisterOperation(remoteObject:RemoteObject, user:IUser)
		{
			super(remoteObject);
			
			_user = user;
		}
	}
}