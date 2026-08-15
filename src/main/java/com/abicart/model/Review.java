package com.abicart.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Review implements Serializable{
    private int id;
    private int productId;
    private int buyerId;
    private String buyerName;
    private int rating;
    private String comment;
    private String imageUrl;
    private LocalDateTime createdAt;

    public int getId(){
        return id; 
    }
    public void setId(int id){ 
        this.id=id; 
    }
    public int getProductId(){ 
        return productId; 
    }
    public void setProductId(int productId){ 
        this.productId=productId; 
    }
    public int getBuyerId(){ 
        return buyerId; 
    }
    public void setBuyerId(int buyerId){ 
        this.buyerId=buyerId; 
    }
    public String getBuyerName(){
        return buyerName; 
    }
    public void setBuyerName(String buyerName){ 
        this.buyerName=buyerName; 
    }
    public int getRating(){ 
        return rating; 
    }
    public void setRating(int rating){ 
        this.rating=rating; 
    }
    public String getComment(){ 
        return comment;
    }
    public void setComment(String comment){ 
        this.comment=comment; 
    }
    public String getImageUrl(){
        return imageUrl;
    }
    public void setImageUrl(String imageUrl){
        this.imageUrl=imageUrl;
    }
    public LocalDateTime getCreatedAt(){ 
        return createdAt; 
    }
    public void setCreatedAt(LocalDateTime createdAt){ 
        this.createdAt=createdAt; 
    }
}
