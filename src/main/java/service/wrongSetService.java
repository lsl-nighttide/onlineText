package service;

import entity.WrongSet;

import java.util.List;

public interface wrongSetService {
    int addWrongSet(List<WrongSet> wrongSet);
    int deleteWrongSet(int wrongSet_id);
    List<WrongSet> getWrongSetAll();
    WrongSet queryWrongSetById(int wrongSet_id);
    List<WrongSet> queryWrongSetByUserid(String userid);
}
