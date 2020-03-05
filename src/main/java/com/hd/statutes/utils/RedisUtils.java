package com.hd.statutes.utils;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class RedisUtils {

    @Resource
    private RedisTemplate<String,Object> redisTemplate;

    /**
     * 存入redis
     * @param key
     * @param value
     * @return
     */
    public boolean setRedis(String key,String value){
        try {
            redisTemplate.setKeySerializer(new StringRedisSerializer());
            redisTemplate.setValueSerializer(new StringRedisSerializer());
            ValueOperations<String,Object> vo=redisTemplate.opsForValue();
            vo.set(key,value);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 存入redis带有效时间
     * @param key
     * @param value
     * @param seconds
     * @return
     */
    public boolean setReids(String key,String value,long seconds){
        try {
            redisTemplate.setKeySerializer(new StringRedisSerializer());
            redisTemplate.setValueSerializer(new StringRedisSerializer());
            ValueOperations<String,Object> vo=redisTemplate.opsForValue();
            vo.set(key,value);
            this.expire(key,seconds);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 设置reids数据有效时间
     * @param key
     * @param expireTime
     * @return
     */
    public boolean expire(final String key,final long expireTime){
        return redisTemplate.execute(new RedisCallback<Boolean>(){
            @Override
            public Boolean doInRedis(RedisConnection redisConnection) throws DataAccessException {
                boolean flag=false;
                try{
                    redisTemplate.setKeySerializer(new StringRedisSerializer());
                    redisTemplate.setValueSerializer(new StringRedisSerializer());
                    byte[] keys=new StringRedisSerializer().serialize(key);
                    flag=redisConnection.expire(keys,expireTime);
                }catch (Exception e){
                    e.printStackTrace();
                }
                return flag;
            }
        });
    }

    /**
     * 获取redis数据有效时间
     * @param key
     * @return
     */
    public long getExpire(String key){
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        return redisTemplate.getExpire(key);
    }

    /**
     * 获取redis数据值
     * @param key
     * @return
     */
    public Object get(String key){
        redisTemplate .setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new StringRedisSerializer());
        ValueOperations<String,Object> vo=redisTemplate.opsForValue();
        return vo.get(key);
    }

    /**
     * 判断redis数据是否存在
     * @param key
     * @return
     */
    public boolean exists(String key){
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        ValueOperations<String,Object> vo=redisTemplate.opsForValue();
        Object value=vo.get(key);
        if(value!=null&&value!=""){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 删除redis数据
     * @param key
     */
    public void delete(String key){
        try {
            redisTemplate.setKeySerializer(new StringRedisSerializer());
            redisTemplate.delete(key);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改redis数据
     * @param key
     * @param value
     * @return
     */
    public boolean update(String key,String value){
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new StringRedisSerializer());
        ValueOperations<String,Object> vo=redisTemplate.opsForValue();
        Long tllTime=redisTemplate.getExpire(key);
        if(tllTime==null){
            return false;
        }else if(tllTime==0||tllTime==-2) {
            return false;
        }
        vo.set(key,value);
        if(tllTime>0){
            this.expire(key,tllTime);
        }
        return true;
    }

}
