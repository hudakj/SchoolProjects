// Jake Hudak
// CS 3350, Dr.Li
// Assignment 4
// This program uses various functions to find the number of nodes in a bt, the height of a bt,
// checks if the bt is complete, converts bt tree int a bst. 

#include <iostream>
using namespace std;
//Include any library that you would like to use here
#include <queue>
#include <vector>
#include <algorithm>


// Data structure to store a binary tree node
struct Node
{
    int key;
    Node* left, * right;

    Node(int key)
    {
        this->key = key;
        this->left = this->right = nullptr;
    }
};

//if you need any helper functions, write them here:
void inorderTraversal(Node* root, std::vector<int>& keys) {
    if (root == nullptr) {
        return;
    }

    inorderTraversal(root->left, keys);
    keys.push_back(root->key);
    inorderTraversal(root->right, keys);
}

void replaceNodes(Node* root, const std::vector<int>& keys, int& index) {
    if (root == nullptr) {
        return;
    }

    replaceNodes(root->left, keys, index);
    root->key = keys[index++];
    replaceNodes(root->right, keys, index);
}

//function to print every node's key using inorder traversal
void inorder(Node* root) {

    if (root==nullptr) {
        return;
    }
    else {
        inorder(root->left);
        cout << root->key << " ";
        inorder(root->right);
    }
        
}

//  function to calculate the height of a binary tree
int height(Node* root){
   if (root == nullptr) {
        return -1; // An empty tree has height -1
   }
    return 1 + max(height(root->left), height(root->right)); // Height of the tree is 1 + maximum height of left and right subtrees
}  
// Function to calculate the number of nodes in a binary search tree
int size(Node* root) {
    if (root == nullptr) {
        return 0; // An empty tree has 0 nodes
    }
    return 1 + size(root->left) + size(root->right); // Total number of nodes is 1 + number of nodes in left subtree + number of nodes in right subtree
}
    // TODO 3: return a bool value: if the tree is complete, return 1 (True); otherwise, return 0 (false)
bool isComplete(Node* root) {
    if (root == nullptr) {
        return true;
    }

    bool flag = false;
    queue <Node*> q;
    q.push(root);

    while (!q.empty()) {
        Node* current = q.front();
        q.pop();

        if (current->left != nullptr) {
            if (flag) {
                return false;
            }
            q.push(current->left);
        } else {
            flag = true;
        }

        if (current->right != nullptr) {
            if (flag) {
                return false;
            }
            q.push(current->right);
        } else {
            flag = true;
        }
    }

    return true;
}

//  function to convert the binary tree to a binary search tree, but maintaining its structure 
void convert_BST(Node* root) {
    //TODO 4: convert the binary tree to a binary search tree, but maintaining its structure 
        std::vector<int> keys;
        inorderTraversal(root, keys);

        std::sort(keys.begin(), keys.end());

        int index = 0;
        replaceNodes(root, keys, index);
    }

int main()
{
    /* Construct the following tree
              1
            /   \               
           2     3
            \   / \
             5 6   7                      
    */

    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);
    root->left->right = new Node(5);
    root->right->left = new Node(6);
    root->right->right = new Node(7);

    cout << "Printing all nodes with inorder traversal:" << endl;
    inorder(root);
    cout << endl;

    cout << "The size of the tree is " << size(root) <<endl;

    cout << "The height of the tree is " << height(root) << endl;

    if (isComplete(root)) {
        cout << "The tree is a complete binary tree" << endl;
    }
    else {
        cout << "The tree is not a complete binary tree" << endl;
    }

    convert_BST(root);

    cout << "Printing all nodes with inorder traversal after the conversion:" << endl;
    inorder(root);
    cout << endl;

    return 0;
}