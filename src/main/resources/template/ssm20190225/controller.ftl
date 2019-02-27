package ${package_path};

import org.apache.log4j.Logger;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller of ${class_name}
 * @author ${author}
 * @date ${sysDate?date}
 */
@Controller
@RequestMapping("${class_name?uncap_first}")
public class ${class_name}Controller{

	private final Logger log = Logger.getLogger(${class_name}Controller.class);
	
	@Autowired
	private ${class_name}Service ${class_name?uncap_first}Service;

	/**
     * 添加
     * @author ${author}
     * @date ${sysDate?date}
     */
	@RequestMapping(value="", method = RequestMethod.POST)
	@ResponseBody
	public Result add(${class_name} ${class_name?uncap_first}) {
		${class_name?uncap_first}Service.insertSelective(${class_name?uncap_first});
		return Result.success();
	}

	/**
     * 修改
     * @author ${author}
     * @date ${sysDate?date}
     */
	@RequestMapping(value="{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Result update(@PathVariable Long id, @RequestBody ${class_name} ${class_name?uncap_first}) {
		//${class_name?uncap_first}Service.update(${class_name});
		return Result.success();
	}

	/**
     * 删除
     * @author ${author}
     * @date ${sysDate?date}
     */
	@RequestMapping(value="{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Result del(@PathVariable Long id) {
		${class_name?uncap_first}Service.deleteById(id);
		return Result.success();
	}

	/**
     * 查询
     * @author ${author}
     * @date ${sysDate?date}
     */
	@RequestMapping(value="{id}", method = RequestMethod.GET)
	@ResponseBody
	public Result getJson(@PathVariable Long id, Model model){
		${class_name?uncap_first}Service.findById(id);
		return Result.success();
	}
}
