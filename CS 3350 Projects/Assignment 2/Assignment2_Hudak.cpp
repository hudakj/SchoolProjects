
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

void bubbleSort(vector<string>& passwords, int passwordSize, int& comparisons, int& movements) {
	
	vector<string> sortedPasswords = passwords;

	for (int i = 0; i < passwordSize - 1; i++) {
		for (int j = 0; j < passwordSize - i - 1; j++) {
			comparisons++;
			if (sortedPasswords[j] > sortedPasswords[j + 1]) {
				movements += 3;
				swap(sortedPasswords[j], sortedPasswords[j + 1]);
				
			}
		}
	}
}

void selectionSort(vector <string> &passwords, int passwordSize) {
	vector<string> sortedPasswords = passwords;
	int numComparisons = 0;
	int numMovements = 0;
	
	for (int i = 0; i < passwordSize - 1; i++) {
		// Find index of smallest remaining element
		int indexSmallest = i;
		numComparisons++;
		for (int j = i + 1; j < passwordSize; j++) {
			if (sortedPasswords[j] < sortedPasswords[indexSmallest]) {
				indexSmallest = j;
			}
		}

		
		// Swap numbers[i] and numbers[indexSmallest]
		if (indexSmallest != i) {
			string temp = sortedPasswords[i];
			sortedPasswords[i] = sortedPasswords[indexSmallest];
			sortedPasswords[indexSmallest] = temp;
			numMovements += 3;
		}
	}
	cout << "Selection sort:\n";
	cout << "Number of comparisons: " << numComparisons << endl;
	cout << "Number of movements: " << numMovements << endl;
}

void insertionSort(vector <string>& passwords, int passwordSize) {
	vector<string> sortedPasswords = passwords;
	int numComparisons = 0;
	int numMovements = 0;
	
	for (int i = 1; i < passwordSize; i++) {
		int j = i;
		numComparisons++;
		while (j > 0 && sortedPasswords[j] < sortedPasswords[j - 1]) {
			// Swap numbers[j] and numbers [j - 1]
			string temp = sortedPasswords[j];
			sortedPasswords[j] = sortedPasswords[j - 1];
			sortedPasswords[j - 1] = temp;
			j--;
			numMovements += 3;
		}
	}
	cout << "Insertion sort:\n";
	cout << "Number of comparisons: " << numComparisons << endl;
	cout << "Number of movements: " << numMovements << endl;
}
void Merge(vector<string>& passwords, int leftFirst, int leftLast, int rightLast, int& comparisons, int& movements) {
	vector<string> sortedPasswords = passwords;
	int mergedSize = rightLast - leftFirst + 1;  // Size of merged partition
	string* mergedPasswords = new string[mergedSize];  // Dynamically allocates temporary
	// array for merged numbers
	int mergePos = 0;  // Position to insert merged number
	int leftPos = leftFirst;  // Initialize left partition position
	int rightPos = leftLast + 1;  // Initialize right partition position

	// Add smallest element from left or right partition to merged numbers
	while (leftPos <= leftLast && rightPos <= rightLast) {
		comparisons++;
		if (passwords[leftPos] <= passwords[rightPos]) {
			mergedPasswords[mergePos] = passwords[leftPos];
			leftPos++;
		}
		else {
			mergedPasswords[mergePos] = passwords[rightPos];
			rightPos++;
		}
		mergePos++;
		movements++;
	}

	// If left partition is not empty, add remaining elements to merged numbers
	while (leftPos <= leftLast) {
		mergedPasswords[mergePos] = passwords[leftPos];
		leftPos++;
		mergePos++;
		movements++;
	}

	// If right partition is not empty, add remaining elements to merged numbers
	while (rightPos <= rightLast) {
		mergedPasswords[mergePos] = passwords[rightPos];
		rightPos++;
		mergePos++;
		movements++;
	}

	// Copy merged numbers back to numbers
	for (mergePos = 0; mergePos < mergedSize; mergePos++) {
		passwords[leftFirst + mergePos] = mergedPasswords[mergePos];
		movements++;
	}

	// Free temporary array
	delete[] mergedPasswords;
}
void MergeSort(vector<string>& passwords, int startIndex, int endIndex, int& comparisons, int& movements) {
	vector<string> sortedPasswords = passwords;
	if (startIndex < endIndex) {

		// Find the midpoint in the partition
		int mid = (startIndex + endIndex) / 2;

		// Recursively sort left and right partitions
		MergeSort(sortedPasswords, startIndex, mid, comparisons, movements);
		MergeSort(sortedPasswords, mid + 1, endIndex, comparisons, movements);

		// Merge left and right partition in sorted order
		Merge(sortedPasswords, startIndex, mid, endIndex, comparisons, movements);
	}
}

		// If low and high have crossed each other, the loop
 void Merge(vector <string>& passwords, int leftFirst, int leftLast, int rightLast) {
	vector<string> sortedPasswords = passwords;
	int mergedSize = rightLast - leftFirst + 1;       // Size of merged partition
	string* mergedPasswords = new string[mergedSize]; // Dynamically allocates temporary
	// array for merged numbers
	int mergePos = 0;                         // Position to insert merged number
	int leftPos = leftFirst;                  // Initialize left partition position
	int rightPos = leftLast + 1;              // Initialize right partition position

	// Add smallest element from left or right partition to merged numbers
	while (leftPos <= leftLast && rightPos <= rightLast) {
		if (passwords[leftPos] <= passwords[rightPos]) {
			mergedPasswords[mergePos] = passwords[leftPos];
			leftPos++;
		}
		else {
			mergedPasswords[mergePos] = passwords[rightPos];
			rightPos++;
		}
		mergePos++;
	}

	// If left partition is not empty, add remaining elements to merged numbers
	while (leftPos <= leftLast) {
		mergedPasswords[mergePos] = passwords[leftPos];
		leftPos++;
		mergePos++;
	}

	// If right partition is not empty, add remaining elements to merged numbers
	while (rightPos <= rightLast) {
		mergedPasswords[mergePos] = passwords[rightPos];
		rightPos++;
		mergePos++;
	}

	// Copy merged numbers back to numbers
	for (mergePos = 0; mergePos < mergedSize; mergePos++) {
		passwords[leftFirst + mergePos] = mergedPasswords[mergePos];
	}

	// Free temporary array
	delete[] mergedPasswords;
}
 int medianOfThree(vector<string>& arr, int left, int right) {
	 int mid = left + (right - left) / 2;
	 if (arr[left] > arr[mid]) {
		 swap(arr[left], arr[mid]);
	 }
	 if (arr[mid] > arr[right]) {
		 swap(arr[mid], arr[right]);
	 }
	 if (arr[left] > arr[mid]) {
		 swap(arr[left], arr[mid]);
	 }
	 return mid;
 }

 // Quicksort algorithm
 void quicksort(vector<string>& arr, int left, int right, int& comparisons, int& movements) {
	 if (left < right) {
		 // Choose pivot using median-of-three method
		 int pivotIndex = medianOfThree(arr, left, right);
		 string pivotValue = arr[pivotIndex];

		 // Move pivot to the end of the array
		 swap(arr[pivotIndex], arr[right]);
		 movements += 3;

		 // Partition the array
		 int i = left;
		 for (int j = left; j < right; j++) {
			 if (arr[j] < pivotValue) {
				 swap(arr[i], arr[j]);
				 i++;
				 movements += 3;
			 }
			 comparisons++;
		 }
		 swap(arr[i], arr[right]);
		 movements += 3;

		 // Recursively sort the left and right subarrays
		 quicksort(arr, left, i - 1, comparisons, movements);
		 quicksort(arr, i + 1, right, comparisons, movements);
	 }
 }

