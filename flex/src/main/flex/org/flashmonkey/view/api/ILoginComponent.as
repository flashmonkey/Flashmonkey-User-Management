package org.flashmonkey.view.api
{
	import org.osflash.signals.Signal;

	public interface ILoginComponent
	{
		function get login():Signal;
		
		function get register():Signal;
	}
}