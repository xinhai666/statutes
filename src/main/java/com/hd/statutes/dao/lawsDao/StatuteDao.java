package com.hd.statutes.dao.lawsDao;

import com.hd.statutes.model.entity.*;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface StatuteDao {
    //查询法规集合
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
    //查询一个法规实体
    Statute getStatuteById(@Param("statuteId")int statuteId);
    //修改法规
    int updateStatute(Statute statute);

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
    //删除条款
    int delClauseById(@Param("clauseId")int clauseId);
    //查询一条法规
    ClauseVO checkClauseById(@Param("clauseId") int clauseId);
    //修改法规
    int updateClause(Clause clause);
    //删除目录
    int delContents(@Param("contentsId") int contentsId);
    //修改目录
    int updateContents(Contents contents);
    //删除法规
    int delStatuteById(@Param("statuteId") int statuteId);
    //收藏条款
    int wxAddCollects(@Param("userId") int userId, @Param(("claId")) int claId);
    //查询用户收藏的所有条款
    List<ClauseVO> checkClauseVOByUserId(@Param("userId")int userId,@Param("claId")int claId);
    //提交意见反馈
    int addOpinions(@Param("opinionContent") String opinionContent);
    //模糊查找条款
    List<ClauseVO> wxLoadAllClause(@Param(("keyword")) String keyword);
}