int main() {
	// Open the input file
	ifstream input("Passwords.txt");
	if (!input) {
		std::cerr << "Error opening file" << std::endl;
		return 1;
	}

	// Read passwords from the input file into a vector
	vector<string> passwords;
	string password;
	while (input >> password) {
		passwords.push_back(password);
	}

	// Call each sorting algorithm and print the number of comparisons and movements
	int comparisons = 0;
	int movements = 0;
	vector<string> sorted_passwords;

	
	sorted_passwords = passwords;
	bubbleSort(sorted_passwords, sorted_passwords.size(), comparisons, movements);
	cout << "Bubble sort:" << std::endl;
	cout << "Number of comparisons: " << comparisons << std::endl;
	cout << "Number of movements: " << movements << std::endl;

	comparisons = movements = 0;
	sorted_passwords = passwords;
	selectionSort(sorted_passwords, sorted_passwords.size());
	
	comparisons = movements = 0;
	sorted_passwords = passwords;
	insertionSort(sorted_passwords, sorted_passwords.size());
	

	comparisons = movements = 0;
	sorted_passwords = passwords;
	MergeSort(sorted_passwords, 0, sorted_passwords.size() - 1, comparisons, movements);
	cout << "Merge sort:" << std::endl;
	cout << "Number of comparisons: " << comparisons << std::endl;
	cout << "Number of movements: " << movements << std::endl;

	comparisons = movements = 0;
	sorted_passwords = passwords;
	quicksort(passwords, 0, sorted_passwords.size() - 1, comparisons, movements);
	std::cout << "Quick sort:" << std::endl;
	std::cout << "Number of comparisons: " << comparisons << std::endl;
	std::cout << "Number of movements: " << movements << std::endl;
	
	return 0;
}