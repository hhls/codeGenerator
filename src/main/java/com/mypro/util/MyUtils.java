package com.mypro.util;

import com.mypro.config.Group;
import com.mypro.config.Configuration;
import com.mypro.config.TemplateMapping;

import java.io.File;

/**
 * 工具类
 *
 * @author xuyl
 * @date 2013-2-28
 */
public class MyUtils {
    /**
     * config instance
     */
    private static Configuration config = Configuration.newInstance();

    /**
     * freemarker template file path
     *
     * @param m
     * @return
     * @author xuyl
     * @date 2013-1-30
     */
    public static String getTemplatePath(TemplateMapping m) {
        return config.getTemplateDir() + "/" + m.getTemplate();
    }

    /**
     * witch group contains tableName
     *
     * @param tableName
     * @return
     * @author xuyl
     * @date 2013-2-28
     */
    public static String getGroupName(String tableName) {
        Group[] groups = config.getGroups();
        String name = null;
        for (Group g : groups) {
            name = g.findGroupName(tableName);
            if (name != null) {
                return name;
            }
        }
        return null;
    }

    /**
     * model name of project.(default: group name and tableName in java style )
     *
     * @param tableName
     * @return
     * @author xuyl
     * @date 2013-1-8
     */
    public static String getModelName(String tableName, String separator) {
        String g = getGroupName(tableName);
        if (g == null) {
            return StringUtil.javaStyleOfTableName(tableName);
        }
        return g;// + separator + StringUtil.javaStyleOfTableName(tableName);
    }

    /**
     * generate output file path.
     *
     * @param m
     * @param tableName
     * @return
     * @author xuyl
     * @date 2013-1-7
     */
    public static String getOutPutPath(TemplateMapping m, String tableName) {
        String basePath = Configuration.newInstance().getOutput();
        String path = basePath + Configuration.SEPARATOR
                + m.buildDir(config.getProject(), getModelName(tableName, "/")) + Configuration.SEPARATOR;
        path += m.getLpadding() + StringUtil.className(tableName) + m.getRpadding() + "." + m.getSuffix();
        mkdir(path);
        return path;
    }

    /**
     * mkdir by path if not exist
     *
     * @param filePath
     * @author xuyl
     * @date 2013-1-7
     */
    public static void mkdir(String filePath) {
        int index = filePath.lastIndexOf("\\");
        int index2 = filePath.lastIndexOf("/");
        if (index == -1 && index2 == -1) {
            return;
        }
        index = index > index2 ? index : index2;
//        if (index != -1 && !new File(filePath.substring(0, index)).exists()) {
//            System.out.println("mkdir - " + filePath.substring(0, index));
//            new File(filePath.substring(0, index)).mkdirs();
//        }
        File file = new File(filePath.substring(0, index));
        file.mkdirs();
    }

    /**
     * project + group + tableName
     *
     * @return
     * @author xuyl
     * @date 2013-2-28
     */
    public static String buildModelPackage(String tableName) {
        return config.getProject();
    }
}
