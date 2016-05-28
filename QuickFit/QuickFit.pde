import java.io.*;
import java.util.*;
   
    
    private Exercise currEx;
    

    public static void main(String[] args){

    }
   
    public void setup() {
      try{
      size(800, 600);
      currEx = new Exercise("pushup", 10);
      }
      catch(Exception e){
      System.out.println("lol");
      }
    }

    public void draw(){
        PImage image = loadImage("../ExerciseImages/" + currEx._name + ".png");
        image(image, 0, 0);
    }