package com.superkin.tcams.common.utils;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyFileUploadAndDownloadUtils {

    //上传
    public static File upload(MultipartFile myfiles, String path){

        if(path==null){
            path="F:\\upload\\";

        }

        if(myfiles.getSize()>0){
            //获取文件名    hello.doc
            String filename = myfiles.getOriginalFilename();
            //获取后缀名
            String suffixName=filename.substring(filename.lastIndexOf("."));
            //获取当前时间
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String time=simpleDateFormat.format(new Date());
            //获取4位随机数  0.0000000012132131
            String number=String.valueOf(Math.random()).substring(4,8);
            String newFileName=time+number+suffixName;
            String realPath=path+newFileName;
            //创建一个文件对象
            File file=new File(realPath);
            try {
                myfiles.transferTo(file);//把源数据myfile通过IO工具类写到file文件
                return file;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }else{
            System.out.println("文件为空");
            return null;
        }
    }




    //文件下载
    public static ResponseEntity<byte[]> download(String fileName, String path) throws IOException {
        //找到要下载的文件
        if(path==null){
            path="F:\\upload\\";
            //path="/upload/";
        }
        File file=new File(path+fileName);
        if (!file.isFile()){
            return null;
        }
        //使用IO提供的工具把文件信息读取到byte[]里面
        byte[] bytes = FileUtils.readFileToByteArray(file);
        //转码文件名用于弹框显示
        String newName=new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
        //创建响应头
        HttpHeaders headers=new HttpHeaders();
        //设置弹框
        headers.setContentDispositionFormData("attachment",newName);
        //设置文件下载的方式  以流的方式下载，可以实现下载任何格式的文件
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //创建一个响应对象
        ResponseEntity<byte[]> entity=new ResponseEntity<>(bytes,headers, HttpStatus.OK);
        return entity;
    }





}
