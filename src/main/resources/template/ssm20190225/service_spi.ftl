package ${package_path};

import ${package_path}.${class_name}Service;
import java.util.List;

/**
 * Service Interface:${class_name}
 * @author ${author}
 * @date ${sysDate?date}
 */
public interface ${class_name}Service{

    /**
     * 添加
     * @author ${author}
     * @date ${sysDate?date}
     */
    Integer insert(${class_name} ${class_name?uncap_first});

    /**
     * 选择性添加
     * @author ${author}
     * @date ${sysDate?date}
     */
    Integer insertSelective(${class_name} ${class_name?uncap_first});

    /**
     * 根据主键删除
     * @author ${author}
     * @date ${sysDate?date}
     */
    Integer deleteById(Long id);

    /**
     * 根据主键数组删除
     * @author ${author}
     * @date ${sysDate?date}
     */
    Integer deleteByIds(Long[] ids);

    /**
     * 条件删除
     * @author ${author}
     * @date ${sysDate?date}
     */
    Integer delete(${class_name} ${class_name?uncap_first});

    /**
     * 更新
     * @author ${author}
     * @date ${sysDate?date}
     */
    Integer update(${class_name} ${class_name?uncap_first});

    /**
     * 查询
     * @author ${author}
     * @date ${sysDate?date}
     */
	List<${class_name}> find(${class_name} ${class_name?uncap_first});

    /**
     * 查询全部
     * @author ${author}
     * @date ${sysDate?date}
     */
    List<${class_name}> findAll();

    /**
     * 查询数量
     * @author ${author}
     * @date ${sysDate?date}
     */
    Long findCount(${class_name} ${class_name?uncap_first});

    /**
     * 根据主键查询
     * @author ${author}
     * @date ${sysDate?date}
     */
    ${class_name} findById(Long id);
}