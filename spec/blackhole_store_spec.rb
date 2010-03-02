require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ActiveSupport::Cache::BlackholeStore do

  before do
    @store = ActiveSupport::Cache::BlackholeStore.new
  end

  it "should not write keys to the store" do 
    @store.write("key", "value")
    @store.keys.empty?.should be(true)
  end

  it "should always read null" do 
    @store.write("key", "value")
    @store.read("key").should be(nil)
  end

  it "should always return false on exist? " do 
    @store.write("key", "value")
    @store.exist?("key").should be(false)
  end

  it "should always return false on delete " do 
    @store.write("key", "value")
    @store.delete("key").should be(false)
  end

  it "should always execute block on fetch" do 
    @store.write("key", 5)
    a = @store.fetch("key") do 
      3
    end

    a.should eql(3)
  end

end
