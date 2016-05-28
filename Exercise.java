import java.io.*;
import java.util.*;

public class Exercise {
    
    private String _name;
    private int _reps;
    //private Image image;
    
    public Exercise(String filename, int reps){
	BufferedReader br= new BufferedReader(new FileReader("../Exercises/" + fileName + ".txt"));
	_reps = reps;
    }
    
    
    
}
