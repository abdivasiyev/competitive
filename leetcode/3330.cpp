#include <string>
#include <iostream>

using namespace std;

class Solution {
public:
  int possibleStringCount(string word) {
      int count = 0;
      int result = 1;

      for (int i=0; i<word.size()-1; i++) {
          if (word[i] != word[i+1]) {
              result += count;
              count = 0;
          } else {
              count++;
          }
      }
      return result+count;
  }
};

int main() {
    Solution solution;

    cout << solution.possibleStringCount("abbcccc") << endl;
    cout << solution.possibleStringCount("abcd") << endl;
    cout << solution.possibleStringCount("aaaa") << endl;
}
