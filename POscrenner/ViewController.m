//
//  ViewController.m
//  POscrenner
//
//  Created by Jarred Alldredge on 1/12/15.
//  Copyright (c) 2015 Vision Research. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
#import <ImageIO/CGImageSource.h>
#import <ImageIO/CGImageProperties.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) loadImage {
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    NSURL *myURL = [NSURL fileURLWithPath:@"/Users/jarredalldredge/Documents/iOS Developments/POscrenner/POscrenner/ExampleExif.jpg"];
    CGImageSourceRef mySourceRef = CGImageSourceCreateWithURL((CFURLRef)myURL, NULL);
    NSDictionary *myMetadata = (NSDictionary *) CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(mySourceRef,0,NULL));
    NSDictionary *exifDic = [myMetadata objectForKey:(NSString *)kCGImagePropertyExifDictionary];
    NSDictionary *tiffDic = [myMetadata objectForKey:(NSString *)kCGImagePropertyTIFFDictionary];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
