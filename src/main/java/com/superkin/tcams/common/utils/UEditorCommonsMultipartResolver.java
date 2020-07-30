package com.superkin.tcams.common.utils;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;


public class UEditorCommonsMultipartResolver extends CommonsMultipartResolver {
    @Override
    public boolean isMultipart(HttpServletRequest request) {
        String url = request.getRequestURI();
        if (url != null && url.contains("/ueditor/init")) {
            return false;
        } else {
            return super.isMultipart(request);
        }
    }

}
