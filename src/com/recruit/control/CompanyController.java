package com.recruit.control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.Company;
import com.recruit.dao.gen.model.User;
import com.recruit.service.CompanyService;
import com.recruit.util.BaseResponse;




@Controller
@RequestMapping("/com")
public class CompanyController {
	
	@Resource
CompanyService companyService;

	@ResponseBody
	@RequestMapping(value = "/checkCompanyname")
	public String checkCompanyname(String  fullname){
		Company company=companyService.findByCompanyname(fullname);
		
		if(company==null){
			//允许注册
			return "1";
		}else{
			//不允许注册
			return "0";
		}

		
	}
	
	@ResponseBody
	@RequestMapping(value = "/findCompanyById")
	public BaseResponse findCompanyById(HttpServletRequest request){
		//Company company=companyService.findByCompanyname(fullname);
		User user=	(User) request.getSession().getAttribute("user");
		BaseResponse b=new BaseResponse();
		
		if(user==null){
			//允许注册
			b.setStatus(400);
		
		}else if(user.getStatus()==1){
			b.setStatus(500);
			
		}else{
			
			Company company=companyService.findByUid(user.getId());
			b.setStatus(200);
			b.setContent(company);
		
		}

		return b;
		
	}
	
	/**
	 * 保存用户
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/saveCompany")
	public ModelAndView  saveUser(Company  company,HttpServletRequest request) throws UnsupportedEncodingException {
	User user=	(User) request.getSession().getAttribute("user");
		company.setUserId(user.getId());
		ModelAndView view = new ModelAndView();
	boolean flag=companyService.saveCompany(company);

		if(flag==true){
			//允许注册
			view.setViewName("user/registerSuccess");
		}else{
			//不允许注册
			view.setViewName("user/comInfoRegister");
		}


		return view;
	}
	@RequestMapping(value="deleteCompanyInfo")
	public void delCom(int id,HttpServletResponse response){
		 String message = "";  
	       try{  
	          boolean f=  companyService.del(id); 
	          if(f){
	              response.setContentType("text/html;charset=utf-8");
	  			response.getWriter().print(1);  
	          }else{
	              response.setContentType("text/html;charset=utf-8");
	  			response.getWriter().print(0);
	          }

	       }catch(Exception e){  
	    	   e.printStackTrace();
				response.setContentType("text/html;charset=utf-8");
				try {
					response.getWriter().print(0);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
	       }  
	}
	
	@RequestMapping(value = "/goAllCompany")
	public ModelAndView  goAllCompany(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
    	view.setViewName("companys/famouseCompanys");
		return view;
	}
	
	@RequestMapping(value = "/goCompanyInfo")
	public ModelAndView  goCompanyInfo(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
    	view.setViewName("user/comInfo");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateByUserId", method = RequestMethod.POST)
	public void updateByUserId(Company  com,HttpServletResponse response){
		 String message = "";  
	       try{  
	           companyService.updateByUserId(com);  
	           response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(1);
	       }catch(Exception e){  
	    	   e.printStackTrace();
				response.setContentType("text/html;charset=utf-8");
				try {
					response.getWriter().print(0);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
	       }  
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateCompanyInfo")
	public String updateCompanyInfo(Company  com){
		boolean flag=companyService.updateCompany(com);
		
		if(flag){
			//允许注册
			return "1";
		}else{
			//不允许注册
			return "0";
		}

		
	}

	
}
