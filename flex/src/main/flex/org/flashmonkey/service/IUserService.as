package org.flashmonkey.service
{
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.operations.service.IOperation;

	public interface IUserService
	{
		function getAuthentication():IOperation;
		
		function register(user:IUser):IOperation;
		
		function login(user:IUser):IOperation;
		
		function logout():IOperation;
		
		function findUserByName(username:String):IOperation;
	}
}