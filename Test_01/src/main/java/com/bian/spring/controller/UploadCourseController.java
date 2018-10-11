package com.bian.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;
import com.bian.spring.entites.Course;
import com.bian.spring.entites.FirstCourse;
import com.bian.spring.entites.Video;
import com.bian.spring.service.LessonsServices;
import com.bian.spring.util.FileHandler;
import com.bian.spring.util.JsonMsg;
import com.bian.spring.util.VideoUploadAliYun;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("/upload")
@Controller
public class UploadCourseController {

	@Autowired
	private LessonsServices lessonsServices;

	@Value("#{config['key']}")
	private  String KEY;

	@Value("#{config['value']}")
	private String VALUE;

	@Autowired
	private FileHandler fileHandler;

	@Autowired
	private VideoUploadAliYun videoUpload;

	@ResponseBody
	@RequestMapping("/selectCourse")
	public JsonMsg selectCourse(){
		List <FirstCourse> list  = lessonsServices.getAllCourse();
		System.out.println("firstCourse=="+list);
		if(list !=null){
			return JsonMsg.success().addInfo("msg", list);
		}	
		return JsonMsg.fail();
	}

	/**
	 * 获取视频课程
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getVideoCourse")
	public JsonMsg getVideoCourse(){
		List<Course> list = lessonsServices.getVideoCourse();
		System.out.println("first"+list);
		if(list != null){
			return JsonMsg.success().addInfo("msg", list);
		}
		return JsonMsg.fail();
	}
	
	/**
	 * 获取已经有了视频的课程
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getVideoCourse1")
	public JsonMsg getVideoCourse1(){
		List<Course> list = lessonsServices.getVideoCourse1();
		System.out.println("first"+list);
		if(list != null){
			return JsonMsg.success().addInfo("msg", list);
		}
		return JsonMsg.fail();
	}

	/**
	 * 上传视频给阿里云
	 * @param request
	 * @param file
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="/uploadVideo",method=RequestMethod.POST)
	public JsonMsg uploadVideo(HttpServletRequest request,@RequestParam("video.vId") MultipartFile file) throws IOException{
		String vName = request.getParameter("video.vName");
		String vDesc = request.getParameter("video.vDesc");
		Integer cId = Integer.parseInt( request.getParameter("cId") );
		String fileName = file.getOriginalFilename();
		Video video = new Video();
		video.setvDesc(vDesc);
		video.setvName(vName);
		video.setcId(cId);
		video.setvName(fileName);

		System.out.println(KEY+"==="+VALUE);

		String videoId = VideoUploadAliYun.testUploadStream(KEY, VALUE, vName, fileName,file.getInputStream());
		System.out.println("上传视频生成videoID："+videoId);
		System.out.println(video);
		int n = (int) (file.getSize() / 1024);

		try {
			Thread.sleep(n*4000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//跳转到视频播放页面
		String playURL= null;
		DefaultAcsClient client = VideoUploadAliYun.initVodClient(KEY, VALUE);
		GetPlayInfoResponse responsePlay =  new GetPlayInfoResponse();
		try {
			responsePlay = VideoUploadAliYun.getPlayInfo(client,videoId);
			List<GetPlayInfoResponse.PlayInfo> playInfoList = responsePlay.getPlayInfoList();
			//播放地址
			for (GetPlayInfoResponse.PlayInfo playInfo : playInfoList) {
				System.out.print("PlayInfo.PlayURL = " + playInfo.getPlayURL() + "\n");
				playURL=playInfo.getPlayURL();
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		if(playURL != null){
			video.setvId(playURL);
			int count = lessonsServices.insertVideoId(video);
			if( count > 0 ){
				return JsonMsg.success().addInfo("msg", "视频上传成功");
			}
			return JsonMsg.fail().addInfo("msg", "添加数据库失败!");
		}
		return JsonMsg.fail();
	}


	/***
	 * 添加课程
	 * @param file
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/test",method=RequestMethod.POST)
	public JsonMsg test(@RequestParam("cImg")MultipartFile file,HttpServletRequest request){
		String cName = request.getParameter("cName");
		String cTeacher =request.getParameter("cTeacher");
		Integer sId = Integer.parseInt( request.getParameter("sId"));
		String cType = request.getParameter("cType");
		String cContent = request.getParameter("cContent");
		Course course = new Course();
		course.setcName(cName);
		course.setcTeacher(cTeacher);
		course.setsId(sId);
		course.setcContent(cContent);
		course.setcType(cType);
		String fileName = file.getOriginalFilename();
		String cImg = UUID.randomUUID().toString().substring(0,10)+String.valueOf(System.currentTimeMillis());
		String imageSaveFilePath = request.getServletContext().getRealPath("/img");
		if(file.getSize()<=0){
			return JsonMsg.fail().addInfo("msg", "选择的文件不能为空");
		}
		if(fileName.endsWith(".png")||fileName.endsWith(".jpg")||fileName.endsWith(".gif")){
			if(!new File(imageSaveFilePath).exists()){
				if(!new File(imageSaveFilePath).isDirectory()){
					new File(imageSaveFilePath).mkdir();
				}
			}
			System.out.println("路径:"+imageSaveFilePath);
			course.setcImg(cImg);
			System.out.println("ccc===="+course);
			try {
				int count = lessonsServices.addLesson(course);
				File ServletFile = new File(imageSaveFilePath,cImg+".jpg");
				File localFile = new File("E:\\workspace\\Test_01\\WebContent\\img",cImg+".jpg");
				if(count > 0){
					file.transferTo(ServletFile);
					System.out.println( fileHandler.copyFile(ServletFile, localFile) == true ?"文件复制成功" : "文件复制失败" );
					//response.setContentType("application/json;charset=utf-8");
					return JsonMsg.success().addInfo("msg", "成功添加到数据库中");
				}
				return JsonMsg.fail().addInfo("msg", "数据库添加失败");
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			return JsonMsg.fail().addInfo("msg", "文件格式不正确");
		}
		return JsonMsg.success();

		//System.out.println("文件的原名是:"+file.getOriginalFilename());
	}

	/**
	 * 根据返回查询的课程和video所有内容
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCourseByCId")
	public JsonMsg getCourseByCId(HttpServletRequest request){
		Integer cId = Integer.parseInt( request.getParameter("cId"));
		if(cId != null){
			Course course = lessonsServices.getCourseByCId(cId);
			System.out.println(course);
			if(course != null){
				return JsonMsg.success().addInfo("msg",course);
			}
		}
		return JsonMsg.fail();
	}


	@ResponseBody
	@RequestMapping("/updateInfo")
	public JsonMsg updateInfo(HttpServletRequest request,
			@RequestParam(value="vId",required=false) MultipartFile vId,
			@RequestParam(value="cImg",required=false) MultipartFile cImg) throws Exception{
		String cType = request.getParameter("cType");
		String cName = request.getParameter("cName");
		String cContent = request.getParameter("cContent");
		String cTeacher = request.getParameter("cTeacher");
		Integer cId = Integer.parseInt( request.getParameter("cId"));
		Integer sId = Integer.parseInt( request.getParameter("sId"));


		String cImgFileName = UUID.randomUUID().toString().substring(0,10)+String.valueOf(System.currentTimeMillis());

		String videoName = null;
		String videoId = null;
		String playURL= null;
		String cImgFileN = null;

		if(vId != null){
			videoName = vId.getOriginalFilename();
			System.out.println(videoName);
			System.out.println(vId.getOriginalFilename().endsWith(".ogg"));
			if( vId.getOriginalFilename().endsWith(".rmvb") || vId.getOriginalFilename().endsWith(".mp4") ||vId.getOriginalFilename().endsWith(".ogg") ||vId.getOriginalFilename().endsWith(".avi") ){
				videoId = VideoUploadAliYun.testUploadStream(KEY, VALUE, cName, vId.getOriginalFilename(),vId.getInputStream());
				System.out.println("上传视频生成videoID："+videoId);
				System.out.println(videoId);

				//跳转到视频播放页面
				DefaultAcsClient client = VideoUploadAliYun.initVodClient(KEY, VALUE);
				GetPlayInfoResponse responsePlay =  new GetPlayInfoResponse();
				responsePlay = VideoUploadAliYun.getPlayInfo(client,videoId);

				List<GetPlayInfoResponse.PlayInfo> playInfoList = responsePlay.getPlayInfoList();
				//播放地址
				for (GetPlayInfoResponse.PlayInfo playInfo : playInfoList) {
					System.out.print("PlayInfo.PlayURL = " + playInfo.getPlayURL() + "\n");
					playURL=playInfo.getPlayURL();
				}
			}else{
				return JsonMsg.fail().addInfo("msg", "上传的文件格式不正确");
			}
			
		}
		String imageSaveFilePath = request.getServletContext().getRealPath("/img");
		if(!new File(imageSaveFilePath).exists()){
			if(!new File(imageSaveFilePath).isDirectory()){
				new File(imageSaveFilePath).mkdir();
			}
		}

		if(cImg != null){
			System.out.println("上传的图片是:"+cImg.getOriginalFilename());
			
			if(cImg.getOriginalFilename().endsWith(".jpg")|| cImg.getOriginalFilename().endsWith(".png")||cImg.getOriginalFilename().endsWith(".gif")){
				 cImgFileN = cImgFileName;
			}else{
				return JsonMsg.fail().addInfo("msg","图片格式不正确");
			}
		}



		Video video = new Video(cId, null , playURL, null, videoName);
		File ServletFile = new File(imageSaveFilePath,cImg+".jpg");
		File localFile = new File("E:\\workspace\\Test_01\\WebContent\\img",cImg+".jpg");
		Course c = new Course(cId, cName, cTeacher, cType, sId, cImgFileN, cContent, null);
		boolean count1  = lessonsServices.updateCourseByCid(c) ;
		boolean count2 = false;
		
		//图片不为空
		if(cImg != null){
			if(count1){
				cImg.transferTo(ServletFile);
				System.out.println( fileHandler.copyFile(ServletFile, localFile) == true ?"文件复制成功" : "文件复制失败" );
			}
		}
		
		//视频不为空
		if( vId != null){
			count2 = lessonsServices.updateVideoByCid(video);
		}
		
		//两者皆为空
		if(cImg == null && vId == null){
			if(count1 ){
				return JsonMsg.success().addInfo("msg", "成功添加到数据库中");
			}
		}
		
		if(count1 && count2){
			return JsonMsg.success().addInfo("msg", "成功添加到数据库中");
		}
		return JsonMsg.fail().addInfo("msg", "数据库添加失败");
	}


	/*	@RequestMapping("/playVideo")
	public String playVideo(@RequestParam("videoId") String videoId,Map<String, Object> map){
		//跳转到视频播放页面
		String playURL="";
   	    DefaultAcsClient client = VideoUploadAliYun.initVodClient(KEY, VALUE);
   	    GetPlayInfoResponse responsePlay =  new GetPlayInfoResponse();
   	    try {
			responsePlay = VideoUploadAliYun.getPlayInfo(client,videoId);

			List<GetPlayInfoResponse.PlayInfo> playInfoList = responsePlay.getPlayInfoList();
	        //播放地址
	        for (GetPlayInfoResponse.PlayInfo playInfo : playInfoList) {
	            System.out.print("PlayInfo.PlayURL = " + playInfo.getPlayURL() + "\n");
	            playURL=playInfo.getPlayURL();
	        }

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 */



