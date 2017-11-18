#include<iostream>
#include<stdlib.h>
#include<string.h>
#include<vector>
#include<sstream>

using namespace std;


int main()
{
  string hold,key;
  int key_size;
  vector<string> input;
  vector<string> output;
  unsigned int i,j = 0;

  cout<<"Enter key size between 5 and 10: ";
  cin>>key_size;

  while(key_size < 5 || key_size > 10)
    {
      cout<<"Enter key size between 5 and 10: ";
      cin>>key_size;
    }
  
  cin.clear();
  cin.ignore(10000, '\n');

  for(i = 0; i < key_size; i++)
    {
      cout<<"Enter a key containing 0 to key size -1: ";
      char c;
      cin>>c;
      key += c;
      cout<<key<<endl;
    }
  
  cin.clear();
  cin.ignore(10000, '\n');

  cout<<"Enter plaintext: ";
  getline(cin,hold);

  cout<<hold<<endl;

  for(i = 0; i < hold.length(); i+=key_size)
    {
      output.push_back(hold.substr(i,key_size));
      input.push_back(hold.substr(i,key_size));
    }


  for(i = 0; i < input.size(); i++)              // Print out input
    cout<<"input: ["<<input[i]<<"]"<<endl;  

  for(j = 0; j < input.size(); j++)              // Swapping logic
    for(i = 0; i < key_size; i++)
      {
	int buf = key[i]-48;
	output[j][i] = input[j][buf];
      }

  cout<<endl;
  for(i = 0; i < output.size(); i++)             // Display cipher
    cout<<output[i];
 
  cout<<endl;

  return 0;
}
