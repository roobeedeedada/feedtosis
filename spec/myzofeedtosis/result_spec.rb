require File.join(File.dirname(__FILE__), %w[.. spec_helper])

describe Myzofeedtosis::Result do
  before do
    @c = mock('curl')
    @f = mock('feed')
    @r = Myzofeedtosis::Result.new(@c, @f)
  end
  
  it "should raise an ArgumentError if the Curl object is nil" do
    lambda {
      Myzofeedtosis::Result.new(nil, nil)
    }.should raise_error(ArgumentError)
  end
  
  it "should send author to the Feed object" do
    @f.expects(:author)
    @r.author
  end
  
  it "should send body_str to the curl object" do
    @c.expects(:body_str)
    @r.body_str
  end
  
  it "should return nil for author if the Feed is nil" do
    r = Myzofeedtosis::Result.new(@c, nil)
    r.author
  end
end