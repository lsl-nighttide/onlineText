package service.impl;

import entity.Collection_ques;
import mapper1.collectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.collectionService;

import java.util.List;

@Service
public class collectionServiceImpl implements collectionService {
    @Autowired
    private collectionMapper collectionMapper;
    @Override
    public int addCollection(List<Collection_ques> collection) {
        return collectionMapper.addCollection(collection);
    }

    @Override
    public int deleteCollection(int collection_id) {
        return collectionMapper.deleteCollection(collection_id);
    }

    @Override
    public List<Collection_ques> getCollectionAll() {
        return collectionMapper.getCollectionAll();
    }

    @Override
    public Collection_ques queryCollectionById(int collection_id) {
        return collectionMapper.queryCollectionById(collection_id);
    }

    @Override
    public Collection_ques queryCollectionByQuestion_id(int question_id) {
        return collectionMapper.queryCollectionByQuestion_id(question_id);
    }

    @Override
    public List<Collection_ques> queryCollectionByUserid(String userid) {
        return collectionMapper.queryCollectionByUserid(userid);
    }
}
