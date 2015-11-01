//
//  UIAlertViewController+Factory.m
//  Jogo das Palavras
//
//  Created by Ricardo Paiva on 15/10/15.
//
//

#import "UIAlertViewController+Factory.h"

@implementation UIAlertController (Factory)

+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                         buttonTitle:(nonnull NSString *)buttonTitle
                      preferredStyle:(UIAlertControllerStyle)alertControllerStyle
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0)
{
    
    //    if ([UIAlertController class]) {  // iOS 8 or above
    
    UIAlertController* alert =
    [UIAlertController
     alertControllerWithTitle:title
     message:message
     preferredStyle:alertControllerStyle];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    if (alertControllerStyle == UIAlertControllerStyleActionSheet) {
        UIPopoverPresentationController *popover = alert.popoverPresentationController;
        if (popover)
        {
            popover.sourceView = presentingViewController.view;
            popover.sourceRect = [(UIView *)presentingViewController.view bounds];
            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
    }
    
    [presentingViewController presentViewController:alert animated:YES completion:completion];
    //    } else {
    //        //iOS 7 or below
    //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
    //                                                            message:message
    //                                                           delegate:self
    //                                                  cancelButtonTitle:buttonTitle
    //                                                  otherButtonTitles:nil];
    //        [alertView show];
    //    }
}

+ (nullable id)alertInViewControllerWithTitle:(NSString *)title
                                  withMessage:(NSString *)message
                                    withStyle:(UIAlertControllerStyle)alertControllerStyle
{
    
    //    if ([UIAlertController class]) {  // iOS 8 or above
    
    UIAlertController* alert =
    [UIAlertController
     alertControllerWithTitle:title
     message:message
     preferredStyle:alertControllerStyle];
    
    return alert;
    //    } else {
    //        //iOS 7 or below
    //        NSAssert(NO, @"Not prepared for iOS 7 or below");
    //        return nil;
    //
    //        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
    //        //                                                            message:message
    //        //                                                           delegate:self
    //        //                                                  cancelButtonTitle:buttonTitle
    //        //                                                  otherButtonTitles:nil];
    //        //        return alertView;
    //    }
}

- (void)addActionWithTitle:(NSString *)title
                 withStyle:(UIAlertActionStyle)alertControllerStyle
               withHandler:(void (^ __nullable)(UIAlertAction *action))handler
{
    //    if ([UIAlertController class]) {  // iOS 8 or above
    
    UIAlertAction* newAction = [UIAlertAction actionWithTitle:title
                                                        style:alertControllerStyle
                                                      handler:handler];
    [self addAction:newAction];
    //    } else {
    //        //iOS 7 or below
    //        NSAssert(NO, @"Not prepared for iOS 7 or below");
    //
    //        //        //iOS 7 or below
    //        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
    //        //                                                            message:message
    //        //                                                           delegate:self
    //        //                                                  cancelButtonTitle:buttonTitle
    //        //                                                  otherButtonTitles:nil];
    //        //        return alertView;
    //    }
}

#pragma mark - Private methods

+ (void)presentAlertController:(nonnull UIAlertController *)alertController inViewController:(nonnull UIViewController *)presentingViewController withActionControllerStyle:(UIAlertControllerStyle)alertControllerStyle
{
    if (alertControllerStyle == UIAlertControllerStyleActionSheet) {
        UIPopoverPresentationController *popover = alertController.popoverPresentationController;
        if (popover)
        {
            popover.sourceView = presentingViewController.view;
            popover.sourceRect = [(UIView *)presentingViewController.view bounds];
            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
    }
    
    [presentingViewController presentViewController:alertController animated:YES completion:nil];
}

@end
