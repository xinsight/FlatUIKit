//
//  FUIButton.m
//  FlatUI
//
//  Created by Jack Flintermann on 5/7/13.
//  Copyright (c) 2013 Jack Flintermann. All rights reserved.
//

#import "FUIButton.h"
#import "UIImage+FlatUI.h"

@interface FUIButton()
@property(nonatomic) UIEdgeInsets defaultEdgeInsets;
@property(nonatomic) UIEdgeInsets normalEdgeInsets;
@property(nonatomic) UIEdgeInsets highlightedEdgeInsets;
@end

@implementation FUIButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultEdgeInsets = self.titleEdgeInsets;
        _buttonColor = [UIColor colorWithRed:0.2f green:0.2f blue:0.9f alpha:1.0f];
        _buttonHighlightColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:1.0f];
    }
    return self;
}

- (void) setHighlighted:(BOOL)highlighted {
    self.titleEdgeInsets = highlighted ? self.highlightedEdgeInsets : self.normalEdgeInsets;
    [super setHighlighted:highlighted];
}

- (void) setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self configureFlatButton];
}

- (void) setButtonColor:(UIColor *)buttonColor {
    _buttonColor = buttonColor;
    [self configureFlatButton];
}

- (void) setButtonHighlightColor:(UIColor *)buttonColor {
    _buttonHighlightColor = buttonColor;
    [self configureFlatButton];
}

- (void) setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    [self configureFlatButton];
}

- (void) setShadowHeight:(CGFloat)shadowHeight {
    _shadowHeight = shadowHeight;
    UIEdgeInsets insets = self.defaultEdgeInsets;
    self.highlightedEdgeInsets = insets;
    insets.top -= shadowHeight;
    self.normalEdgeInsets = insets;
    self.titleEdgeInsets = insets;
    [self configureFlatButton];
}

- (void) configureFlatButton {
    UIImage *normalBackgroundImage = [UIImage buttonImageWithColor:self.buttonColor
                                                      cornerRadius:self.cornerRadius
                                                       shadowColor:self.shadowColor
                                                      shadowInsets:UIEdgeInsetsMake(0, 0, self.shadowHeight, 0)];
    UIImage *highlightedBackgroundImage = [UIImage buttonImageWithColor:self.buttonHighlightColor
                                                           cornerRadius:self.cornerRadius
                                                            shadowColor:[UIColor clearColor]
                                                           shadowInsets:UIEdgeInsetsMake(self.shadowHeight, 0, 0, 0)];
    
    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
}

@end
