#!/usr/bin/env rspec

require 'spec_helper'
require File.join(File.dirname(__FILE__), '../../', 'data', 'sysctl_data.rb')

module MCollective
  module Data
    describe Sysctl_data<Base do
      let(:shell) { mock }
      let(:shell_status) { mock }

      before do
        @data_file = File.join(File.dirname(__FILE__), '../../', 'data', 'sysctl_data.rb')
        @data = MCollective::Test::DataTest.new("sysctl_data", :data_file => @data_file).plugin
        Shell.stubs(:new).returns(shell)
        shell.stubs(:runcommand)
        shell.stubs(:status).returns(shell_status)
        shell_status.stubs(:exitstatus).returns(0)
      end

      describe '#query' do
        it 'should set the value on a successful query' do
          shell.stubs(:stdout).returns('rspec=testing')
          @data.lookup('rspec').should have_data_items(:value => 'testing')
        end

        it 'should cast the value to an int if returned value is an int' do
          shell.stubs(:stdout).returns('rspec=12345')
          @data.lookup('rspec').should have_data_items(:value => 12345)
        end

        it 'should cast the value to an float if returned value is a float' do
          shell.stubs(:stdout).returns('rspec=0.12345')
          @data.lookup('rspec').should have_data_items(:value => 0.12345)
        end

        it 'should set value to the empty string if sysctl command exits with non 0' do
          shell_status.expects(:exitstatus).returns(1)
          @data.lookup('rspec').should have_data_items({:value => ''})
        end
      end
    end
  end
end