	/**
	 * 初始化页面
	 * @param map
	 * @return
	 */
	@RequestMapping("/onload")
	public String onload(Map<String, Object> map){
		List<Course> courses = lessonsServices.getRandomLesson();
		System.out.println(courses);
		if(courses != null && courses.size() > 0){
			map.put("c", (Object) courses);
		}
		return "left";
	}

	@ResponseBody
	@RequestMapping("/onFirstLoad")
	public JsonMsg onFirstLoad(){
		List<Course> courses = lessonsServices.getRandomLesson();
		System.out.println(courses);
		if(courses != null && courses.size() > 0){
			return JsonMsg.fail();
		}
		return JsonMsg.success();
	}




	/**
	 * 查询第二课表的内容
	 * @param pageNo
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/search")
	public String search(@RequestParam(value="pageNo",defaultValue="1")Integer pageNo ,HttpServletRequest request,Map<String,Object> map){

		String clause = request.getParameter("clause");
		System.out.println("clause="+clause);
		List<Course> list = lessonsServices.getCourseByName("%"+clause+"%");
		for(Course c:list){
			System.out.println(c.getVideo());
		}

		PageHelper.startPage(pageNo, 6);
		List<Course> courses = lessonsServices.getCourseByName("%"+clause+"%");
		PageInfo<Course> pageInfo = new PageInfo<>(courses,5);
		int[] navigatePages = pageInfo.getNavigatepageNums();
		map.put("course", courses);
		map.put("pageInfo", pageInfo);
		map.put("navigatePageNum", navigatePages);
		map.put("navigatePageLength", navigatePages.length);
		map.put("clause", clause);
		System.out.println("course====="+courses);
		System.out.println("map:"+map);

		return "left";//user_index
		/*	return JsonMsg.success().addInfo("course", courses)
				                 .addInfo("pageInfo", pageInfo)
				                 .addInfo("navigatePageNum", navigatePages)
				                 .addInfo("clause", clause);*/
	}


	@RequestMapping("/searchBySecondLesson")
	public String searchBySecondLesson(@RequestParam(value="sId",defaultValue="1001") Integer sId,
			@RequestParam(value="pageNo",defaultValue="1",required=false)Integer pageNo,
			Map<String,Object> map){
		PageHelper.startPage(pageNo, 6);
		List<Course> courses = lessonsServices.getCourseBySecondLesson(sId);
		System.out.println(pageNo+"\t" + sId);
		PageInfo<Course> pageInfo = new PageInfo<>(courses,5);
		int[] navigatePages = pageInfo.getNavigatepageNums();
		map.put("course", courses);
		map.put("pageInfo", pageInfo);
		map.put("navigatePageNum", navigatePages);
		map.put("navigatePageLength", navigatePages.length);
		System.out.println("course====="+courses);
		System.out.println("map:"+map);
		return "left";//user_index
	}


	@RequestMapping("/getRandomLesson")
	public String getRandomLesson(Map<String, Object> map){
		List<Course> courses = lessonsServices.getRandomLesson();
		map.put("course",courses);
		return "left";
	}


	/**
	 * 播放Video 
	 * @param vId
	 * @param map
	 * @return
	 */
	@RequestMapping("/testVideo")
	public String testVideo(@RequestParam(value="cId",required=false)Integer vId,Map<String, Object> map){
		Course course = lessonsServices.getVideoInfo(vId);
		map.put("course", course);
		System.out.println(course);
		return "playVideo";
	}





	/* @ResponseBody
	    @RequestMapping(value="/resetEmpsInfo",method=RequestMethod.POST)
	    public JsonMsg resetEmpsInfo(@RequestParam(value="pageNo",defaultValue="1")Integer pn,Map<String,Object> map){
	    	PageHelper.startPage(pn, 8);
	    	List<Employee> emps = employeeService.getEmpsAll();
	    	PageInfo<Employee> pageInfo = new PageInfo<>(emps,5);
	    	int[] navigatePages = pageInfo.getNavigatepageNums();
	    	//pages
	    	map.put("emps", emps);
	    	map.put("pageInfo", pageInfo);
	    	map.put("navigatePageNum", navigatePages);
	    	map.put("navigatePageLength", navigatePages.length);

	    	return JsonMsg.success().addInfo("msg", map);
	    }*/












}
