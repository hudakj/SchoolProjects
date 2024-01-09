#include "MyBag.h"

template<class ItemType>
bool MyBag<ItemType>::removeAll(const ItemType& anEntry) {
    bool itemFound = false;
    int newLength = 0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i] != anEntry) {
            items[newLength] = items[i];
            newLength++;
        }
        else {
            itemFound = true;
        }
    }
    itemCount = newLength;
    return itemFound;
}
