//
//  LinkList.m
//  suanfa
//
//  Created by wyg on 2020/8/10.
//  Copyright © 2020 wyg. All rights reserved.
//

#import "YGLinkList.h"
@class Node;
@interface YGLinkList ()
@property(nonatomic,assign)int lenth;
@property(nonatomic,strong)Node * _Nullable header;


@end

@implementation YGLinkList

- (instancetype)init
{
    if (self = [super init])
    {
        self.header = [[Node alloc] initWithData:nil next:nil];
        self.lenth = 0;
    }
    
    return self;
}

-(void)clean
{
    if ([self isCircle])
    {
        //如果有环 要把环切断才能释放
        Node *n = self.header;
        for (int i = 0; i<_lenth; i++)
        {
            n = n.next;
        }
        
        n.next = nil;
    }
    self.header.next = nil;
    self.lenth = 0;
}
-(int)getLenth
{
    return _lenth;
}

-(BOOL)isEmpty
{
    return _lenth==0;
}

-(id)getDataWithIndex:(int)index
{
    Node *n = self.header.next;
    
    for (int i=0; i<index; i++)
    {
        n = n.next;
    }
    
    return n.data;
}

-(void)insertData:(id)data
{
    Node *n = self.header;
    
    while (n.next!=nil)
    {
        n = n.next;
    }
    
    Node *newNode = [[Node alloc] initWithData:data next:nil];
    n.next = newNode;
    _lenth++;
}

-(void)insertData:(id)data atIndex:(int)index
{
    Node *n = self.header;
    
    for (int i=0; i<index; i++)
    {
        n = n.next;
    }
    
    Node *next = n.next;
    
    Node *newNode = [[Node alloc] initWithData:data next:next];
    
    n.next = newNode;
    
    _lenth++;
}

-(BOOL)insertData:(id)data circleIndex:(int)index
{
    if ([self isCircle])
    {
        return NO;
        
    }else
    {
        Node *n = self.header;
        
        while (n.next!=nil)
        {
            n = n.next;
        }
        
        
        Node *current = self.header.next;
        for (int i=0; i<index; i++)
       {
           current = current.next;
       }
           
           
        Node *newNode = [[Node alloc] initWithData:data next:current];
        
        n.next = newNode;
        _lenth++;
        
        return YES;
    }
}

-(id)removeNodeWithIndex:(int)index
{
    Node *n = self.header;
      
    for (int i = 0; i<index; i++)
    {
        n = n.next;
    }
    
    Node *waitToRemove = n.next;
    
    Node *next = waitToRemove.next;
    
    n.next = next;

    _lenth--;
    
    return waitToRemove.data;
}

-(int)firstIndexWithData:(id)data
{
    Node *n = self.header;
    for (int i = 0; n.next!=nil; i++)
    {
        n = n.next;
        if ([n.data isEqual:data])
        {
            return i;
        }
    }
    
    return -1;
}

-(void)reverse
{
    if ([self isEmpty])
    {
        return;
    }
    
    [self reverse:self.header.next];
}

-(Node*)reverse:(Node*)current
{
    if (current.next==nil)
    {
        self.header.next = current;
        return current;
    }
    
    Node *next = [self reverse:current.next];
    
    next.next = current;
    current.next = nil;
    
    return current;
}

-(BOOL)isCircle
{
    Node *slow = self.header;
    Node *fast = self.header;
    
    while (fast!=nil && fast.next!=nil)
    {
        slow = slow.next;
        fast = fast.next.next;
        
        if ([fast isEqual:slow])
        {
            return YES;
        }
    }
    
    return NO;
}

-(id)getCircleBeginData
{
    
    Node *slow = self.header;
    Node *fast = self.header;
    Node *meet = nil;
       
   while (slow!=nil && slow.next!=nil)
   {
       slow = slow.next;
       fast = fast.next.next;
       
       
       //先找到快慢指针相遇位置
       if ([fast isEqual:slow])
       {
           meet = slow;
           
           //重新赋值slow指针为头节点
           slow = self.header;
           fast = nil;
           continue;
       }
       
       
       //有环链表有个特性，从head到环入口的距离和快慢指针相遇位置到环入口的距离是一样的
       if (meet!=nil)
       {
           meet = meet.next;
           
           if ([meet isEqual:slow])
           {
               return meet.data;
           }
       }
    }
    
    return nil;
}

@end


@implementation Node

-(void)dealloc
{
//    NSLog(@"Node---dealloc");
}
- (instancetype)initWithData:(id)data next:(Node *)next
{
    if (self = [super init])
    {
        self.data = data;
        self.next = next;
    }
    
    return self;
}



@end
