package com.bian.spring.util;

import java.io.InputStream;

import org.springframework.stereotype.Component;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.DeleteVideoResponse;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoRequest;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;

@Component
public class VideoUploadAliYun {
	
	public static String testUploadStream(String accessKeyId, String accessKeySecret, String title, String fileName,
			InputStream inputStream) {
		UploadStreamRequest request = new UploadStreamRequest(accessKeyId, accessKeySecret, title, fileName,
				inputStream);
		/* 是否使用默认水印(可选)，指定模板组ID时，根据模板组配置确定是否使用默认水印 */
		// request.setShowWaterMark(true);
		/*
		 * 设置上传完成后的回调URL(可选)，建议通过点播控制台配置消息监听事件，参见文档
		 * https://help.aliyun.com/document_detail/57029.html
		 */
		// request.setCallback("http://callback.sample.com");
		/* 视频分类ID(可选) */
		// request.setCateId(0);
		/* 视频标签,多个用逗号分隔(可选) */
		// request.setTags("标签1,标签2");
		/* 视频描述(可选) */
		// request.setDescription("视频描述");
		/* 封面图片(可选) */
		// request.setCoverURL("http://cover.sample.com/sample.jpg");
		/* 模板组ID(可选) */
		// request.setTemplateGroupId("8c4792cbc8694e7084fd5330e56a33d");
		/* 存储区域(可选) */
		// request.setStorageLocation("in-201703232118266-5sejdln9o.oss-cn-shanghai.aliyuncs.com");
		UploadVideoImpl uploader = new UploadVideoImpl();
		UploadStreamResponse response = uploader.uploadStream(request);
		System.out.print("RequestId=" + response.getRequestId() + "\n"); // 请求视频点播服务的请求ID
		if (response.isSuccess()) {
			System.out.print("VideoId=" + response.getVideoId() + "\n");
		} else { // 如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因
			System.out.print("VideoId=" + response.getVideoId() + "\n");
			System.out.print("ErrorCode=" + response.getCode() + "\n");
			System.out.print("ErrorMessage=" + response.getMessage() + "\n");
		}
		
		return response.getVideoId();
	}
	
	
	 //服务类随时可以删除
    /*初始化客户端*/
    public static DefaultAcsClient initVodClient(String accessKeyId, String accessKeySecret) {
        //点播服务所在的Region，国内请填cn-shanghai，不要填写别的区域
        String regionId = "cn-shanghai";
        DefaultProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, accessKeySecret);
        DefaultAcsClient client = new DefaultAcsClient(profile);
        return client;
    }
    
    
    /*获取播放地址函数*/
    public static GetPlayInfoResponse getPlayInfo(DefaultAcsClient client,String VideoId) throws Exception {
        GetPlayInfoRequest request = new GetPlayInfoRequest();
        request.setVideoId(VideoId);
        return client.getAcsResponse(request);
    }
    
    /*删除视频函数*/
    public static DeleteVideoResponse deleteVideo(DefaultAcsClient client,String videoId) throws Exception {
        DeleteVideoRequest request = new DeleteVideoRequest();
        //多个用逗号分隔，最多支持20个
        request.setVideoIds(videoId);
        return client.getAcsResponse(request);
    }
}
