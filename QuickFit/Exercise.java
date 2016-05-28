import java.io.*;
import java.util.*;
import processing.core.*;


public class Exercise {
    
    protected String _name;
    protected int _reps;
    
    public Exercise(String filename, int reps) throws FileNotFoundException{
	    BufferedReader br= new BufferedReader(new FileReader("../Exercises/" + filename + ".txt"));
	    _reps = reps;
      _name = filename;
    }
   
    
    
    
}
