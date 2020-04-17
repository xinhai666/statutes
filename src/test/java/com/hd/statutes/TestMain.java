package com.hd.statutes;

import org.apache.shiro.crypto.hash.Md5Hash;

public class TestMain {
    public static void main(String[] args) {
        String pw="111111";
        Md5Hash md5Hash=new Md5Hash(pw,"pass",1200);
        System.out.println(md5Hash.toBase64().toString());
    }
}
