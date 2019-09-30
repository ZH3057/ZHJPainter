//
//  ZHJMacros.h
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#ifndef ZHJMacros_h
#define ZHJMacros_h

#ifdef __OBJC__

#ifndef __OPTIMIZE__
#define NSLog(format, ...) printf("\n[%s] <%s(%d)> %s\n %s\n", __TIME__, [[NSString stringWithFormat:@"%s", __FILE__].lastPathComponent UTF8String],  __LINE__, __FUNCTION__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
#else
#define NSLog(...) {}
#endif

#endif


#endif /* ZHJMacros_h */
