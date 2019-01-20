# TODO: complete this class

class PaginationHelper
  attr_reader :collection, :items_per_page

    # The constructor takes in an array of items and a integer indicating how many
    # items fit within a single page
    def initialize(collection, items_per_page)
      @collection = collection
      @items_per_page = items_per_page
    end

    # returns the number of items within the entire collection
    def item_count
      @collection.size
    end

    # returns the number of pages
    def page_count
      (item_count.to_f / items_per_page).ceil
    end

    # returns the number of items on the current page. page_index is zero based.
    # this method should return -1 for page_index values that are out of range
    def page_item_count(page_index)
      index = collection[page_index * items_per_page...page_index *  items_per_page + items_per_page]
      index ? index.size : - 1
    end

    # determines what page an item is on. Zero based indexes.
    # this method should return -1 for item_index values that are out of range
    def page_index(item_index)
      return -1 unless (0...item_count).include? item_index
      page = item_index / items_per_page
    end
  end


helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
helper.page_count # should == 2
helper.item_count # should == 6
helper.page_item_count(0)  # should == 4
helper.page_item_count(1) # last page - should == 2
helper.page_item_count(2) # should == -1 since the page is invalid

# # page_ndex takes an item index and returns the page that it belongs on
helper.page_index(5) # should == 1 (zero based index)
helper.page_index(2) # should == 0
helper.page_index(20) # should == -1
helper.page_index(-10) # should == -1 because negative indexes are invalid


puts helper = PaginationHelper.new((1..24).to_a, 10)
puts helper.page_count # should == 3
puts helper.item_count # should == 24
puts '----'
puts helper.page_item_count(1)  # should == 10
puts helper.page_item_count(23) # last page - should == 3
puts helper.page_item_count(24) # should == -1 since the page is invalid
puts '----'

# # page_ndex takes an item index and returns the page that it belongs on
puts helper.page_index(23) # should == 1 (zero based index)
puts helper.page_index(24) # should == 0
puts helper.page_index(25) # should == -1
puts helper.page_index(-10) # should == -1 because negative indexes are invalid
