//implement MyBag. h here
#include "ArrayBag.h"

template<class ItemType>
class MyBag : public ArrayBag<ItemType>
{
public:
    bool removeAll(const ItemType& anEntry);

private:
    static const int DEFAULT_CAPACITY = 6; // Small size to test for a full bag
    ItemType items[DEFAULT_CAPACITY];      // Array of bag items
    int itemCount;                         // Current count of bag items 
    int maxItems;
};
