<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.Scanner"%>


<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Daily Update</title>
      <link rel="stylesheet" type="text/css" href="content.css">
        
    </head>
  <body>
    <jsp:include page="nav.jsp" />

    <%
      String  filename=request.getParameter("id");
      out.println("<header><h2>Daily Work Update Of "+filename+"</header></h2>");
      
      String jspPath = "C:\\Users\\Lenovo\\Desktop\\Project folder\\";
      String txtFilePath = jspPath + filename+".txt";
      
      BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
      
      StringBuilder sidenav = new StringBuilder();
      StringBuilder main = new StringBuilder();
      sidenav.append("<nav><ul>");
      main.append("<main>");
      
      int count = 1;
      String line;
      while((line = reader.readLine())!= null){
      
        String[] words = line.split(" ", 2);

        if(words[0].equals("date")){
          main.append("<section><p class=\"date\">Date: " + words[1] + "</p></section>");
        }

        else if(words[0].equals("heading")){
          sidenav.append("<li><a href=\"#section-"+ count +"\" class >"+ words[1] +"</a></li>");
          main.append("<section id=\"section-"+ count + "\"><h1>" + words[1] + "</h1>");
          main.append("</section>");
          count++;
        }

        else if(words[0].equals("code_path")){
          File file= new File(words[1]);
          Scanner sc = new Scanner(file); 
          main.append("<p1 class=\"code\">");
          while (sc.hasNextLine()) {
            String s=sc.nextLine();
            s = s.replaceAll("\t", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            s = s.replaceAll(" ", "&nbsp;&nbsp;");
            main.append(s+"</br>");
          } 
          main.append("</p1>");
          sc.close();
        }

        else if(words[0].equals("pic_path")){
          main.append("<img src=\""+words[1]+"\" alt=\"MyPic\" width=\"auto\" height=\"auto\">");
        }
        else{
          main.append("<p >" + line + "</p>");
        }

      }
      sidenav.append("</nav></ul>");
      main.append("</section></main>");
      out.println(sidenav.toString());
      out.println(main.toString());
      reader.close();
    %>
           
    <script>
      let mainNavLinks = document.querySelectorAll("nav ul li a");
      let mainsections = document.querySelectorAll("main section");
      let lastId;
      let cur = [];
      window.addEventListener("scroll", event => {let fromTop = window.scrollY;
      mainNavLinks.forEach(link => {let section = document.querySelector(link.hash);

        if (section.offsetTop <= fromTop && section.offsetTop + section.offsetHeight > fromTop) {
          link.classList.add("current");
        } 
        else {
          link.classList.remove("current");
        }
      });});
    </script>

    <footer>
        copy ABHA ;2020 Footer
    </footer>
  </body>
</html>
