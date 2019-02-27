package com.mypro.core;

import com.mypro.config.Configuration;
import com.mypro.jdbc.AbstractDaoSupport;
import com.mypro.util.MyUtils;
import com.mypro.util.StringUtil;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * freemarker生成器Test
 *
 * @author Yinglong Xu
 * @date 2012-2-16
 */
public class BuildFactory {
    private static final Map<String, Map<String, Object>> CACHE = new HashMap<String, Map<String, Object>>();
    private static Configuration config = Configuration.newInstance();
    private static AbstractDaoSupport dao = AbstractDaoSupport.getInstance();

    /**
     * 配置属性
     */
    private static freemarker.template.Configuration cfg = new freemarker.template.Configuration();

    /**
     * 根据模板生成文件
     *
     * @param templateFile
     * @param obj
     * @param outFile
     */
    public void build(String templateFile, Object obj, String outFile) {
        try {
            if (!templateFile.startsWith("/")) {
                templateFile = "/" + templateFile;
            }
            cfg.setClassLoaderForTemplateLoading(BuildFactory.class.getClassLoader(),"/");
            Template t = cfg.getTemplate(templateFile);
            Writer out = new OutputStreamWriter(new FileOutputStream(outFile), "utf-8");
            t.process(obj, out);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }

    /**
     * POJO数据准备
     *
     * @param tableName
     * @return Map
     */
    public Map<String, Object> getParams(String tableName, String packagePath) {
        if (CACHE.containsKey(tableName)) {
            Map<String, Object> map = CACHE.get(tableName);
            map.put("model_package", MyUtils.buildModelPackage(tableName));
            map.put("model_name", MyUtils.getModelName(tableName, "."));
            map.put("package_path", packagePath);
            return map;
        }
        // 数据准备,可以是Map,List或者是实体
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("package_path", packagePath);
        map.put("model_name", MyUtils.getModelName(tableName, "."));
        map.put("model_package", MyUtils.buildModelPackage(tableName));
        map.put("table_name", tableName);
        map.put("class_name", StringUtil.className(tableName));
        List<Column> columns = dao.queryColumns(tableName);
        map.put("table_column", columns);        // 设置数据
        map.put("hasDateColumn", Column.typeContains(columns, "Date"));        // 特殊字符处理
        map.put("project", config.getProject());
        map.put("author", config.getAuthor());
        map.put("sysDate", new Date());
        CACHE.put(tableName, map);
        return map;
    }
}
