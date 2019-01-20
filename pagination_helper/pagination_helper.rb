# TODO: complete this class

class PaginationHelper

    # The constructor takes in an array of items and a integer indicating how many
    # items fit within a single page
    def initialize(collection, items_per_page)
      @collection = collection
      @items_per_page = items_per_page
    end
    
    # returns the number of items within the entire collection
    def item_count
      @collection.length
    end
      
    # returns the number of pages
    def page_count
      (item_count.to_f / @items_per_page.to_f).ceil
    end
      
    # returns the number of items on the current page. page_index is zero based.
    # this method should return -1 for page_index values that are out of range
    def page_item_count(page_index)
    
      page_item_next_to_last = (@items_per_page * (page_count - 1))
      page_item_last = item_count - page_item_next_to_last
      range_number_page = (0..(page_count - 1)).to_a
      
      return page_item_last if range_number_page[-1] == page_index
      return -1 unless range_number_page.include? page_index
      return @items_per_page if range_number_page.include? page_index
    end
      
    # determines what page an item is on. Zero based indexes.
    # this method should return -1 for item_index values that are out of range
    def page_index(item_index) 
     page_item_index = ((item_index.to_f) / @items_per_page.to_f).floor

     return -1 if @collection[item_index].nil? || item_index < 0
     return page_item_index

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
