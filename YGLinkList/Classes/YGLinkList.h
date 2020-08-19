//
//  LinkList.h
//  suanfa
//
//  Created by wyg on 2020/8/10.
//  Copyright © 2020 wyg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGLinkList : NSObject

-(void)clean;
-(BOOL)isEmpty;
-(int)getLenth;
-(id)getDataWithIndex:(int)index;
-(void)insertData:(id)data;
-(void)insertData:(id)data atIndex:(int)index;
-(BOOL)insertData:(id)data circleIndex:(int)index;
-(id)removeNodeWithIndex:(int)index;
-(int)firstIndexWithData:(id)data;
-(void)reverse;
-(BOOL)isCircle;
-(id)getCircleBeginData;

@end

@interface Node : NSObject
@property(nonatomic,strong)id data;
@property(nonatomic,strong)Node * _Nullable next;
-(instancetype)initWithData:(id _Nullable)data next:(Node* _Nullable)next;
 @end

NS_ASSUME_NONNULL_END
