package mapper1;

import entity.WrongSet;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface wrongSetMapper {
    int addWrongSet(List<WrongSet> wrongSet);
    int deleteWrongSet(int wrongSet_id);
    List<WrongSet> getWrongSetAll();
    WrongSet queryWrongSetById(int wrongSet_id);
    List<WrongSet> queryWrongSetByUserid(String userid);
}
