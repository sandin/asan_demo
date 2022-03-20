#include <jni.h>
#include <string>

#include "asan_sample.h"


extern "C" JNIEXPORT jint JNICALL
Java_com_lds_asandemo_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    //std::string hello = "Hello from C++";

    //return asan_sample_use_after_free();
    //return asan_sample_heap_out_of_bounds();
    asan_sample_global_out_of_bounds();
    //return 1;//env->NewStringUTF("hello");
}







