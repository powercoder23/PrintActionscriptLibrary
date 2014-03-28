package com.cybage.uig.nativeExtensions
{
	import flash.utils.ByteArray;
	import flash.external.ExtensionContext;

	public class NativePrinter
	{
		
		private static var extContext:ExtensionContext = null;
		
		public function NativePrinter()
		{
			if (!extContext)
			{
				initExtension();
			}
		}
		
		//Initialize the extension by calling our "initNativeCode" ANE function
		private static function initExtension():void
		{
			trace ("Printer Constructor: Create an extension context");
			
			extContext = ExtensionContext.createExtensionContext("com.cybage.NativePrinter", null);
			
			extContext.call("initNativeCode");
		}
		
		public function sendPrint(byteArray:ByteArray):void
		{
			extContext.call("sendPrint", byteArray);
		}
	}
}