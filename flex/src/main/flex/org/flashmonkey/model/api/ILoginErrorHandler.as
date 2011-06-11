package org.flashmonkey.model.api
{
	public interface ILoginErrorHandler
	{
		function handleError(user:IUser, error:*):void;
	}
}