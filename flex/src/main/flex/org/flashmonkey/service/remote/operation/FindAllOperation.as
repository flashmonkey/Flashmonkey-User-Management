package org.flashmonkey.service.remote.operation
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.service.operation.RemoteObjectOperation;
	
	public class FindAllOperation extends RemoteObjectOperation
	{
		protected override function get token():AsyncToken
		{
			return remoteObject.findAll();
		}
		
		public function FindAllOperation(remoteObject:RemoteObject)
		{
			super(remoteObject);
		}
	}
}