package org.flashmonkey.model.api
{
	public interface IUserModel
	{
		function get status():IModelProperty;
		
		function get user():IModelProperty;
		
		function get users():IModelProperty;
		
		function get selectedUser():IModelProperty;
	}
}