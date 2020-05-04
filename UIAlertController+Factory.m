//
//  UIAlertController+Factory.m
//  Jogo das Palavras
//
//  Created by Ricardo Paiva on 15/10/15.
//
//

#import "UIAlertController+Factory.h"

@implementation UIAlertController (Factory)

+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0)
{
    [UIAlertController
     presentAlertInViewController:presentingViewController
     title:NSLocalizedString(@"GAME_TITLE", nil)
     message:message
     buttonTitle:@"OK"
     preferredStyle:UIAlertControllerStyleAlert
     completion:completion];
}

+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                      preferredStyle:(UIAlertControllerStyle)alertControllerStyle
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0)
{
    [UIAlertController
     presentAlertInViewController:presentingViewController
     title:NSLocalizedString(@"GAME_TITLE", nil)
     message:message
     buttonTitle:@"OK"
     preferredStyle:alertControllerStyle
     completion:completion];
}

+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                         buttonTitle:(nonnull NSString *)buttonTitle
                      preferredStyle:(UIAlertControllerStyle)alertControllerStyle
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0)
{
    UIAlertController* alert =
    [UIAlertController
     alertControllerWithTitle:title
     message:message
     preferredStyle:alertControllerStyle];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];

    [UIAlertController presentAlertController:alert
                             inViewController:presentingViewController
                    withActionControllerStyle:alertControllerStyle];

//    if (alertControllerStyle == UIAlertControllerStyleActionSheet) {
//        UIPopoverPresentationController *popover = alert.popoverPresentationController;
//        if (popover) {
//            popover.sourceView = presentingViewController.view;
//            popover.sourceRect = [(UIView *)presentingViewController.view bounds];
//            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
//        }
//    }
//
//    [presentingViewController presentViewController:alert animated:YES completion:completion];
}

+ (nullable id)alertInViewControllerWithTitle:(NSString *)title
                                      message:(NSString *)message
                                        style:(UIAlertControllerStyle)alertControllerStyle
{
    UIAlertController* alert =
    [UIAlertController
     alertControllerWithTitle:title
     message:message
     preferredStyle:alertControllerStyle];

    return alert;
}

- (void)addActionWithTitle:(NSString *)title
                     style:(UIAlertActionStyle)alertControllerStyle
                   handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler
{
    UIAlertAction* newAction = [UIAlertAction actionWithTitle:title
                                                        style:alertControllerStyle
                                                      handler:handler];
    [self addAction:newAction];
}

#pragma mark - Private methods

+ (void)presentAlertController:(nonnull UIAlertController *)alertController
              inViewController:(nonnull UIViewController *)presentingViewController
     withActionControllerStyle:(UIAlertControllerStyle)alertControllerStyle
{
    if (alertControllerStyle == UIAlertControllerStyleActionSheet) {
        UIPopoverPresentationController *popover = alertController.popoverPresentationController;
        if (popover) {
            popover.sourceView = presentingViewController.view;
            popover.sourceRect = [(UIView *)presentingViewController.view bounds];
            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
    }

    [presentingViewController presentViewController:alertController animated:YES completion:nil];
}

@end
