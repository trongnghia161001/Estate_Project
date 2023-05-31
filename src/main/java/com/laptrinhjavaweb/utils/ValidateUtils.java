package com.laptrinhjavaweb.utils;

import com.laptrinhjavaweb.constant.SystemConstant;

public class ValidateUtils {
    public static boolean isValid(Object obj) {
        boolean isTrue = null != obj && !SystemConstant.EMPTY_STRING.equals(obj.toString());
        if (isTrue) {
            if (obj instanceof String) {
                return true;
            }
            if (obj instanceof Object) {
                return true;
            }
        }
        return false;
    }
}
