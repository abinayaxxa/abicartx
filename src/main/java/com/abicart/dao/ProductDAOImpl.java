package com.abicart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.abicart.model.Product;
import com.abicart.util.DBConnection;

public class ProductDAOImpl implements ProductDAO{

    public boolean addProduct(Product product){
        String sql="INSERT INTO PRODUCTS(SELLER_ID,NAME,DESCRIPTION,CATEGORY,PRICE,STOCK) VALUES(?,?,?,?,?,?)";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setInt(1,product.getSellerId());
            ps.setString(2,product.getName());
            ps.setString(3,product.getDescription());
            ps.setString(4,product.getCategory());
            ps.setBigDecimal(5,product.getPrice());
            ps.setInt(6,product.getStock());

            return ps.executeUpdate()>0;

        }catch(SQLException e){
            e.printStackTrace();
        }

        return false;
    }

    public List<Product> getAllProducts(){
        List<Product> products=new ArrayList<>();

        String sql="SELECT * FROM PRODUCTS ORDER BY ID DESC";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery()){

            while(rs.next()){
                products.add(mapProduct(rs));
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return products;
    }

    public List<Product> getProductsBySeller(int sellerId){
        List<Product> products=new ArrayList<>();

        String sql="SELECT * FROM PRODUCTS WHERE SELLER_ID=? ORDER BY ID DESC";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setInt(1,sellerId);

            try(ResultSet rs=ps.executeQuery()){
                while(rs.next()){
                    products.add(mapProduct(rs));
                }
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return products;
    }

    public Product getProductById(int id){
        String sql="SELECT * FROM PRODUCTS WHERE ID=?";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setInt(1,id);

            try(ResultSet rs=ps.executeQuery()){
                if(rs.next()){
                    return mapProduct(rs);
                }
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        return null;
    }

    public boolean updateProduct(Product product){
        String sql="UPDATE PRODUCTS SET NAME=?,DESCRIPTION=?,CATEGORY=?,PRICE=?,STOCK=? WHERE ID=? AND SELLER_ID=?";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setString(1,product.getName());
            ps.setString(2,product.getDescription());
            ps.setString(3,product.getCategory());
            ps.setBigDecimal(4,product.getPrice());
            ps.setInt(5,product.getStock());
            ps.setInt(6,product.getId());
            ps.setInt(7,product.getSellerId());

            return ps.executeUpdate()>0;

        }catch(SQLException e){
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteProduct(int id){
        String sql="DELETE FROM PRODUCTS WHERE ID=?";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setInt(1,id);

            return ps.executeUpdate()>0;

        }catch(SQLException e){
            e.printStackTrace();
        }

        return false;
    }

    private Product mapProduct(ResultSet rs)throws SQLException{
        Product product=new Product();

        product.setId(rs.getInt("ID"));
        product.setSellerId(rs.getInt("SELLER_ID"));
        product.setName(rs.getString("NAME"));
        product.setDescription(rs.getString("DESCRIPTION"));
        product.setCategory(rs.getString("CATEGORY"));
        product.setPrice(rs.getBigDecimal("PRICE"));
        product.setStock(rs.getInt("STOCK"));

        return product;
    }
}