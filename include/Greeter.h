#ifndef GREETER_H
#define GREETER_H
#include <iostream>
#include <string>
using namespace std;

struct Color {
    static const string Reset;
    static const string Red;
    static const string Green;
    static const string Yellow;
    static const string Blue;
    static const string Cyan;
    static const string Bold;
};


class ProfileGreeter {
private:
    string profileName;
    string title;
    string contactInfo;
    string asciiArt;
    string artColor;
    string hobby;

public:
    ProfileGreeter(
        const string& name,
        const string& title,
        const string& contact,
        const string& art,
        const string& color = Color::Yellow,
        const string& hobby = "Sem Hobby"
    );

    void print();
    void clear();
};

#endif
