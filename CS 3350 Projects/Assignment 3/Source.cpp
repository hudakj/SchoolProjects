#include <iostream>
#include <stack>
#include <string>
#include <cstdlib>

using namespace std;

// Function to evaluate a postfix expression
int evaluator(string expr) {
    stack<int> s;
    for (char c : expr) {
        if (isdigit(c)) {
            s.push(c - '0');
        }
        
        else {
            int op2 = s.top();
            s.pop();
            int op1 = s.top();
            s.pop();
            switch (c) {
            case '+': s.push(op1 + op2); break;
            case '-': s.push(op1 - op2); break;
            case '*': s.push(op1 * op2); break;
            case '/': s.push(op1 / op2); break;
            default: break;
            }
        }
    }
    return s.top();
}

int main() {
    string expr = "";
    cout << "Enter a postfix expression (use -1 to exit):" << endl;
    while (true) {
        string input;
        cin >> input;
        if (input == "-1") {
            break;
        }
        expr += input;
    }
    cout << expr << " =" << endl;
    int result = evaluator(expr);
    cout << result << endl;
    return 0;
}