package com.mwi.clmf.controller.admin.adminUser;import java.util.HashMap;import java.util.List;import java.util.Map;import net.sf.json.JSONObject;import com.jfinal.core.Controller;import com.jfinal.plugin.activerecord.Page;import com.mwi.clmf.model.adminUser.PrivilegeModel;import com.mwi.clmf.model.adminUser.RoleModel;import com.mwi.clmf.model.adminUser.RolePrivilegeModel;public class RoleController extends Controller {	public void index(){				int pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");		int pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");				String roleName = getPara("roleName");						Page<RoleModel> rolePage = RoleModel.rDao.rolePageWithPrivilege(pageNumber, pageSize, roleName);		List<RoleModel> roleList = rolePage.getList();		for(int i=0; i<roleList.size(); i++){			roleList.get(i).put("privilegeList", PrivilegeModel.pDao.priListByRoleId(roleList.get(i).getLong("id")));		}						setAttr("roleName", roleName);		setAttr("pageNumber", pageNumber);		setAttr("pageSize", pageSize);		setAttr("totalPage", rolePage.getTotalPage());				setAttr("count", roleList.size());		setAttr("rolePage", rolePage);		render("roleManage.jsp");	}		public void privilegeList(){		renderJson("priList", PrivilegeModel.pDao.privilegeList());	}		public void save(){		String privilegeIdsStr = getPara("add.privilegeIds");		String roleName = getPara("add.roleName");				String[] privilegeIds = privilegeIdsStr.split(",");		String sRoleId = getPara("set.roleId");		System.out.println(sRoleId+"----"+sRoleId.length());		if(sRoleId == null || "".equals(sRoleId)){			RoleModel rm = new RoleModel().set("role_name", roleName).set("status", "1");			rm.save();			Long roleId = rm.getLong("id");						for(int i=0; i<privilegeIds.length; i++){				new RolePrivilegeModel().set("role_id", roleId).set("privilege_id", privilegeIds[i]).save();			}		} else {			new RoleModel().findById(sRoleId).set("role_name", roleName).set("status", "1").update();			RolePrivilegeModel.rpDao.deleteByRoleId(sRoleId);			for(int j=0; j<privilegeIds.length; j++){				new RolePrivilegeModel().set("role_id", sRoleId).set("privilege_id", privilegeIds[j]).save();			}		}				redirect("/role");	}		public void toUpdate(){		Map<String, Object> map = new HashMap<String, Object>();		map.put("priList", PrivilegeModel.pDao.priListByRoleId(getParaToLong()));		map.put("roleInfor", RoleModel.rDao.findById(getParaToLong()));		renderJson("data", map);	}		public void delete(){		new RoleModel().deleteById(getPara());		RolePrivilegeModel.rpDao.deleteByRoleId(getPara());		redirect("/role");	}		public void batchDelete(){		String roleIdsStr = getPara("del.roleIds");		String[] roleIds = roleIdsStr.split(",");				for(int i=0; i<roleIds.length; i++){			new RoleModel().deleteById(roleIds[i]);			RolePrivilegeModel.rpDao.deleteByRoleId(roleIds[i]);		}		redirect("/role");			}}