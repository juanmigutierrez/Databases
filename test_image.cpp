

#include<iostream>
#include<fstream>
using namespace std;

int main(int argc, char *argv[])
{
	//Open an input and output stream in binary mode
	ifstream in("imagen.png",ios::binary);
	ofstream out("imagen_copia.png",ios::binary);

	if(in.is_open() && out.is_open())
	{
		while(!in.eof())
		{
			out.put(in.get());
		}
	}

	//Close both files
	in.close();
	out.close();
}

