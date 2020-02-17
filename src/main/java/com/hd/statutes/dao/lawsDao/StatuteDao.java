package com.hd.statutes.dao.lawsDao;

import com.hd.statutes.model.entity.Contents;
import com.hd.statutes.model.entity.Statute;
import com.hd.statutes.model.entity.Statutesplit;
import com.hd.statutes.model.entity.Statutestype;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StatuteDao {
    //查询法规
    List<Statute> getAllStatutes(@Param("statutestypeId") int statutestypeId, @Param("statutesplitId") int statutesplitId);
    //查询所有规章类型
    List<Statutestype> getAllStatype();
    //根据规章类型 查询所有主分支
    List<Statutesplit> getAllStaSplit(@Param("statutestypeId")int statutestypeId);
    //添加法规类型
    int addSatatueType(@Param("statutestypeName")String statutestypeName);
    //删除法规类型
    int delStatueTypeById(@Param("statutestypeId") int statutestypeId);
    //查询法规类型实体
    Statutestype getStatutesTypeById(@Param("statutestypeId") int statutestypeId);
    //添加法规分支
    int addStaSplit(Statutesplit statutesplit);
    //删除分支
    int delStatueSplitById(@Param("statutesplitId") int statutesplitId);
    //添加法规
    int addStatute(Statute statute);

    //根据法规查询所有目录
    List<Contents> getAllContentsByStatuteId(@Param("contentsLevel") int contentsLevel,@Param("conId") int conId,@Param("staId") int staId );
    //添加目录
    int addContents(Contents contents);
    //查询一个目录
    Contents getContentsById(@Param("contentsId") int contentsId);
}
