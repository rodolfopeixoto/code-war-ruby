# PaginatinHelper

For this exercise you will be strengthening your page-fu mastery. You will complete the PaginationHelper class, which is a utility class helpful for querying paging information related to an array.

The class is designed to take in an array of values and an integer indicating how many items will be allowed per each page. The types of values contained within the collection/array are not relevant.

The following are some examples of how this class is used:

```ruby
helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
helper.page_count # should == 2
helper.item_count # should == 6
helper.page_item_count(0)  # should == 4
helper.page_item_count(1) # last page - should == 2
helper.page_item_count(2) # should == -1 since the page is invalid

# page_ndex takes an item index and returns the page that it belongs on
helper.page_index(5) # should == 1 (zero based index)
helper.page_index(2) # should == 0
helper.page_index(20) # should == -1
helper.page_index(-10) # should == -1 because negative indexes are invalid
```


TDD

```ruby
  # TODO: Replace examples and use TDD development by writing your own tests
  # These are some of the methods available:
  #   Test.expect(boolean, [optional] message)
  #   Test.assert_equals(actual, expected, [optional] message)
  #   Test.assert_not_equals(actual, expected, [optional] message)
  
  describe "Solution" do
    helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
    
    it "#page_count" do
      Test.assert_equals(helper.page_count, 2)
    end
    
    it "#item_count" do
      Test.assert_equals(helper.item_count, 6)
    end
    describe '#page_item_count' do
      it "valid" do
        Test.assert_equals(helper.page_item_count(0), 4)
        Test.assert_equals(helper.page_item_count(1), 2)
      end
      it 'invalid' do
        Test.assert_equals(helper.page_item_count(2), -1)
      end
    end
    describe '#page_index' do
      Test.assert_equals(helper.page_index(5),1)
      Test.assert_equals(helper.page_index(2),0)
      Test.assert_equals(helper.page_index(20),-1)
      Test.assert_equals(helper.page_index(-10),-1)
    end
  end
```