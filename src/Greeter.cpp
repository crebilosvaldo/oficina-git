#include "../include/Greeter.h"

const string Color::Reset = "\033[0m";
const string Color::Red = "\033[31m";
const string Color::Green = "\033[32m";
const string Color::Yellow = "\033[33m";
const string Color::Blue = "\033[34m";
const string Color::Cyan = "\033[36m";
const string Color::Bold = "\033[1m";


ProfileGreeter::ProfileGreeter(
    const string& name,
    const string& title,
    const string& contact,
    const string& art,
    const string& color,
    const string& hobby)
    : profileName(name), title(title), contactInfo(contact), asciiArt(art), artColor(color), hobby(hobby) {
}

void ProfileGreeter::print() {
    cout << Color::Blue << "==========================================================" << Color::Reset << endl;
    
    cout << artColor << asciiArt << Color::Reset << endl;
    
    cout << Color::Bold << Color::Yellow << "  " << profileName << Color::Reset << endl;
    cout << Color::Cyan << "  " << title << Color::Reset << endl;
    cout << Color::Green << "  " << hobby << Color::Reset << endl;
    cout << "  " << contactInfo << endl;

    cout << Color::Blue << "==========================================================" << Color::Reset << endl;
}

void ProfileGreeter::clear() {
  #ifdef _WIN32
    system("cls");
  #else
    system("clear");
  #endif
}
