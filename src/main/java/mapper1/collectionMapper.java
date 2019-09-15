package mapper1;

import entity.Collection_ques;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface collectionMapper {
    int addCollection(List<Collection_ques> collection);
    int deleteCollection(int collection_id);
    List<Collection_ques> getCollectionAll();
    Collection_ques queryCollectionById(int collection_id);
    Collection_ques queryCollectionByQuestion_id(int question_id);
    List<Collection_ques> queryCollectionByUserid(String userid);
}
