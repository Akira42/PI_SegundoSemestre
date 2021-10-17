/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrew
 */
@WebServlet(name = "BuscarClienteServlet", urlPatterns = {"/BuscarClienteServlet"})
public class BuscarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nomeBusca = request.getParameter("nomeCliente");
        String ope = request.getParameter("ope");
        
        List<Cliente> clientes = ClienteDAO.getClientePorNome(nomeBusca);
        request.setAttribute("listaClientes", clientes);
        
        // RequestDispatcher reaproveita os objetos Request e Response
        String url = "/cliente/buscarCliente.jsp";
        request.getRequestDispatcher(url).forward(request, response);
        
        //sendRedirect sempre cria um novo request/response
        //response.sendRedirect("listar.jsp");
    }

}