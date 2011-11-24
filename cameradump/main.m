//
//  main.m
//  cameradump
//
//  Created by David Aurelio on 23.11.11.
//  Copyright (c) 2011 uxebu Consulting Ltd. & Co. KG. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>
#import <QTKit/QTKit.h>
#import <unistd.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        QTCaptureSession *session = [[QTCaptureSession alloc] init];
        NSArray *devices = [QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeVideo];
//        NSLog(@"%@", devices);
        
        NSError *error;
        BOOL success = NO;
        QTCaptureDevice *videoDevice = [devices objectAtIndex:0];
        success = [videoDevice open:&error];
//        NSLog(@"%@: %s\n", videoDevice, (success ? "success" : "fail"));
        
        QTCaptureDeviceInput *deviceInput = [[QTCaptureDeviceInput alloc] initWithDevice:videoDevice];
        success = [session addInput:deviceInput error:&error];
        
        QTCaptureMovieFileOutput *fileOutput = [[QTCaptureMovieFileOutput alloc] init];
        success = [session addOutput:fileOutput error:&error];
        
//        NSEnumerator *connectionEnumerator = [[fileOutput connections] objectEnumerator];
//        QTCaptureConnection *connection;
        
//        while ((connection = [connectionEnumerator nextObject])) {
//            NSString *mediaType = [connection mediaType];
//            QTCompressionOptions *compressionOptions = nil;
//            if ([mediaType isEqualToString:QTMediaTypeVideo]) {
//                compressionOptions = [QTCompressionOptions compressionOptionsWithIdentifier:@"QTCompressionOptions240SizeH264Video"];
//            } else if ([mediaType isEqualToString:QTMediaTypeSound]) {
//                compressionOptions = [QTCompressionOptions compressionOptionsWithIdentifier:@"QTCompressionOptionsHighQualityAACAudio"];
//            }
//            
//            [fileOutput setCompressionOptions:compressionOptions forConnection:connection];
//        }
        
//        
//        [fileOutput recordedDuration];
        
        [fileOutput recordToOutputFileURL:[NSURL fileURLWithPath:@"/Users/david/movie"]];
        [session startRunning];
        [[NSApplication sharedApplication] run];
        
//        NSLog(@"is session running: %i\n", [session isRunning]);
//        NSLog(@"ispaused: %i\n", [fileOutput isRecordingPaused]);

//        sleep(5);
//        
//        [session stopRunning];
//        fileOutput rec

        
        
        
        
        
        // insert code here...
//        NSLog(@"inputs: %@", devices);
        
    }
    return 0;
}
