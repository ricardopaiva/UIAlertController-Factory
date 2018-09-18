//
//  UIAlertController+Factory.h
//  Jogo das Palavras
//
//  Created by Ricardo Paiva on 15/10/15.
//
//

#import <Foundation/Foundation.h>

@interface UIAlertController (Factory)

/**
 *  Presents a AlertController with a title, a message and a single button.
 *
 *  @param presentingViewController ViewController where alert controller should be shown.
 *  @param title                    Alert title
 *  @param message                  Alert message
 *  @param completion               completion block
 */
+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

/**
 *  Presents a AlertController with a title, a message and a single button.
 *
 *  @param presentingViewController ViewController where alert controller should be shown.
 *  @param title                    Alert title
 *  @param message                  Alert message
 *  @param buttonTitle              Button title
 *  @param alertControllerStyle     alert controller style (UIAlertControllerStyle)
 *  @param completion               completion block
 */
+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                      preferredStyle:(UIAlertControllerStyle)alertControllerStyle
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

/**
 *  Presents a AlertController with a title, a message and a single button.
 *
 *  @param presentingViewController ViewController where alert controller should be shown.
 *  @param title                    Alert title
 *  @param message                  Alert message
 *  @param buttonTitle              Button title
 *  @param alertControllerStyle     alert controller style (UIAlertControllerStyle)
 *  @param completion               completion block
 */
+ (void)presentAlertInViewController:(nonnull UIViewController *)presentingViewController
                               title:(nonnull NSString *)title
                             message:(nullable NSString *)message
                         buttonTitle:(nonnull NSString *)buttonTitle
                      preferredStyle:(UIAlertControllerStyle)alertControllerStyle
                          completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

/**
 *  Creates a AlertController with a title and a message.
 *
 *  @param title                Alert title
 *  @param message              Alert message
 *  @param alertControllerStyle Alert controller style (UIAlertControllerStyle)
 *
 *  @return UIAlertController object
 */
+ (nullable id)alertInViewControllerWithTitle:(nonnull NSString *)title
                                      message:(nullable NSString *)message
                                        style:(UIAlertControllerStyle)alertControllerStyle;

/**
 *  Adds a new actions to the previously created alert controller
 *
 *  @param title                Action title
 *  @param alertControllerStyle Alert controller style (UIAlertControllerStyle)
 *  @param handler              Action handler block
 */
- (void)addActionWithTitle:(nonnull NSString *)title
                     style:(UIAlertActionStyle)alertControllerStyle
                   handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler;

/**
 *  Presents a previous created alert controller
 *
 *  @param alertController              Alert controller to be presented
 *  @param presentingViewController     View controller where alert controller will be displayed
 *  @param alertControllerStyle         Alert controller style (UIAlertControllerStyle)
 */
+ (void)presentAlertController:(nonnull UIAlertController *)alertController
              inViewController:(nonnull UIViewController *)presentingViewController
     withActionControllerStyle:(UIAlertControllerStyle)alertControllerStyle;

@end
