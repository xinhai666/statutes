package com.hd.statutes.service.laws;

import com.hd.statutes.model.entity.*;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatuteService {
    /**
     * 查询所有法规类型
     * @return
     */
    List<Statutestype> getAllStatype();

    /**
     * 根据法规类型id查询所有该法规主分支
     * @param statutestypeId
     * @return
     */
    List<Statutesplit> getAllStaSplit(int statutestypeId);
    /**
     * 查询所有法规
     * @param statutestypeId
     * @param statutesplitId
     * @return
     */
    List<StatuteVO> getAllStatutes(int statutestypeId, int statutesplitId);

    /**
     * 添加法规类型
     * @param statutestypeName
     * @return
     */
    int addSatatueType(String statutestypeName);

    /**
     * 删除法规类型
     * @param statutestypeId
     * @return
     */
    int delStatueTypeById(int statutestypeId);

    /**
     * 查询一个法规类型
     * @param statutestypeId
     * @return
     */
    Statutestype getStatutesTypeById(int statutestypeId);

    /**
     * 添加主分支
     * @param statutesplit
     * @return
     */
    int addStaSplit(Statutesplit statutesplit);

    /**
     * 删除分支
     * @param statutesplitId
     * @return
     */
    int delStatueSplitById(int statutesplitId);

    /**
     * 添加法规
     * @param statute
     * @return
     */
    int addStatute(Statute statute);

    /**根据法规查询所有目录
     * @param contentsLevel
     * @param conId
     * @param staId
     * @return
     */
    List<Contents> getAllContentsByStatuteId(int contentsLevel,int conId,int staId );

    /**添加目录
     *
     * @param contents
     * @return
     */
    int addContents(Contents contents);

    /**
     * 查询一个目录
     * @param contentsId
     * @return
     */
    Contents getContentsById(int contentsId);

    /**
     * 模糊查找法规
     * @param statuteName
     * @return
     */
    List<Statute> checkStatuteByName(String statuteName);

    /**
     * 新增条款
     * @param clause
     * @return
     */
    int addClause(Clause clause);

    /**
     * 根据法规查条款
     * @param staId
     * @return
     */
    List<ClauseVO> getClauseVoBystaId(int staId);

    /**
     * 删除条款
     * @param clauseId
     * @return
     */
    int delClauseById(int clauseId);

    /**
     * 查询一条法规
     * @param clauseId
     * @return
     */
    ClauseVO checkClauseById(int clauseId);

    /**
     * 修改法规
     * @param clause
     * @return
     */
    int updateClause(Clause clause);
}
