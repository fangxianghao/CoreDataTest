//
//  AppDelegate.m
//  CoreDataTest
//
//  Created by uwitec on 16/12/20.
//  Copyright © 2016年 FangXH. All rights reserved.
//

#import "AppDelegate.h"
#import "Classes+CoreDataClass.h"
#import "Student+CoreDataClass.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreDataTest"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)insert {
    //AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    //1. 获得context
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    //2. 找到实体结构,并生成一个实体对象
    /*     NSEntityDescription实体描述，也就是表的结构     
     参数1：表名字     
     参数2:实例化的对象由谁来管理，就是context    
     */
    NSManagedObject *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    NSManagedObject *class1 = [NSEntityDescription insertNewObjectForEntityForName:@"Classes" inManagedObjectContext:context];
    [class1 setValue:[NSNumber numberWithInt:1] forKey:@"c_Id"];
    [class1 setValue:@"一班" forKey:@"c_Name"];
    //3. 设置实体属性值
    [stu setValue:[NSNumber numberWithInt:1] forKey:@"s_Id"];
    [stu setValue:@"FANG" forKey:@"s_Name"];
    [stu setValue:@1 forKey:@"s_Sex"];
    [stu setValue:class1 forKey:@"s_Class"];
    //4. 调用context,保存实体,如果没有成功，返回错误信息
    NSError *error;
    if ([context save:&error]) {
        NSLog(@"save ok");
    }    else    {
        NSLog(@"%@",error);
    }
}

- (void)selectAll {
    //AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSEntityDescription *stu = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //构造查询对象
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:stu];
    //执行查询，返回结果集
    NSArray *resultAry = [context executeFetchRequest:request error:nil];
    //遍历结果集
    for (NSManagedObject *enity in resultAry) {
        NSLog(@"id=%i name=%@ class=%@   \n>>> s_Class = %@ >>>\n%@",[[enity valueForKey:@"s_Id"] intValue],[enity valueForKey:@"s_Name"],[[enity valueForKey:@"s_Class"] valueForKey:@"c_Name"],[enity valueForKey:@"s_Class"],[[[enity valueForKey:@"s_Class"] valueForKey:@"c_Students"] valueForKey:@"s_Name"]);
    }
}

- (void)update{
    //    更新 (从数据库找到-->更新)    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSEntityDescription *stu = [NSEntityDescription entityForName:@"Classes" inManagedObjectContext:context];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:stu];
    //构造查询条件，相当于where子句
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"s_Id=%i",1];
    
    //把查询条件放进去
    //[request setPredicate:predicate];
    NSPredicate * cdt1 = [NSPredicate predicateWithFormat:@"c_Name = '一班'"];
    [request setPredicate:cdt1];
    Classes *objs1 =[[context executeFetchRequest:request error:nil] firstObject];
    NSSet * ret1 = objs1.c_Students;
     NSPredicate * filter1 = [NSPredicate predicateWithFormat:@"s_Name = %@",@"apple"];
    
    //执行查询
    Student *XiaoMing =  [[ret1 filteredSetUsingPredicate:filter1] anyObject];
    NSLog(@">>>>%d\n>>>>>>%@\n>>>>>>%d\n>>>>>>%@\n",XiaoMing.s_Id,XiaoMing.s_Name,XiaoMing.s_Sex,XiaoMing.s_Class);
 /*
    NSArray *studentAry = [context executeFetchRequest:request error:nil];
    if (studentAry.count>0)    {
        //更新里面的值
        NSManagedObject *obj = studentAry[0];
        [obj setValue:@"apples" forKey:@"s_Name"];
    }
    [context save:nil];
    //显示
    [self selectAll];*/
}


- (void)deleteAll{
    //删除 先找到，然后删除    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSEntityDescription *stu = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:stu];
    //构造查询条件，相当于where子句
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"s_Id=%i",1];
    //把查询条件放进去
    [request setPredicate:predicate];
    //执行查询
    NSManagedObject *obj = [[context executeFetchRequest:request error:nil] lastObject];
    //删除
    if (obj) {
        [context deleteObject:obj];
        [context save:nil];
    }
    [self selectAll];
}

@end
