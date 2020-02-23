package com.hd.statutes.service.laws.impl;

import com.hd.statutes.dao.lawsDao.StatuteDao;
import com.hd.statutes.model.entity.*;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import com.hd.statutes.service.laws.StatuteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class StatuteServiceImpl implements StatuteService {
    @Resource
    private StatuteDao statuteDao;

    @Override
    public List<StatuteVO> getAllStatutes(int statutestypeId, int statutesplitId) {
        return statuteDao.getAllStatutes(statutestypeId,statutesplitId);
    }

    @Override
    public int addSatatueType(String statutestypeName) {
        return statuteDao.addSatatueType(statutestypeName);
    }

    @Override
    public int delStatueTypeById(int statutestypeId) {
        return statuteDao.delStatueTypeById(statutestypeId);
    }

    @Override
    public Statutestype getStatutesTypeById(int statutestypeId) {
        return statuteDao.getStatutesTypeById(statutestypeId);
    }

    @Override
    public int addStaSplit(Statutesplit statutesplit) {
        return statuteDao.addStaSplit(statutesplit);
    }

    @Override
    public int delStatueSplitById(int statutesplitId) {
        return statuteDao.delStatueSplitById(statutesplitId);
    }

    @Override
    public int addStatute(Statute statute) {
        return statuteDao.addStatute(statute);
    }

    @Override
    public List<Contents> getAllContentsByStatuteId(int contentsLevel, int conId, int staId) {
        return statuteDao.getAllContentsByStatuteId(contentsLevel,conId,staId);
    }

    @Override
    public int addContents(Contents contents) {
        return statuteDao.addContents(contents);
    }

    @Override
    public Contents getContentsById(int contentsId) {
        return statuteDao.getContentsById(contentsId);
    }

    @Override
    public List<Statute> checkStatuteByName(String statuteName) {
        return statuteDao.checkStatuteByName(statuteName);
    }

    @Override
    public int addClause(Clause clause) {
        return statuteDao.addClause(clause);
    }

    @Override
    public List<ClauseVO> getClauseVoBystaId(int staId) {
        return statuteDao.getClauseVoBystaId(staId);
    }

    @Override
    public int delClauseById(int clauseId) {
        return statuteDao.delClauseById(clauseId);
    }

    @Override
    public ClauseVO checkClauseById(int clauseId) {
        return statuteDao.checkClauseById(clauseId);
    }

    @Override
    public int updateClause(Clause clause) {
        return statuteDao.updateClause(clause);
    }

    @Override
    public int delContents(int contentsId) {
        return statuteDao.delContents(contentsId);
    }

    @Override
    public int updateContents(Contents contents) {
        return statuteDao.updateContents(contents);
    }

    @Override
    public Statute getStatuteById(int statuteId) {
        return statuteDao.getStatuteById(statuteId);
    }

    @Override
    public int updateStatute(Statute statute) {
        return statuteDao.updateStatute(statute);
    }

    @Override
    public int delStatuteById(int statuteId) {
        return statuteDao.delStatuteById(statuteId);
    }

    @Override
    public List<Statutestype> getAllStatype() {
        return statuteDao.getAllStatype();
    }

    @Override
    public List<Statutesplit> getAllStaSplit(int statutestypeId) {
        return statuteDao.getAllStaSplit(statutestypeId);
    }

}
