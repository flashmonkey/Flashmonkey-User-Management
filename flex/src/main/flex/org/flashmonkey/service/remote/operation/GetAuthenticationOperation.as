package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.service.operation.RemoteObjectOperation;
	
	public class GetAuthenticationOperation extends RemoteObjectOperation
	{
		protected override function get token():AsyncToken
		{
			return remoteObject.getAuthentication();
		}
		
		public function GetAuthenticationOperation(remoteObject:RemoteObject)
		{
			super(remoteObject);
		}
	}
}