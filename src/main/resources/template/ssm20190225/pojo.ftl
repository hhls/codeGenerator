package ${package_path};
import java.io.Serializable;

<#if (hasDateColumn)>
import java.util.Date;
</#if>

/**
 * POJO:${class_name}
 * 
 * @author ${author}
 * @date ${sysDate?date}
 */
public class ${class_name} implements Serializable {
	
	<#list table_column as c>
	<#--<#if (c.name!="id")>private ${c.type}	${c.nameJ};		<#if (c.remark?exists && c.remark!="")> /* ${c.remark} */ </#if></#if>-->
	<#if (c.remark?exists && c.remark!="")> /* ${c.remark} */ </#if>
	private ${c.type}	${c.nameJ};
	</#list>

	// Constructor
	public ${class_name}() {
	}

	<#list table_column as c>
	<#--<#if (c.type=="Date")>@JsonSerialize(using = ShortDateSerializer.class)</#if>-->
	public ${c.type} get${c.nameJ?cap_first}() {
		return ${c.nameJ};
	}

	public void set${c.nameJ?cap_first}(${c.type} ${c.nameJ}) {
		this.${c.nameJ} = ${c.nameJ};
	}

	</#list>
	@Override
	public String toString() {
		<#--return "${class_name} [" + <#list table_column as c>"<#if (c_index>=1)>, </#if>${c.nameJ}=" + <#if (c.name!="id")>${c.nameJ}<#else>getId()</#if> + </#list> "]";-->
		return "${class_name}{" +
                <#list table_column as c>
                "<#if (c_index>=1)>, </#if>${c.nameJ}=" + ${c.nameJ} +
                </#list>
                '}';
	}
}
