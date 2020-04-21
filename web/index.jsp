<%-- 
    Document   : index
    Created on : 16-abr-2020, 16:04:05
    Author     : Sergio
--%>

<%@page import="models.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="index.jsp">
            <input type="text" name="nombre"/>
            <input type="submit" value="Añadir"/>
        </form>
        <form action="logout.jsp">
            <input type="submit" value="Cerrar sesión">
        </form>
        <%
            ArrayList<Producto> ListaElementos = (ArrayList<Producto>) session.getAttribute("misElementos");
            if (ListaElementos == null) {
                ListaElementos = new ArrayList<Producto>();
                session.setAttribute("misElementos", ListaElementos);
            }

            if (request.getParameter("nombre") != null) {
                boolean flag = false;
                String texto = "";
                for (Producto elem : ListaElementos) {
                    if (request.getParameter("nombre").equals(elem.getNombre())) {
                        flag = true;
                    }
                }
                if (!flag) {
                    ListaElementos.add(new Producto(request.getParameter("nombre"), 1));
                } else {
                    for(Producto elem : ListaElementos){
                        if(request.getParameter("nombre").equals(elem.getNombre())){
                            elem.setCantidad(elem.getCantidad() + 1);
                        }
                    }
                }
            }
            for (Producto elem : ListaElementos) {
                out.print(elem.getNombre() + " " + elem.getCantidad() + "<br>");
            }
        %>
    </body>
</html>
