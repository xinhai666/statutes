package com.hd.statutes.service.laws.impl;

import com.hd.statutes.dao.lawsDao.StatuteDao;
import com.hd.statutes.model.entity.*;
import com.hd.statutes.service.laws.StatuteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class StatuteServiceImpl implements StatuteService {
    @Resource
    private StatuteDao statuteDao;

    @Override
    public List<Statute> getAllStatutes(int statutestypeId, int statutesplitId) {
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
    public List<Statutestype> getAllStatype() {
        return statuteDao.getAllStatype();
    }

    @Override
    public List<Statutesplit> getAllStaSplit(int statutestypeId) {
        return statuteDao.getAllStaSplit(statutestypeId);
    }

}
