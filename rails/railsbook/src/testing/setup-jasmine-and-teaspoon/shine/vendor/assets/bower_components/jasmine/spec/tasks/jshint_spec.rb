#---
# Excerpted from "Rails, Angular, Postgres, and Bootstrap",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/dcbang for more book information.
#---
require 'spec_helper.rb'

describe "JSHint task" do

  let(:tmp_dir) { "#{Dir.tmpdir}/jasmine_tasks_test" }
  let(:jasmine_dev) { JasmineDev.new }

  before do
    reset_dir tmp_dir
  end

  describe "when Node is not present" do
    before do
      jasmine_dev.should_receive(:has_node?).and_return(false)
      @output = capture_output { jasmine_dev.js_hint }
    end

    it "should not tell the user that lint is running" do
      @output.should_not match(/Running JSHint/)
    end

    it "should prompt the user to install Node" do
      @output.should match(/Node\.js is required/)
    end
  end

  describe "when Node is present" do
    before do
      jasmine_dev.should_receive(:has_node?).and_return(true)

      @output = capture_output { jasmine_dev.js_hint }
    end

    it "should tell the user that lint is running" do
      @output.should match(/Running JSHint/)
      @output.should match(/Jasmine JSHint PASSED/)
    end
  end
end