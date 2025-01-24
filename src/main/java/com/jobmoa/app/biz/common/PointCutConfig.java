package com.jobmoa.app.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointCutConfig {

    @Pointcut("execution(* com.jobmoa.app.biz.*.*Service.*(..))")
    public void daoLogPointcut() {}
}
