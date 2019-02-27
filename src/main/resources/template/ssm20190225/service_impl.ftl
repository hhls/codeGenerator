package ${package_path};

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import ${package_path}.${class_name}ServiceImpl;
import java.util.List;

/**
 * Service Implementation:${class_name}
 * @author ${author}
 * @date ${sysDate?date}
 */
@Service
public class ${class_name}ServiceImpl implements ${class_name}Service {

    @Autowired
    private ${class_name}Mapper ${class_name?uncap_first}Mapper;


    /**
     * 添加
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Integer insert(${class_name} ${class_name?uncap_first}){
        return ${class_name?uncap_first}Mapper.insert(${class_name?uncap_first});
    }

    /**
     * 选择性添加
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Integer insertSelective(${class_name} ${class_name?uncap_first}){
        return ${class_name?uncap_first}Mapper.insertSelective(${class_name?uncap_first});
    }

    /**
     * 根据主键删除
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Integer deleteById(Long id){
        return ${class_name?uncap_first}Mapper.deleteById(id);
    }

    /**
     * 根据主键数组删除
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Integer deleteByIds(Long[] ids){
        return ${class_name?uncap_first}Mapper.deleteByIds(ids);
    }

    /**
     * 条件删除
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Integer delete(${class_name} ${class_name?uncap_first}){
        return ${class_name?uncap_first}Mapper.delete(${class_name?uncap_first});
    }

    /**
     * 更新
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Integer update(${class_name} ${class_name?uncap_first}){
        return ${class_name?uncap_first}Mapper.update(${class_name?uncap_first});
    }

    /**
     * 查询
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
	public List<${class_name}> find(${class_name} ${class_name?uncap_first}){
        return ${class_name?uncap_first}Mapper.find(${class_name?uncap_first});
    }

    /**
     * 查询全部
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public List<${class_name}> findAll(){
        return ${class_name?uncap_first}Mapper.findAll();
    }

    /**
     * 查询数量
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public Long findCount(${class_name} ${class_name?uncap_first}){
        return ${class_name?uncap_first}Mapper.findCount(${class_name?uncap_first});
    }

    /**
     * 根据主键查询
     * @author ${author}
     * @date ${sysDate?date}
     */
    @Override
    public List<${class_name}> findById(Long id){
        return ${class_name?uncap_first}Mapper.findById(id);
    }
}
