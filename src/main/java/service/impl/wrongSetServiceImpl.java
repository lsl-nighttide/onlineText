package service.impl;

import entity.WrongSet;
import mapper1.wrongSetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.wrongSetService;

import java.util.List;

@Service
public class wrongSetServiceImpl implements wrongSetService {
    @Autowired
    private wrongSetMapper wrongSetMapper;
    @Override
    public int addWrongSet(List<WrongSet> wrongSet) {
        return wrongSetMapper.addWrongSet(wrongSet);
    }

    @Override
    public int deleteWrongSet(int wrongSet_id) {
        return wrongSetMapper.deleteWrongSet(wrongSet_id);
    }

    @Override
    public List<WrongSet> getWrongSetAll() {
        return wrongSetMapper.getWrongSetAll();
    }

    @Override
    public WrongSet queryWrongSetById(int wrongSet_id) {
        return wrongSetMapper.queryWrongSetById(wrongSet_id);
    }

    @Override
    public List<WrongSet> queryWrongSetByUserid(String userid) {
        return wrongSetMapper.queryWrongSetByUserid(userid);
    }
}
