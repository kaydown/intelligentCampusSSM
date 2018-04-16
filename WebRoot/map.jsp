<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta name="viewport" content="width=device-width,initial-scale=1"
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>百度地图API自定义地图</title>
    <!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=txBof1Frr3CHBN5kARHXGlRA"></script>
  </head>
  
  <body>
    <!--百度地图容器-->
    <div style="width:1000px;height:700px;border:#ccc solid 1px;font-size:12px" id="map"></div>
  </body>
  <script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
      map = new BMap.Map("map"); 
      map.centerAndZoom(new BMap.Point(117.131522,39.067633),17);
    }
    function setMapEvent(){
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
      var markers = [
        {content:"<a href='<%=basePath%>news/findNewsAll?type=2'>公寓信息</a>",title:"学生公寓",imageOffset: {width:-46,height:-21},position:{lat:39.065392,lng:117.12818}},
        {content:"<a href='<%=basePath%>food/findFoodAll?date=${curdate}'>今日菜谱</a>",title:"食堂",imageOffset: {width:-23,height:-21},position:{lat:39.06923,lng:117.129258}},
        {content:"<a href='<%=basePath%>news/findNewsAll?type=1'>校园信息</a>",title:"教学楼",imageOffset: {width:0,height:3},position:{lat:39.066639,lng:117.134702}}
      ];
      for(var index = 0; index < markers.length; index++ ){
        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(40,45),{
          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
        })});
        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(50,10)});
        var opts = {
          width: 400,
          title: markers[index].title,
          enableMessage: false
        };
        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
        marker.setLabel(label);
        addClickHandler(marker,infoWindow);
        map.addOverlay(marker);
      };
    }
    //向地图添加控件
    function addMapControl(){
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT,type:1});
      map.addControl(navControl);
    }
    var map;
      initMap();
  </script>
</html>