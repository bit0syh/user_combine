/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.41
 * Generated at: 2019-08-01 06:25:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.event;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class movieTicketing_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/D:/project_bbb/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MovieProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1564550655296L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("<title>영화 시간 보기</title>\r\n");
      out.write("\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("/* All Device - 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨.*/\r\n");
      out.write("\r\n");
      out.write("/* Mobile Device - 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */\r\n");
      out.write("\r\n");
      out.write("/* Tablet &amp; Desktop Device - 사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다.*/\r\n");
      out.write("@media all and (min-width:768px) {\r\n");
      out.write("\t.select-wrap {\r\n");
      out.write("\t\tdisplay: flex;\r\n");
      out.write("\t\talign-items: center;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style {\r\n");
      out.write("\t\tborder: 1px solid #ccc;\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t\theight: 300px;\r\n");
      out.write("\t\tborder-radius: 3px;\r\n");
      out.write("\t\toverflow: auto;\r\n");
      out.write("\t\tbackground: #fafafa;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style select {\r\n");
      out.write("\t\tpadding: 5px 8px;\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t\tborder: none;\r\n");
      out.write("\t\tbox-shadow: none;\r\n");
      out.write("\t\tbackground: transparent;\r\n");
      out.write("\t\t-webkit-appearance: none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style select:focus {\r\n");
      out.write("\t\toutline: none;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* Tablet Device -  사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */\r\n");
      out.write("@media all and (min-width:768px) and (max-width:1024px) {\r\n");
      out.write("\t.select-wrap {\r\n");
      out.write("\t\tdisplay: flex;\r\n");
      out.write("\t\talign-items: center;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style {\r\n");
      out.write("\t\tborder: 1px solid #ccc;\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t\theight: 300px;\r\n");
      out.write("\t\tborder-radius: 3px;\r\n");
      out.write("\t\toverflow: auto;\r\n");
      out.write("\t\tbackground: #fafafa;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style select {\r\n");
      out.write("\t\tpadding: 5px 8px;\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t\tborder: none;\r\n");
      out.write("\t\tbox-shadow: none;\r\n");
      out.write("\t\tbackground: transparent;\r\n");
      out.write("\t\t-webkit-appearance: none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style select:focus {\r\n");
      out.write("\t\toutline: none;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* Desktop Device  - 사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다.*/\r\n");
      out.write("@media all and (min-width:1025px) {\r\n");
      out.write("\t.select-wrap {\r\n");
      out.write("\t\tdisplay: flex;\r\n");
      out.write("\t\talign-items: center;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style {\r\n");
      out.write("\t\tborder: 1px solid #ccc;\r\n");
      out.write("\t\twidth: 30%;\r\n");
      out.write("\t\theight: 300px;\r\n");
      out.write("\t\tborder-radius: 3px;\r\n");
      out.write("\t\toverflow: auto;\r\n");
      out.write("\t\tbackground: #fafafa;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style select {\r\n");
      out.write("\t\tpadding: 5px 8px;\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t\tborder: none;\r\n");
      out.write("\t\tbox-shadow: none;\r\n");
      out.write("\t\tbackground: transparent;\r\n");
      out.write("\t\t-webkit-appearance: none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.select-style select:focus {\r\n");
      out.write("\t\toutline: none;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tfunction selectCinema() {\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar CGV = [ \"강남\", \"서초\", \"인천\" ];\r\n");
      out.write("\t\t\tvar LOTTECINEMA = [ \"강남\", \"서초\", \"인천\", \"서울역\" ];\r\n");
      out.write("\t\t\tvar MEGABOX = [ \"종로\", \"서초\", \"강남\", \"강변\" ];\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar selectItem = $(\"#select1\").val();\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar changeItem;\r\n");
      out.write("\r\n");
      out.write("\t\t\tif (selectItem == \"CGV\") {\r\n");
      out.write("\t\t\t\tchangeItem = CGV;\r\n");
      out.write("\t\t\t} else if (selectItem == \"롯데시네마\") {\r\n");
      out.write("\t\t\t\tchangeItem = LOTTECINEMA;\r\n");
      out.write("\t\t\t} else if (selectItem == \"메가박스\") {\r\n");
      out.write("\t\t\t\tchangeItem = MEGABOX;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t$('#select2').empty();\r\n");
      out.write("\r\n");
      out.write("\t\t\tfor (var count = 0; count < changeItem.length; count++) {\r\n");
      out.write("\t\t\t\tvar option = $(\"<option>\" + selectItem + \" \"\r\n");
      out.write("\t\t\t\t\t\t+ changeItem[count] + \"</option>\");\r\n");
      out.write("\t\t\t\t$('#select2').append(option);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tfunction selectMovieroom() {\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar CGV = [ \"1관\", \"2관\", \"3관\" ];\r\n");
      out.write("\t\t\tvar LOTTECINEMA = [ \"강남\", \"서초\", \"인천\", \"서울역\" ];\r\n");
      out.write("\t\t\tvar MEGABOX = [ \"종로\", \"서초\", \"강남\", \"강변\" ];\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar selectItem = $(\"#select1\").val();\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar changeItem;\r\n");
      out.write("\r\n");
      out.write("\t\t\tif (selectItem == \"CGV\") {\r\n");
      out.write("\t\t\t\tchangeItem = CGV;\r\n");
      out.write("\t\t\t} else if (selectItem == \"롯데시네마\") {\r\n");
      out.write("\t\t\t\tchangeItem = LOTTECINEMA;\r\n");
      out.write("\t\t\t} else if (selectItem == \"메가박스\") {\r\n");
      out.write("\t\t\t\tchangeItem = MEGABOX;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t$('#select3').empty();\r\n");
      out.write("\r\n");
      out.write("\t\t\tfor (var count = 0; count < changeItem.length; count++) {\r\n");
      out.write("\t\t\t\tvar option = $(\"<option>\" + changeItem[count] + \"</option>\");\r\n");
      out.write("\t\t\t\t$('#select3').append(option);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"select-wrap\">\r\n");
      out.write("\t\t<div class=\"select-style\">\r\n");
      out.write("\t\t\t<select id=\"select1\" onchange=\"selectCinema()\" multiple>\r\n");
      out.write("\t\t\t\t<option>CGV</option>\r\n");
      out.write("\t\t\t\t<option>롯데시네마</option>\r\n");
      out.write("\t\t\t\t<option>메가박스</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"select-style\">\r\n");
      out.write("\t\t\t<select id=\"select2\" onchange=\"selectMovieroom()\" multiple>\r\n");
      out.write("\t\t\t\t<option>영화사를</option>\r\n");
      out.write("\t\t\t\t<option>선택해주세요</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"select-style\">\r\n");
      out.write("\t\t\t<select id=\"select3\" multiple>\r\n");
      out.write("\t\t\t\t<option>영화관을</option>\r\n");
      out.write("\t\t\t\t<option>선택해주세요</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
