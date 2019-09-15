package service;

import entity.Collection_ques;

import java.util.List;

public interface collectionService {
    int addCollection(List<Collection_ques> collection);
    int deleteCollection(int collection_id);
    List<Collection_ques> getCollectionAll();
    Collection_ques queryCollectionById(int collection_id);
    Collection_ques queryCollectionByQuestion_id(int question_id);
    List<Collection_ques> queryCollectionByUserid(String userid);
}
