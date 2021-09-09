/*
Program by: Alan Murphy 
Module: Algorithm & Data Structures
Date: 02/04/2021
*/

// Simple weighted graph representation 
// Uses an Adjacency Linked Lists, suitable for sparse graphs

import java.io.*;
import java.util.*;


class GraphLists {
    class Node {
        public int vert;
        public int wgt;
        public Node next;
    }
    
    // V = number of vertices
    // E = number of edges
    // adj[] is the adjacency lists array
    private int V, E;
    private Node[] adj;
    private Node z;
    private int[] mst;
    
    // used for traversing graph
    private int[] visited;
    int id;
    
    
    // default constructor
    public GraphLists(String graphFile)  throws IOException
    {
        int u, v;
        int e, wgt;
        Node t;

        FileReader fr = new FileReader(graphFile);
		BufferedReader reader = new BufferedReader(fr);
	           
        String splits = " +";  // multiple whitespace as delimiter
		String line = reader.readLine();        
        String[] parts = line.split(splits);
        System.out.println("Parts[] = " + parts[0] + " " + parts[1]);
        
        V = Integer.parseInt(parts[0]);
        E = Integer.parseInt(parts[1]);
        
        // create sentinel node
        z = new Node(); 
        z.next = z;
        
        // create adjacency lists, initialised to sentinel node z    
		visited = new int[V+1];
        adj = new Node[V+1];  
        for(v = 1; v <= V; ++v)
            adj[v] = z;               
        
       // read the edges
        System.out.println("Reading edges from text file");
        for(e = 1; e <= E; ++e)
        {
            line = reader.readLine();
            parts = line.split(splits);
            u = Integer.parseInt(parts[0]);
            v = Integer.parseInt(parts[1]); 
            wgt = Integer.parseInt(parts[2]);
            
            System.out.println("Edge " + toChar(u) + "--(" + wgt + ")--" + toChar(v));    
            
            // write code to put edge into adjacency matrix
			t = adj[u];
			adj[u] = new Node();
			adj[u].vert = v;
            adj[u].wgt = wgt;
            adj[u].next = t;
			
			t = adj[v];
            adj[v] = new Node();
            adj[v].vert = u;
            adj[v].wgt = wgt;
            adj[v].next = t;
			
        }	       
    }
   
    // convert vertex into char for pretty printing
    private char toChar(int u)
    {  
        return (char)(u + 64);
    }
    
    // method to display the graph representation
    public void display() {
        int v;
        Node n;
        
        for(v=1; v<=V; ++v){
            System.out.print("\nadj[" + toChar(v) + "] ->" );
            for(n = adj[v]; n != z; n = n.next) 
                System.out.print(" |" + toChar(n.vert) + " | " + n.wgt + "| ->");    
        }
        System.out.println("");
    }


    
	public void MST_Prim(int s)
	{
        int v;
        int wgt, wgt_sum = 0;
        int[]  dist, parent, hPos;
        Node t;

        //code here
		dist = new int[V + 1];
		hPos = new int [V + 1];
		parent = new int [V + 1];
	
		for (int i = 1; i <= V; i++){
			
		dist[i] = Integer.MAX_VALUE;
		parent[s] = 0;
		hPos[s] = 0;
		
		}
		
        dist[s] = 0;
		parent[s] = 0;
        
        Heap pq =  new Heap(V, dist, hPos);
        pq.insert(s);
		
		System.out.println("");
		System.out.println("ADDING TO MST");
        
        while (!(pq.isEmpty()))  
        {
            // most of alg here
			v = pq.remove();
			dist[v] = -dist[v];
			Node u = adj[v];
			
			
			System.out.println("Adding to MST edge " + toChar(parent[v]) + "---(" + dist[v] + "---)" + toChar(v));
			while (u != z)
			{
				
				
				if (u.wgt < dist[u.vert])
				{
					dist[u.vert] = u.wgt;
					parent[u.vert] = v;
					
					if(hPos[u.vert] == 0)
						pq.insert(u.vert);
					else
						pq.siftUp(hPos[u.vert]);
					
				}
			u = u.next;
			}
            
        }
		for(int distance : dist)
			wgt_sum += Math.abs(distance);
			//wgt_sum += dist[v];
		
        System.out.print("\n\nWeight of MST = " + wgt_sum + "\n");
        
        mst = parent;

	}
    
