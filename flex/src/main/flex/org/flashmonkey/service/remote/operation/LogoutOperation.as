package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.service.operation.RemoteObjectOperation;
	
	public class LogoutOperation extends RemoteObjectOperation
	{
		protected override function get token():AsyncToken
		{
			return remoteObject.channelSet.logout();
		}
		
		public function LogoutOperation(remoteObject:RemoteObject)
		{
			super(remoteObject);
		}
	}
}