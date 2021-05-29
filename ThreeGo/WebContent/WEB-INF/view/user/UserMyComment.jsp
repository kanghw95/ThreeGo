<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글 조회</title>
<style>
#mycomment{
  clear: both;
   width: 420;
   padding-top: 20;
}
#tablemargin {
margin : auto;
width : 400px;
box-sizing: border-box;
table-layout: fixed;
white-space:nowrap; 
text-overflow:ellipsis; 
   overflow:hidden;
}
#tablemargin td{
padding : 3px 3px;
}
.nounderline{
border : 0px;
}
.com1{
width: 60px;
  
}
.col2{
width:200px;
   
}
.col2{
width:140px;
   
}
#mycomment td{
white-space:nowrap;  
   overflow:hidden;
   text-overflow:ellipsis; 
}
</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<div id="mycomment" style="margin: 0 auto;">
<%User user = (User) session.getAttribute("user"); %>
   <h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold; margin-left: 15px;">작성 댓글 조회</h3><br>

      <form action="<%=request.getContextPath() %>/commentlist" method="get"> 

   <div id="comments">
   
   </div>
      
   <script>
   let p = 1;
   getComments();
   // 로딩되면 일단 comment 일어오기
   function getComments(){
      console.log(p);
      p = (p > 0) ? p : 1;
      $.ajax({
         url: "<%=request.getContextPath()%>/usermycomment",
         type : "POST" ,   // get방식을 쓰고..
         data : {
            user_no : <%=user.getUser_no()%>,
            pageNum : p
            // ${pageNum} 없네요. 임시로 1
            // 여기 ajax 로 가는게 더 좋아 보임.
         },
         
         dataType : "json",
         
         success:function(data){
           
                  p = data.currentPage;

            console.log(data);
            var htmltags=""
            var List = data.List;
            $.each(List, function(i,list){
                   htmltags += "<table id='tablemargin'><tr class='nounderline'>"
            
                htmltags += "<td class='com1'>"+ List[i].com_writer + "</td>";
                     htmltags += "<td class='com2'>"+ List[i].com_contents+ "</td>";
                     htmltags += "<td class='com3'>"+ List[i].rv_date+ "</td>"; 
               
               $("#comments").append(htmltags);
                 htmltags += "</tr></table>"; 
            });
            if(htmltags==""){
               htmltags += "<div> 댓글이 없습니다. </div>";
            }
            $("#comments").html(htmltags);
            
            var htmlpagingtags="";
            if(data.startPage != 1) {
               var pre = data.startPage-1;
               htmlpagingtags += "<a href='commentlist?pageNum="+pre+"'>이전</a>";
            }
            for(var i=data.startPage; i<=data.endPage; i++){
               htmlpagingtags += "<a href='commentlist?pageNum="+i+"'>"+i+"</a>";
            }
            if(data.endPage < data.pageCnt ) {
               var pro = data.endPage+1;
               htmlpagingtags += "<a href='commentlist?pageNum="+pro+"'>이후</a>";
            }
            $("#page_content").html(htmlpagingtags);

         },
         error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }         
       });
   }
   
   </script>
   </form>
   
   <br>
   <div id="page_content">
   </div>
   
   
   </div>
</body>
</html>