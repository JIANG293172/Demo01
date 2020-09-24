//
//  JTMultithreading.m
//  Demo01
//
//  Created by TaoJiang on 2020/9/24.
//  Copyright © 2020 TaoJiang. All rights reserved.
//

#import "JTMultithreading.h"

@implementation JTMultithreading

-(instancetype)init {
    if ([super init]) {
        
    }
    return self;
}

- (void)multithreading {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("test1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    
    for (int i = 0; i < 10; i++) {
        dispatch_group_async(group, concurrentQueue, ^{
            for (int j = 0; j < 10; j ++) {
                sleep(1);
                NSLog(@"i=%d  j=%d", i, j);
            }
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"finish");
    });
}

- (void)multithreading2 {
    dispatch_queue_t concruurentQueue = dispatch_queue_create("test2", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"aaa 1");
    dispatch_sync(concruurentQueue, ^{
        NSLog(@"bbb 1");
    });
    
    NSLog(@"aaa 2");
    dispatch_barrier_sync(concruurentQueue, ^{
        NSLog(@"bbb 2");
    });
    NSLog(@"aaa 3");
    
    dispatch_sync(concruurentQueue, ^{
        NSLog(@"bbb 3");
    });
}

- (void)multithreading3 {
    dispatch_queue_t concruurentQueue = dispatch_queue_create("test2", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"aaa 1");
    dispatch_sync(concruurentQueue, ^{
        NSLog(@"bbb 1");
    });
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(concruurentQueue, ^{
            NSLog(@"bbb %d", i);
//            NSLog(@"===");
        });
    }
    
    dispatch_barrier_async(concruurentQueue, ^{
        NSLog(@"bbb 2");
    });
    
    dispatch_async(concruurentQueue, ^{
        NSLog(@"bbb 3");
    });
}

- (void)multithreading4 {
    dispatch_semaphore_t seam = dispatch_semaphore_create(0);
    NSLog(@"1");
    dispatch_async(dispatch_queue_create("aa", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"2");
        sleep(5);
        NSLog(@"3");
        dispatch_semaphore_signal(seam);
    });
    
    dispatch_async(dispatch_queue_create("aa", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"6");
        sleep(10);
        NSLog(@"7");
        dispatch_semaphore_signal(seam);
    });
    
    NSLog(@"4");
    dispatch_semaphore_wait(seam, DISPATCH_TIME_FOREVER);
    NSLog(@"5");
    
    dispatch_semaphore_wait(seam, DISPATCH_TIME_FOREVER);
    NSLog(@"8");
}

//设置先后顺序
- (void)multithreading5 {
    dispatch_semaphore_t seam = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"1");
        sleep(1);
        NSLog(@"2");
        dispatch_semaphore_signal(seam);
    });
    
    dispatch_semaphore_wait(seam, DISPATCH_TIME_FOREVER);
    NSLog(@"====");
    
    dispatch_async(dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"3");
        sleep(1);
        NSLog(@"4");
        dispatch_semaphore_signal(seam);
    });
    
    NSLog(@"5");
    dispatch_semaphore_wait(seam, DISPATCH_TIME_FOREVER);
    NSLog(@"6");
    
}

/* 死锁问题 */
- (void)multithreading6 {
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"a");
    });
    
}

- (void)multithreading7 {
    dispatch_queue_t sari = dispatch_queue_create("aa", DISPATCH_QUEUE_SERIAL);
    dispatch_async(sari, ^{
        dispatch_sync(sari, ^{
            NSLog(@"aa");
        });
    });
    
}


@end
