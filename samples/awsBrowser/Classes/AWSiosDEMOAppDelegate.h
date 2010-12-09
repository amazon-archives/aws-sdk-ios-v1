
#import <UIKit/UIKit.h>

@class AWSiosDEMOViewController;

@interface AWSiosDEMOAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AWSiosDEMOViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AWSiosDEMOViewController *viewController;

@end

