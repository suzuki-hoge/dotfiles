#import <Cocoa/Cocoa.h>

NSArray *DCSCopyAvailableDictionaries();
NSString *DCSDictionaryGetShortName(DCSDictionaryRef dictID);

NSString *getArg()
{
    NSArray *args = [[NSProcessInfo processInfo] arguments];
    return [[NSString alloc] initWithString:[args objectAtIndex:1]];
}

NSString *getName(NSObject *available)
{
    return DCSDictionaryGetShortName((__bridge DCSDictionaryRef)available);
}

Boolean isTargetAtLion(NSString *name)
{
    return [name isEqualToString:@"英和／和英辞典"];
}

Boolean isTargetAtMavericks(NSString *name)
{
    return [name isEqualToString:@"Japanese-English"];
}

Boolean isTarget(NSObject *available)
{
    NSString *name = getName(available);
    return (isTargetAtLion(name) || isTargetAtMavericks(name));
}

DCSDictionaryRef getDict()
{
    DCSDictionaryRef dict;
    for (NSObject *available in DCSCopyAvailableDictionaries())
        if (isTarget(available))
            dict = (__bridge DCSDictionaryRef)available;
    return dict;
}

CFStringRef getWord(NSString *word)
{
    return (__bridge CFStringRef)word;
}

CFRange getRange(NSString *word)
{
    return CFRangeMake(0, word.length);
}

NSString *lookUp(DCSDictionaryRef dict, CFStringRef word, CFRange range)
{
    return (__bridge NSString *)DCSCopyTextDefinition(dict, word, range);
}

void output(NSString *result)
{
    if (result)
        printf("%s", [result UTF8String]);
    else
        printf("%s", [@"no hit" UTF8String]);
}

int main(int argc, char** argv)
{
    
    @autoreleasepool{
        NSString *arg = getArg();
        DCSDictionaryRef dict = getDict();
        CFStringRef word = getWord(arg);
        CFRange range = getRange(arg);
        
        NSString *result = lookUp(dict, word, range);
        
        output(result);
    }
}