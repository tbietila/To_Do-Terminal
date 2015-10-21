require 'spec_helper'

describe Task do
  it 'should belong to a list' do
    aList = List.create(:name => 'theList')
    aTask = Task.create(:name => 'task on theList', :done =>false)
    aTask.list = aList
    aTask.save
    expect(aTask.list).to eq aList
  end

  it 'can return the not done tasks' do
   not_done_tasks = (1..2).to_a.map do |number|
     Task.create(:name => "task #{number}", :done =>false)
   end
   tasks = Task.all
   expect(tasks.first).to eq not_done_tasks.first
   expect(tasks.last).to eq not_done_tasks.last

  end



end
