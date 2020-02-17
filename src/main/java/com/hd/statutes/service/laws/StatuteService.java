package com.hd.statutes.service.laws;

import com.hd.statutes.model.entity.*;
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
    List<Statute> getAllStatutes(int statutestypeId,int statutesplitId);

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


}
