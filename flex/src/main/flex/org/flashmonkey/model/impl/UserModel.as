package org.flashmonkey.model.impl
{
	import org.flashmonkey.model.api.IModelProperty;
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.IUserModel;
	
	public class UserModel implements IUserModel
	{
		private var _user:IModelProperty;
		
		public function get user():IModelProperty
		{
			return _user || (_user = new ModelProperty(IUser));
		}
		
		public function UserModel()
		{
		}
	}
}