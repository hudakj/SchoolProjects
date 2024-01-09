#include <iostream>
#include <vector>
#include <queue>
using namespace std;

// Function to find the k'th largest element in an array using min-heap
int findKthLargest(vector<int> const& ints, int k)
{
    priority_queue<int, vector<int>, greater <int>> miniHeap;

    for (int num : ints) {
        // add current number to miniHeap
        miniHeap.push(num);

        // we want the miniHeap to be smaller than K because then we know when we have reacher the kth largest node.  
        if (miniHeap.size() > k) {
            miniHeap.pop();
        }
    }
    return miniHeap.top(); // want to return the top of the mini heap because all of the numbers we popped are smaller than it.
}                         //Therefore, the root of the miniheap has to be the correct number.  

int main()
{
    vector<int> ints = { 7, 4, 6, 3, 9, 1 };
    int k = 3;

    cout << "k'th largest array element is " << findKthLargest(ints, k);

    return 0;
}