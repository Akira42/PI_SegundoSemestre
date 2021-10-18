<%-- 
    Document   : buscarCliente
    Created on : 15/10/2021, 16:15:40
    Author     : Andrew
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:import url="../uteis/header.jsp"/>

    <head>
        <title>Buscar Clientes</title>
        <script type="text/javascript">

        </script>
    </head>
    <body class="container">
        <div class="bg">

            <div>
                <h1>Clientes</h1>
                <form action="BuscarClienteServlet" method="GET">
                    <c:if test="${not empty clienteBusca}">
                        <input type="hidden" name="ope" value="1"/>
                    </c:if>
                        <input type="text" name="nomeCliente" value="${clienteBusca.nomeUsuario}" placeholder="Nome"
                            required class="form-control"/><br/> 
                    <button type="submit" class="btn btn-primary">Buscar</button><br/>
                </form>
                
                <table  class="table">
                <thead>
                    <td>Nome</td><td>Email</td><td>CPF</td>
                </thead>
                <tbody>
                    <c:forEach var="cliente" items="${listaClientes}">
                        <tr>
                            <td>${cliente.nome}</td>
                            <td>${cliente.email}</td>
                            <td>${cliente.cpf}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/index.jsp"><button class="btn btn-primary back">Voltar</button></a>
        </div>
    </div>
</body>
</html>