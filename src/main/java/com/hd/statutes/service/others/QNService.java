package com.hd.statutes.service.others;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;

import java.io.InputStream;

public interface QNService {

    Response uploadFile(InputStream inputStream)throws QiniuException;

}
