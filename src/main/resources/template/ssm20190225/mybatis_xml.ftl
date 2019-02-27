<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package_path}.${class_name}Mapper">
	<resultMap id="${class_name?uncap_first}ResultMap" type="${class_name?uncap_first}">
		<#list table_column as c>
            <#if c_index==0>
		<id property="${c.nameJ}" column="${c.name}" />
            </#if>
            <#if c_index!=0>
		<result property="${c.nameJ}" column="${c.name}" />
            </#if>
		</#list>
	</resultMap>
	
	<sql id="table_columns">
		<#list table_column as c>
		`${c.name}`<#if c_has_next>,</#if>
		</#list>
    </sql>

    <sql id="entity_properties">
		<#list table_column as c>
			${r"#"}{${c.nameJ}}<#if c_has_next>,</#if>
		</#list>
    </sql>

    <!--条件查询-->
    <sql id="where">
        <where>
			<#list table_column as c><#if (c_index>=1)>
            	<if test="${c.nameJ} != null<#if c.type=="String"> and ${c.nameJ} != ''</#if>">and ${c.name} = ${r"#"}{${c.nameJ}}</if>
			</#if></#list>
        </where>
    </sql>

	<!-- 适用于主键自增类型 -->
	<insert id="insert" parameterType="${class_name?uncap_first}" useGeneratedKeys="true" keyProperty="id">
		insert into `${table_name}`( <include refid="table_columns" /> ) 
		values ( <include refid="entity_properties" /> )
	</insert>

    <insert id="insertSelective" parameterType="${class_name?uncap_first}" useGeneratedKeys="true" keyProperty="id">
        insert into `${table_name}`
        <trim prefix="(" suffix=")" suffixOverrides=",">
		<#list table_column as c>
			 <if test="${c.nameJ} != null">
				${c.name},
			 </if>
		</#list>
        </trim>
        values
        <trim prefix="(" suffix=")" suffixOverrides=",">
		<#list table_column as c>
            <if test="${c.nameJ} != null">
                ${r"#"}{${c.nameJ}},
            </if>
		</#list>
        </trim>
    </insert>

    <delete id="deleteById">
        delete from `${table_name}`
        where id = ${r"#"}{id}
    </delete>

	<delete id="deleteByIds">
		delete from `${table_name}`
		where id in
		<foreach item="item" collection="array" open="(" separator="," close=")">
			${r"#"}{item}
		</foreach>
	</delete>

    <delete id="delete" parameterType="${class_name?uncap_first}">
        delete from `${table_name}`
        <include refid="where"/>
    </delete>
	
	<update id="update" parameterType="${class_name?uncap_first}">
		update `${table_name}` 
		<trim prefix="set" suffixOverrides=",">
		<#list table_column as c><#if (c_index>=1)>
			<if test="${c.nameJ} != null and ${c.nameJ} != ''">${c.name} = ${r"#"}{${c.nameJ}},</if>
		</#if></#list>
		</trim>
		<where>id = ${r"#"}{id}</where>
	</update>

    <select id="find" parameterType="${class_name?uncap_first}" resultMap="${class_name?uncap_first}ResultMap">
        SELECT 	<include refid="table_columns"/>
        FROM 	`${table_name}`
        <include refid="where"/>
    </select>

    <select id="findAll" resultMap="${class_name?uncap_first}ResultMap">
        select <include refid="table_columns" />
        from `${table_name}`
    </select>

    <select id="findCount" resultType="java.lang.Long">
        SELECT 	count(1)
        FROM 	`${table_name}`
        <include refid="where"/>
    </select>

    <select id="findById" resultMap="${class_name?uncap_first}ResultMap" parameterType="int" >
        select <include refid="table_columns" />
        from `${table_name}`
        where id = ${r"#"}{id}
    </select>

    <!-- 其他自定义SQL -->
</mapper>