    public void showMST()
    {
            System.out.print("\n\nMinimum Spanning tree parent array is:\n");
            for(int v = 1; v <= V; ++v)
                System.out.println(toChar(v) + " -> " + toChar(mst[v]));
            System.out.println("");
    }
	

	
	// method to initialise Depth First Traversal of Graph
    public void DF( int s) 
    {
		System.out.println("Depth First Search");
        id = 0;

        for(int v = 1; v <= V; v++)
            visited[v] = 0;

        dfVisit(0,s);
    }


    // Recursive Depth First Traversal 
    private void dfVisit( int prev, int v)
    {
		int u;
		
        visited[v] = ++id;
        
		System.out.print("\nDFS just visited vertex " + toChar(v) + " along " + toChar(prev) + "--" + toChar(v) );

        for (u = 1; u <= V; u++)
        {
            if (visited[u] == 0 && adj[u].wgt != 0)
                dfVisit(v,u);
        }   
		
    }
	
	/*public void DF_iter(int s){
        n = new node();
        n.insert(s);
        int u, v;

        for(v=1; v<=V; ++v) 
            visited[v] = 0;

        while(! n.isEmpty()){
            v = n.remove();
            if(visited[v] == 0) {
                visited[v] = ++id;
                System.out.print("\n  DF just visited vertex " + toChar(v));

                for(u=1; u<=V; ++u)
                    if(adj[v] != 0 && visited[u] == 0)
                      n.insert(u);
            }

        }
	}*/

	public void BFS ()
	{
		
	}		


}

public class PrimLists {
    public static void main(String[] args) throws IOException
    {
		Scanner keyboard = new Scanner(System.in);
    	System.out.println("What is the name of the file ");
    	String filename = keyboard.nextLine();
		File file = new File (filename);
		Scanner inputFile = new Scanner(file);
    	System.out.println("What is the starting vertice");
        int s = Integer.parseInt(keyboard.nextLine());
		
        //int s = 12;
        //String filename = "wGraph1.txt";               

        GraphLists g = new GraphLists(filename);
       
        g.display();             
        
        g.MST_Prim(s);
        
        g.showMST(); 

		g.DF(s);
		
		//g.BFS(s);
        
        //g.DF_iter(s);
        
    }
    
    
}


/*

Heap Code for efficient implementationofPrim's Alg

*/

class Heap
{
    private int[] a;	   // heap array
    private int[] hPos;	   // hPos[h[k]] == k
    private int[] dist;    // dist[v] = priority of v

    private int N;         // heap size
   
    // The heap constructor gets passed from the Graph:
    //    1. maximum heap size
    //    2. reference to the dist[] array
    //    3. reference to the hPos[] array
    public Heap(int maxSize, int[] _dist, int[] _hPos) 
    {
        N = 0;
        a = new int[maxSize + 1];
        dist = _dist;
        hPos = _hPos;
		a[0] = 0;
		dist[0] = 0;
    }


    public boolean isEmpty() 
    {
        return N == 0;
    }

	
    public void siftUp( int k) 
    {
        int v = a[k];

        // code yourself
        // must use hPos[] and dist[] arrays
		//move up 
		while (dist[v] < dist[a[k/2]] && k != 0)
		{
			//parent vertex now child vertex position
			a[k] = a[k/2];
			//hPos is now added
			hPos[a[k]] = k;
			//childs index is now the parents index
			k = k/2;
		}
		//The position of the vertex is now added
		a[k] = v;
		//The index is now updated to hPos
		hPos[v] = k;
    }


	
	//sort heap nodes
    public void siftDown( int k) 
    {
        int v, j;
       
        v = a[k];  
        
        // code yourself 
        // must use hPos[] and dist[] arrays
		while(k <= N/2)
		{
			j = 2 * k;
			//is the node greater than the left node
			if (j > N && dist[a[j]] > dist[a[j+1]]) 
			{
				++j;
			}
			//is parent less than child	
			if (dist[v] <= dist [a[j]]) break;
			//child is given parent pos
			a[k] = a [j];
			//update position of last child
			hPos[a[k]] = k;
			//asign a new vertex pos
			k = j;
		}
		//assign vertex
		a[k] = v;
		//update vertex is hPos
		hPos[v] = k;
		
    }

	//add a node
    public void insert( int x) 
    {
        a[++N] = x;
        siftUp( N);
    }

	//remove a node
    public int remove() 
    {   
        int v = a[1];
        hPos[v] = 0; // v is no longer in heap        
        
        a[N+1] = 0;  // put null node into empty spot
		
		a[1] = a[N--];
        siftDown(1);
        
        return v;
    }

}

