# Instruction for Task 1

A new Flutter application.

1. Make sure you have flutter, Dart and Android Studio installed.

2. Clone flutter(command : git clone https://github.com/flutter/flutter)

3. Add flutter to path

4. clone flutter repo using the command "git clone <https://github.com/khansabih/BigText.git>"

5. add flutter to path

6. run "flutter run --release"


# Solution for Task 2
java
//Error code
import java.io.*;
import java.util.*;
class Bobble{
	public static void main(String args[]) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		ArrayList<Integer> list = new ArrayList<Integer>();
		List<String> myList = new ArrayList<String>();
		myList.add("1");
		myList.add("2");
		myList.add("3");
		myList.add("4");
		myList.add("5");
		Iterator<String> it = myList.iterator();
		while (it.hasNext()) {
			String value = it.next();
			System.out.println("List Value:" + value);
			if (value.equals("3"))
				myList.remove(value);
		}
		// System.out.println(list);
	}
}
  //Error rectification code
import java.io.*;
import java.util.*;
class Bobble{
	public static void main(String args[]) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		ArrayList<Integer> list = new ArrayList<Integer>();
		List<String> myList = new ArrayList<String>();
		myList.add("1");
		myList.add("2");
		myList.add("3");
		myList.add("4");
		myList.add("5");
		//Convert the list to an array
		String a[] = new String[myList.size()];
		for(int i=0;i<myList.size();i++){
			a[i] = myList.get(i);
		}
		int n = a.length;
		for(int i=0;i<n;i++){
			System.out.println("value = "+a[i]);
			if(a[i].equals("3")){
				for(int j=i;j<n-1;j++){
					a[j] = a[j+1];
				}
				n=n-1;
			}
		}
		//Display the list
		//Put the elements in the list
		myList = new ArrayList<String>();
		for(int i=0;i<n;i++){
			myList.add(a[i]);
		}
		// Display the list
		System.out.println(myList);
	}
}
                          
  
