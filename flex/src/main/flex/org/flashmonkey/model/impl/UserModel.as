package org.flashmonkey.model.impl
{
	import mx.collections.IList;
	
	import org.flashmonkey.model.api.IModelProperty;
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.model.api.LoginState;
	
	public class UserModel implements IUserModel
	{
		private var _status:IModelProperty;
		
		public function get status():IModelProperty
		{
			return _status || (_status = new ModelProperty(LoginState));
		}
		
		private var _user:IModelProperty;
		
		public function get user():IModelProperty
		{
			return _user || (_user = new ModelProperty(IUser));
		}
		
		private var _users:IModelProperty;
		
		public function get users():IModelProperty
		{
			return _users || (_users = new ModelProperty(IList));
		}
		
		private var _selectedUser:IModelProperty;
		
		public function get selectedUser():IModelProperty
		{
			return _selectedUser || (_selectedUser = new ModelProperty(IUser));
		}
		
		public function UserModel()
		{
		}
		
		[PostConstruct] public function init():void 
		{
			status.value = LoginState.AUTHORISING;
		}
	}
}