package org.flashmonkey.controller.signal
{
	import org.flashmonkey.model.api.IUser;
	
	import org.osflash.signals.Signal;
	
	public class Login extends Signal
	{
		public function Login()
		{
			super(IUser);
		}
	}
}