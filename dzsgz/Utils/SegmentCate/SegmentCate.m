//
//  SegmentCate.m
//  ProjectTemplate
//
//  Created by 雨停 on 2017/12/4.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "SegmentCate.h"
static CGFloat const kUnderlineDuration = 0.3f;
static NSInteger const kButtonTag = 100000;
@interface SegmentCate()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, assign, readwrite) NSInteger selectedIndex;
@property (nonatomic, copy) SegmentedControlBlock selectedBlock;
@end
@implementation SegmentCate

- (instancetype)init{
    if(self = [super init]){
    [self buildingDefaultParams:@[]];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self =[super initWithFrame:frame]){
       [self buildingDefaultParams:@[]];
    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSString *> *)titleArray{
    if(self = [super initWithFrame:frame]){
        [self buildingDefaultParams:titleArray];
    }
    return self;
}
// set default value
- (void)buildingDefaultParams:(NSArray *)titleArray {
    self.titleArray = titleArray;
    self.segmentedControlLineStyle = SegmentedControlLineStyleUnder;
    self.segmentedControlTitleSpacingStyle = SegmentedControlTitleSpaceStyleAutoFit;
    self.segmentedControlBorederStyle  =SegmentedControlButtonBorderHidden;
    self.lineWidthEqualToTextWidth = YES;
    self.textColor = [UIColor darkTextColor];
    self.selectedTextColor = [UIColor purpleColor];
    self.font = [UIFont systemFontOfSize:16];
    self.selectedFont = [UIFont systemFontOfSize:20];
    self.lineColor = [UIColor purpleColor];
    self.lineHeight = 4.f;
 
    self.titleWidth = 80.f;
    self.titleSpacing = 40.f;
    self.defaultSelectedIndex = 0;
    self.selectedIndex = self.defaultSelectedIndex;
    self.showSplitLine = NO;
    self.splitLineSize = CGSizeMake(0, 0);
    self.splitLineColor = [UIColor grayColor];
}

- (void)buildingUI {
    if (!self.titleArray.count) {
        return;
    }
    
    // add to self
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.lineView];
    
    __block UIView *lastView;
    __weak typeof(self) weakSelf = self;
    
    [self.titleArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // subviews
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:obj forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        switch (weakSelf.segmentedControlBorederStyle) {
            case SegmentedControlButtonBorderShow:
                button.layer.borderColor = [UIColor orangeColor].CGColor;
                button.layer.cornerRadius  =4 ;
                button.layer.borderWidth   = 1;
                break;
            case SegmentedControlButtonBorderHidden:
                
                break;
            
        }
        
        [button setTitleColor:(idx == weakSelf.defaultSelectedIndex ? weakSelf.selectedTextColor : weakSelf.textColor) forState:UIControlStateNormal];
        button.titleLabel.font = (idx == weakSelf.defaultSelectedIndex ? weakSelf.selectedFont : weakSelf.font);
        button.tag = kButtonTag + idx;
        [button addTarget:self action:@selector(handleButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [weakSelf.scrollView addSubview:button];
        
        
        
        // title spacing style
        switch (weakSelf.segmentedControlTitleSpacingStyle) {
                // 文字间距固定, 宽度自适应, 需要设置间距 titleSpacing
            case SegmentedControlTitleSpaceStyleAutoFit: {
                
                break;
            }
            case SegmentedControlTitleSpaceStyleFixed: {
                
                break;
            }
        }
        
       
        
        // building split line
        if (weakSelf.showSplitLine) {
            if (idx == 0) { } else {
                UIView *splitLine = [[UIView alloc] init];
                
                [weakSelf.scrollView addSubview:splitLine];
            }
        }
        
        lastView = button;
    }];
    
    // set contentSize
    
    
    // set underline height
    
    
    // line style
    switch (self.segmentedControlLineStyle) {
        case SegmentedControlLineStyleUnder: {
            
            break;
        }
        case SegmentedControlLineStyleTop: {
            
            break;
        }
        case SegmentedControlLineStyleHidden: {
            [self.lineView removeFromSuperview];
            break;
        }
    }
    
    // set underline frame
    if (self.lineView.superview) {
        // set underline width
        
        // set underline centerX
        UIButton *selectedButton = [self.scrollView viewWithTag:kButtonTag + self.defaultSelectedIndex];
        
    }
}

- (void)handleButtonClickAction:(UIButton *)sender {
    [self segmentedControlSetSelectedIndex:sender.tag - kButtonTag];
    
    // selected callback
    if (self.selectedBlock) {
        self.selectedBlock(self, self.selectedIndex);
    }
}

- (CGFloat)getUnderlineWidth {
    if (self.lineWidthEqualToTextWidth) {
        NSString *selectedTitle = self.titleArray[self.selectedIndex];
        // 获取字体高度
        CGFloat fontSize = self.selectedFont.ascender - self.selectedFont.descender;
        return [NSString getTextWidth:fontSize text:selectedTitle font:self.selectedFont];
    }
    return self.lineWidth;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
   
    [self buildingUI];
}

- (void)segmentedControlSelectedWithBlock:(SegmentedControlBlock)block {
    self.selectedBlock = block;
}

- (void)segmentedControlSetSelectedIndex:(NSInteger)selectedIndex {
    // prevent array bounds
    if (selectedIndex > self.titleArray.count - 1) {
        selectedIndex = self.titleArray.count - 1;
    }
    if (selectedIndex < 0) {
        selectedIndex = 0;
    }
    
    // reset selectedIndex
    self.selectedIndex = selectedIndex;
    
    // get selected button
    UIButton *selectedButton = [self.scrollView viewWithTag:kButtonTag + selectedIndex];
    
    // underline reset frame animation
    if (self.segmentedControlLineStyle != SegmentedControlLineStyleHidden) {
        [UIView animateWithDuration:kUnderlineDuration animations:^{
            
        }];
    }
    
    // reset title color
    for (UIView *subview in self.scrollView.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)subview;
            [button setTitleColor:(button == selectedButton ? self.selectedTextColor : self.textColor) forState:UIControlStateNormal];
            button.titleLabel.font = (button == selectedButton ? self.selectedFont : self.font);
        }
    }
    
    // reset scrollView contentOffset.x
   
    CGRect rectToScrollTo = selectedButton.frame;
    
    [self.scrollView scrollRectToVisible:rectToScrollTo animated:YES];
}

- (void)segmentedControlSetSelectedIndexWithSelectedBlock:(NSInteger)selectedIndex {
    [self segmentedControlSetSelectedIndex:selectedIndex];
    
    // selected callback
    if (self.selectedBlock) {
        self.selectedBlock(self, self.selectedIndex);
    }
}

#pragma mark -
#pragma mark - getter methods
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.directionalLockEnabled = YES;
        _scrollView.bounces = NO;
        
    }
    return _scrollView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = self.lineColor;
    }
    return _lineView;
}

#pragma mark -
#pragma mark - deinit
- (void)dealloc {
    _selectedBlock = nil;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

@implementation NSString (LLAdd)

+ (float)getTextWidth:(float)textHeight text:(NSString *)text font:(UIFont *)font {
    if (!text.length) {
        return 0;
    }
    float origin = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, textHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil].size.width;
    return ceilf(origin);
}

@end