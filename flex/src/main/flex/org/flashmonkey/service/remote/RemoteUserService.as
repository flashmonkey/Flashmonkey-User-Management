package org.flashmonkey.service.remote
{
	import mx.rpc.remoting.RemoteObject;
	
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.flashmonkey.service.remote.operation.FindUserByNameOperation;
	import org.flashmonkey.service.remote.operation.GetAuthenticationOperation;
	import org.flashmonkey.service.remote.operation.LoginOperation;
	import org.flashmonkey.service.remote.operation.LogoutOperation;
	import org.flashmonkey.service.remote.operation.RegisterOperation;
	
	public class RemoteUserService implements IUserService
	{
		private var _securityHelper:RemoteObject = new SecurityHelper();
		
		private var _userService:RemoteObject = new UserService();
		
		public function RemoteUserService()
		{
		}
		
		public function getAuthentication():IOperation
		{
			return new GetAuthenticationOperation(_securityHelper);
		}
		
		public function register(user:IUser):IOperation
		{
			return new RegisterOperation(_userService, user);
		}
		
		public function login(user:IUser):IOperation
		{
			return new LoginOperation(_securityHelper, user.username, user.password);
		}
		
		public function logout():IOperation
		{
			return new LogoutOperation(_securityHelper);
		}
		
		public function findUserByName(username:String):IOperation
		{
			return new FindUserByNameOperation(_userService, username);
		}
	}
}

import mx.messaging.config.ServerConfig;
import mx.rpc.remoting.RemoteObject;

internal class SecurityHelper extends RemoteObject
{
	public function SecurityHelper() 
	{
		destination = "securityHelper";
		channelSet = ServerConfig.getChannelSet("securityHelper");
	}
}

internal class UserService extends RemoteObject
{
	public function UserService()
	{
		destination = "userService";
		channelSet = ServerConfig.getChannelSet("userService");
	}
}