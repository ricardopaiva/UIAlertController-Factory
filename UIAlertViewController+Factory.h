//
//  UIAlertViewController+Factory.h
//  Jogo das Palavras
//
//  Created by Ricardo Paiva on 15/10/15.
//
//

#import <Foundation/Foundation.h>

@interface UIAlertController (Factory)

+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                         buttonTitle:(nonnull NSString *)buttonTitle
                      preferredStyle:(UIAlertControllerStyle)alertControllerStyle
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

+ (nullable id)alertInViewControllerWithTitle:(nonnull NSString *)title
                         withMessage:(nullable NSString *)message
            withStyle:(UIAlertControllerStyle)alertControllerStyle;

- (void)addActionWithTitle:(nonnull NSString *)title
                 withStyle:(UIAlertActionStyle)alertControllerStyle
               withHandler:(void (^ __nullable)(UIAlertAction *action))handler;

@end
