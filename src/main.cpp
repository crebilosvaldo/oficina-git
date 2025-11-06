#include "../include/Greeter.h"

int main() {
    
    string minhaArte = R"(
       /\_/\  
      ( o.o ) 
       > ^ <
    )";
    
    string meuNome = "Crebilosvaldo";
    string meuTitulo = "Redditor";
    string meuContato = "github.com/crebilosvaldo";
    string meuHobby = "Moderar Discord";

    string minhaCor = Color::Yellow;

    ProfileGreeter Greeter(meuNome, meuTitulo, meuContato, minhaArte, minhaCor, meuHobby);
    
    Greeter.clear();
    Greeter.print();
    getchar();    
    return 0;
}
