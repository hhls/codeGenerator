package com.mypro.builder;

import com.mypro.config.Configuration;
import com.mypro.config.TemplateMapping;
import com.mypro.core.BuildFactory;
import com.mypro.jdbc.AbstractDaoSupport;
import com.mypro.util.FileUtil;
import com.mypro.util.MyUtils;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Builder Entry
 *
 * @author xuyl
 * @date 2013-1-7
 */
public class Builder {

    /**
     * freemarker factory
     */
    private static BuildFactory factory = new BuildFactory();

    /**
     * config instance
     */
    private static Configuration config = Configuration.newInstance();

    /**
     * generate from all template files.
     *
     * @author xuyl
     * @date 2013-1-7
     */
    public void db2pojoEntry() {
        // iterator all template file
        TemplateMapping[] mappings = config.getMappings();
        List<String> tablesList = AbstractDaoSupport.getInstance().queryAllTables();
        File file = new File(Configuration.newInstance().getOutput());
        if (file.exists()) {
            FileUtil.deleteDir(file);
        }
        file.mkdirs();
        for (TemplateMapping m : mappings) {
            // iterator all databases tables.
            for (String tableName : tablesList) {
                String packagePath = m.buildPackage(config.getProject(), MyUtils.getModelName(tableName, "."));
                Map<String, Object> data = factory.getParams(tableName, packagePath);
                factory.build(MyUtils.getTemplatePath(m), data, MyUtils.getOutPutPath(m, tableName));
            }
        }
    }


    /**
     * main entry
     *
     * @param args
     */
    public static void main(String[] args) {
        new Builder().db2pojoEntry();
        System.out.println("Congratulations! Your code generate successfully....^_^.....");
    }
}
