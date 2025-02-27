package com.jobmoa.app.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointCutConfig {

    @Pointcut("execution(* com.jobmoa.app.biz.*.*Impl.*(..))")
    public void daoLogPointcut() {}
}
