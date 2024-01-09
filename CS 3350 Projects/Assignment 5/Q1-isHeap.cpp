#include <iostream>
#include <vector>
#include <queue>
using namespace std;

// Data structure to store a binary tree node
struct Node
{
    int data;
    Node* left, * right;

    Node(int data)
    {
        this->data = data;
        this->left = this->right = nullptr;
    }
};

// Function to check if a given binary tree is a min-heap or not
bool isHeap(Node* root)
{
    if (root == nullptr) { //if there is only one node in a tree, then that means there is a mini heap because it's the only node in the tree.
        return true;      //there are no other nodes that exist that are smaller than the root.
    }

    queue <Node*> q;     // create queue for traversal of tree
    q.push(root);

    bool result = false;

    while (!q.empty()) {

        Node* temp = q.front();
        q.pop();

        if (temp->left) {
            if (result == true || temp->data > temp->left->data) { // if result is true, it means we have already encountered a nullptr child and the tree isn't complete
                return false;                                      // also checks if mini heap rules are broken
                q.push(temp->right);
            }
            else {
                result = true;
            }
         
        }
    }
    // once the while loop ends, it means we have traversed all nodes and we can decide if this is a mini heap or not.
    return result;
}
    



int main()
{
    /* Construct the following tree
               2
             /   \
            /     \
           3       4
          / \     / \
         /   \   /   \
        5     6 8    10
    */

    Node* root = new Node(2);
    root->left = new Node(3);
    root->right = new Node(4);
    root->left->left = new Node(5);
    root->left->right = new Node(6);
    root->right->left = new Node(8);
    root->right->right = new Node(10);

    if (isHeap(root)) {
        cout << "The given binary tree is a min-heap";
    }
    else {
        cout << "The given binary tree is not a min-heap";
    }

    return 0;
}
