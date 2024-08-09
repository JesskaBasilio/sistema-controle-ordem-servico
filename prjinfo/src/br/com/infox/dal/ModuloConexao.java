/*
 * The MIT License
 *
 * Copyright 2024 jessica-pc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package br.com.infox.dal;

import java.sql.*;

/**
 * Conecção com o Banco de Dados
 *
 * @author jessica-pc
 */
public class ModuloConexao {

    /**
     * método responsável com a conecção cm o Banco
     *
     * @return conecção
     */
    // método responsável por estabelecer a conexão com o banco
    public static Connection conector() {
        //usando o pacote java.sql e o framework Connection para criar uma variável
        Connection conexao = null;
        //carregando o driver correspondente ao tipo de banco de dados, o driver precisa estar na biblioteca
        String driver = "com.mysql.cj.jdbc.Driver";
        // armazenando informações referentes ao banco de dados
        String url = "jdbc:mysql://localhost:3306/dbinfox?characterEncoding=utf-8";
        String user = "dba";
        String password = "sucesso0123*";
        //estabelecendo a conexao com o banco de dados
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            //a linha abaixo serve de apoio para esclarecer o erro
            System.out.println(e);
            return null;
        }
    }
}
