package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CommonController {

	/**
	 * 图片上传
	 * @param file
	 * @param fileFileName
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/uploadFile")
	public void uploadFile(
			@RequestParam(value = "file", required = false) MultipartFile file,
			String fileFileName, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("/") + "statics\\file\\";
		String[] type = file.getOriginalFilename().split("\\.");
		String fileName = new Date().getTime() + "." + type[1];
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(fileName);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	@RequestMapping("/pageJump")
	public String pageJump(@RequestParam(value = "jumpPath", required = true)String jumpPath) {
		return jumpPath;
	}


}
