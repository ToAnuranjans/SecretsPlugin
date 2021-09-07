/********* SecretsPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface SecretsPlugin : CDVPlugin {
  // Member variables go here.
}

- (void)getSecrets:(CDVInvokedUrlCommand*)command;
@end

@implementation SecretsPlugin

- (void)getSecrets:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* key = [command.arguments objectAtIndex:0];

    originalValues = @{ 
                        @"MyBusinessUser-Fingerprint" : "TGWerfhkreRRGgkwjdejfhgjf", 
                        @"ocp-secret" : "My OCP secret"
                     };

    if (key != nil && [key length] > 0) {
        NSString value = originalValues[key];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
