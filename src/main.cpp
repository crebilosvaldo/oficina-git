#include "../include/Greeter.h"

int main() {
    
    string minhaArte = R"GREETER(
       /\_/\  
      ( o.o ) 
       > ^ <
    )GREETER";
    
    string meuNome = "Foobar";
    string meuTitulo = "Foobar Developer";
    string meuContato = "github.com/foobar";

    string minhaCor = Color::Green;

    
    ProfileGreeter Greeter(meuNome, meuTitulo, meuContato, minhaArte, minhaCor);
    
    Greeter.clear();
    Greeter.print();
    
    return 0;
}
