// ##### extgen :: Auto-generated file do not edit!! #####

#import <objc/runtime.h>
#import "core/GMExtUtils.h"
#import "GMLevelPlayInternal_ios.h"


extern "C" const char* extOptGetString(char* _ext, char* _opt);

// Adapter: matches const signature expected by the C++ API
static const char* ExtOptGetString(const char* ext, const char* opt)
{
    return extOptGetString(const_cast<char*>(ext), const_cast<char*>(opt));
}

extern "C" const char* extGetVersion(char* _ext);

// Adapter: matches const signature expected by the C++ API
static const char* ExtGetVersion(const char* ext)
{
    return extGetVersion(const_cast<char*>(ext));
}

static BOOL GMIsSubclassOf(Class cls, Class base)
{
    for (Class c = cls; c != Nil; c = class_getSuperclass(c)) {
        if (c == base) return YES;
    }
    return NO;
}

static void GMInjectSelectorsIntoSubclass(Class subclass, Class base)
{
    // Build set of methods already defined on subclass
    unsigned subCount = 0;
    Method *subList = class_copyMethodList(subclass, &subCount);

    CFMutableSetRef owned = CFSetCreateMutable(kCFAllocatorDefault, 0, NULL);
    for (unsigned i = 0; i < subCount; ++i) {
        CFSetAddValue(owned, method_getName(subList[i]));
    }

    // Walk base class methods
    unsigned baseCount = 0;
    Method *baseList = class_copyMethodList(base, &baseCount);

    for (unsigned i = 0; i < baseCount; ++i) {
        SEL sel = method_getName(baseList[i]);
        const char *name = sel_getName(sel);

        // Only inject extension selectors (methods prefixed with __EXT_NATIVE__)
        if (!name || strncmp(name, "__EXT_NATIVE__", 13) != 0) continue;

        // Add only if subclass doesn't already have it
        if (!CFSetContainsValue(owned, sel)) {
            IMP imp = method_getImplementation(baseList[i]);
            const char *types = method_getTypeEncoding(baseList[i]);
            if (class_addMethod(subclass, sel, imp, types)) {
                CFSetAddValue(owned, sel);
            }
        }
    }

    if (subList) free(subList);
    if (baseList) free(baseList);
    if (owned) CFRelease(owned);
}

@interface GMLevelPlayInternal ()
{
    gm::runtime::DispatchQueue __dispatch_queue;
    id<GMLevelPlayInterface> __impl;
}@end


@implementation GMLevelPlayInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMLevelPlayInternal class];

    for (int i = 0; i < num; ++i) {
        Class cls = classes[i];
        if (cls == base) continue;

        // We only care about direct or indirect subclasses
        if (GMIsSubclassOf(cls, base)) {
            GMInjectSelectorsIntoSubclass(cls, base);
        }
    }

    free(classes);

    gm::details::GMRTRunnerInterface ri{};
    ri.ExtOptGetString = &ExtOptGetString;
    ri.ExtGetVersion = &ExtGetVersion;
    GMExtensionInitialise(&ri, sizeof(ri));
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        __impl = (id<GMLevelPlayInterface>)self;
    }
    return self;
}
- (double)__EXT_NATIVE__levelplay_init:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    gm_enums::LevelPlayError __result = [__impl levelplay_init:callback];

    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

- (double)__EXT_NATIVE__levelplay_is_initialized
{
    bool __result = [__impl levelplay_is_initialized];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__levelplay_set_consent:(double)enable
{
    [__impl levelplay_set_consent:enable];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_set_metadata:(char*)key arg1:(char*)value
{
    [__impl levelplay_set_metadata:key value:value];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_set_dynamic_user_id:(char*)user_id
{
    [__impl levelplay_set_dynamic_user_id:user_id];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_launch_test_suite
{
    [__impl levelplay_launch_test_suite];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_interstitial_init:(char*)ad_unit_id
{
    [__impl levelplay_interstitial_init:ad_unit_id];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_interstitial_load:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    gm_enums::LevelPlayError __result = [__impl levelplay_interstitial_load];

    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

- (double)__EXT_NATIVE__levelplay_interstitial_is_ready
{
    bool __result = [__impl levelplay_interstitial_is_ready];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__levelplay_interstitial_is_placement_capped:(char*)placement_id
{
    bool __result = [__impl levelplay_interstitial_is_placement_capped:placement_id];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__levelplay_interstitial_show:(char*)placement_id arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    gm_enums::LevelPlayError __result = [__impl levelplay_interstitial_show:placement_id];

    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

- (double)__EXT_NATIVE__levelplay_interstitial_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    [__impl levelplay_interstitial_callback_subscribe:callback];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_rewarded_video_init:(char*)ad_unit_id
{
    [__impl levelplay_rewarded_video_init:ad_unit_id];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_rewarded_video_load:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    gm_enums::LevelPlayError __result = [__impl levelplay_rewarded_video_load];

    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

- (double)__EXT_NATIVE__levelplay_rewarded_video_is_ready
{
    bool __result = [__impl levelplay_rewarded_video_is_ready];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__levelplay_rewarded_video_is_placement_capped:(char*)placement_id
{
    bool __result = [__impl levelplay_rewarded_video_is_placement_capped:placement_id];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__levelplay_rewarded_video_show:(char*)placement_id arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    gm_enums::LevelPlayError __result = [__impl levelplay_rewarded_video_show:placement_id];

    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

- (double)__EXT_NATIVE__levelplay_rewarded_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    [__impl levelplay_rewarded_callback_subscribe:callback];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_banner_create:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ad_unit_id, type: String
    std::string_view ad_unit_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: size, type: enum LevelPlayBannerSize
    gm_enums::LevelPlayBannerSize size = gm::wire::codec::readValue<gm_enums::LevelPlayBannerSize>(__br);

    // field: align_h, type: enum LevelPlayBannerHAlign
    gm_enums::LevelPlayBannerHAlign align_h = gm::wire::codec::readValue<gm_enums::LevelPlayBannerHAlign>(__br);

    // field: align_v, type: enum LevelPlayBannerVAlign
    gm_enums::LevelPlayBannerVAlign align_v = gm::wire::codec::readValue<gm_enums::LevelPlayBannerVAlign>(__br);

    gm_enums::LevelPlayError __result = [__impl levelplay_banner_create:ad_unit_id size:size align_h:align_h align_v:align_v];

    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

- (double)__EXT_NATIVE__levelplay_banner_move:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: align_h, type: enum LevelPlayBannerHAlign
    gm_enums::LevelPlayBannerHAlign align_h = gm::wire::codec::readValue<gm_enums::LevelPlayBannerHAlign>(__br);

    // field: align_v, type: enum LevelPlayBannerVAlign
    gm_enums::LevelPlayBannerVAlign align_v = gm::wire::codec::readValue<gm_enums::LevelPlayBannerVAlign>(__br);

    [__impl levelplay_banner_move:align_h align_v:align_v];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_banner_destroy
{
    [__impl levelplay_banner_destroy];

    return 0;
}

- (double)__EXT_NATIVE__levelplay_banner_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    [__impl levelplay_banner_callback_subscribe:callback];

    return 0;
}

// Internal function used for fetching dispatched function calls to GML
- (double)__EXT_NATIVE__GMLevelPlay_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

@end

