//
//  C4WorkSpace.m
//  masks
//
//  Created by Travis Kirton on 12-05-09.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4WorkSpace.h"

@interface C4WorkSpace ()
-(void)delayedStart;
@end

@implementation C4WorkSpace {
    C4Movie *m;
    C4Image *i;
    C4Shape *s;
}

-(void)setup {
    s = [C4Shape shapeFromString:@"mask!" withFont:[C4Font fontWithName:@"helvetica" size:80]];
    s.origin = CGPointMake(0, 120);
    i = [C4Image imageNamed:@"gradient.png"];
    m = [C4Movie movieNamed:@"inception.mov"];
    m.layer.mask = s.layer;
    [self.canvas addMovie:m];
    [self performSelector:@selector(delayedStart) withObject:nil afterDelay:0.1];
}

-(void)delayedStart {
    s.animationDuration = 1.0f;
    s.animationOptions = AUTOREVERSE | REPEAT;
    s.origin = CGPointMake(384, s.origin.y);
//    i.animationDuration = 1.0f;
//    i.animationOptions = AUTOREVERSE | REPEAT;
//    i.origin = CGPointMake(-640, i.origin.y);
}
@end
