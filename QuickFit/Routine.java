import java.util.*;
import java.io.*;
import java.util.Queue;

public class Routine {
    
    private Queue<Exercise> _exercises;
    private String _name;

    public Routine(String filename) throws FileNotFoundException, IOException{
	BufferedReader br = new BufferedReader(new FileReader("../Routines/" + filename + ".txt"));
	_name = br.readLine();
	int numExercises = Integer.parseInt(br.readLine());
	_exercises = new LinkedList<>();
	for (int i = 0 ; i < numExercises; i++) {
	    StringTokenizer st = new StringTokenizer(br.readLine());
	    String exName = st.nextToken();
	    int reps = Integer.parseInt(st.nextToken());
	    _exercises.add(new Exercise(exName, reps));
	}
    }
    
    
    
}