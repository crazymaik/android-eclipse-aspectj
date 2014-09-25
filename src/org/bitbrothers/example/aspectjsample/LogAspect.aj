package org.bitbrothers.example.aspectjsample;

import android.app.Activity;
import android.app.Fragment;
import android.util.Log;

public aspect LogAspect {

    pointcut activityLifecycleMethods() : execution(* Activity+.on*(..)) ;

    pointcut fragmentLifecycleMethods() : execution(* Fragment+.on*(..)) ;

    Object around() : (activityLifecycleMethods() || fragmentLifecycleMethods()) {
        String method = thisJoinPoint.getSignature().toShortString();
        Log.d("Lifecycle", "Enter " + method);
        Object result = proceed();
        Log.d("Lifecycle", "Exit  " + method);
        return result;
    }
}
