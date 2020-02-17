package com.hd.statutes.service.others.impl;

import com.hd.statutes.service.others.QNService;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;

@Service
public class QNServiceImpl implements QNService, InitializingBean {

    @Resource
    private UploadManager uploadManager;

    @Resource
    private BucketManager bucketManager;

    @Resource
    private Auth auth;

    @Value("${qiniu.bucket}")
    private String bucket;

    private StringMap putPolicy;

    @Override
    public Response uploadFile(InputStream inputStream) throws QiniuException {
        Response response=uploadManager.put(inputStream,null,getToken(),null,null);

        int trytimes=0;
        while (response.needRetry()&&trytimes<3){
            response=uploadManager.put(inputStream,null,getToken(),null,null);
            trytimes++;
        }
        return response;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        this.putPolicy=new StringMap();
        putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":$(fsize)}");

    }

    private String getToken(){
        return this.auth.uploadToken(bucket,null,3600,putPolicy);
    }
}
