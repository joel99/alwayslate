import java.io.*;
import java.util.*;

public class Exercise {
    
    protected String _name;
    protected int _reps;
    protected PImage image;
    
    public Exercise(String filename, int reps){
	BufferedReader br= new BufferedReader(new FileReader("../Exercises/" + filename + ".txt"));
	image = loadImage("../ExerciseImages/" + filename + ".png");
	_reps = reps;
    }
}
