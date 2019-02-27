package com.mypro.config;

import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

/**
 * load configuration from "config.json" file
 *
 * @author xuyl
 * @date 2013-1-7
 */
public class Configuration {
    private static Configuration instance;
    //	public static final String SEPARATOR = File.separator;
    public static final String SEPARATOR = "/";
    private String project;
    private String author = "admin";    // default 'admin'
    private DbConfig dbConfig;
    private String templateDir;
    private String output="/C:/home/workspace/code/mypro/codeGenerator/target/out";
    private TemplateMapping[] mappings;
    private Group[] groups;
    /**
     * 类的名称空间
     */
    private String classNamespace;
    /**
     * get singleton instance of SetupConfig
     *
     * @return
     * @author xuyl
     * @date 2013-1-7
     */
    public static Configuration newInstance() {
        if (instance == null) {
            instance = new Gson().fromJson(loadJson(), Configuration.class);
        }
        return instance;
    }

    /**
     * load config.json file
     *
     * @return
     * @author xuyl
     * @date 2013-1-7
     */
    private static String loadJson() {
        StringBuilder sb = new StringBuilder("");
        try {

            String path = Configuration.class.getResource("/config.json").getPath();
            BufferedReader in = new BufferedReader(new FileReader(new File(path)));
            String str = "";
            while ((str = in.readLine()) != null) {
                int contentIndex = str.indexOf("//");        // 处理行注释
                if (contentIndex != -1) {
                    str = str.substring(0, contentIndex);
                }
                sb.append(str);
            }
            in.close();
        } catch (IOException e) {
            System.out.println("找不到配置文件:" + "/resources/config.json");
        }
        return sb.toString();
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public DbConfig getDbConfig() {
        return dbConfig;
    }

    public void setDbConfig(DbConfig dbConfig) {
        this.dbConfig = dbConfig;
    }

    public String getTemplateDir() {
        return templateDir;
    }

    public void setTemplateDir(String templateDir) {
        this.templateDir = templateDir;
    }

    public TemplateMapping[] getMappings() {
        return mappings;
    }

    public void setMappings(TemplateMapping[] mappings) {
        this.mappings = mappings;
    }

    public Group[] getGroups() {
        return groups;
    }

    public void setGroups(Group[] groups) {
        this.groups = groups;
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    @Override
    public String toString() {
        return "SetupConfig{" +
                "project='" + project + '\'' +
                ", author='" + author + '\'' +
                ", dbConfig=" + dbConfig +
                ", templateDir='" + templateDir + '\'' +
                ", output='" + output + '\'' +
                ", mappings=" + Arrays.toString(mappings) +
                ", groups=" + Arrays.toString(groups) +
                '}';
    }
}
