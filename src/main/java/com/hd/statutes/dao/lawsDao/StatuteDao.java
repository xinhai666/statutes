package com.hd.statutes.dao.lawsDao;

import com.hd.statutes.model.entity.*;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StatuteDao {
    //查询法规
    List<StatuteVO> getAllStatutes(@Param("statutestypeId") int statutestypeId, @Param("statutesplitId") int statutesplitId);
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
    //模糊查找法规（wx）
    List<Statute> checkStatuteByName(@Param("statuteName")String statuteName);
    //新增条款
    int addClause(Clause clause);
    //根据法规查询条款
    List<ClauseVO> getClauseVoBystaId(@Param("staId") int staId);
    //删除法规
    int delClauseById(@Param("clauseId")int clauseId);
    //查询一条法规
    ClauseVO checkClauseById(@Param("clauseId") int clauseId);
}
