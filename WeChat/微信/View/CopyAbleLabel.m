//
//  CopyAbleLabel.m
//  WeChat
//
//  Created by 张帅 on 2017/10/24.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "CopyAbleLabel.h"
@interface CopyAbleLabel()

@property (nonatomic, strong) UIColor *originalColor;

@end
@implementation CopyAbleLabel

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToCopy:)];
    [self addGestureRecognizer:longPress];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    if (self.originalColor == nil)
    {
        self.originalColor = backgroundColor;
    }
}

- (void)longPressToCopy:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        [sender.view becomeFirstResponder];
        self.backgroundColor = [UIColor lightGrayColor];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:sender.view.frame inView:self.superview];
        [menuController setMenuVisible:YES animated:YES];
        [[NSNotificationCenter defaultCenter] addObserver:sender selector:@selector(pasteboardHideNotice:) name:UIMenuControllerWillHideMenuNotification object:nil];
    }
    else if (sender.state == UIGestureRecognizerStateCancelled)
    {
        
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
        
    }
    else if (sender.state == UIGestureRecognizerStateEnded)
    {
        
    }
}

- (void)pasteboardHideNotice:(NSNotification *)obj
{
    self.backgroundColor = self.originalColor;
    if (self)
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
    }
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    NSArray *methodNameArr = @[@"copy:"];
    if ([methodNameArr containsObject:NSStringFromSelector(action)])
    {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)copy:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (self.tag == 1000)
    {
        if ([self.text containsString:@":"])
        {
            NSRange mRange = [self.text rangeOfString:@":"];
            pasteboard.string = [self.text substringFromIndex:mRange.location + 1];
            pasteboard.string = self.text;
        }
        else
        {
            pasteboard.string = self.text;
        }
    }
    else
    {
        pasteboard.string = self.text;
    }
}
@end

