require 'rspec'
require_relative 'rubytasks'
require 'date'

describe "TaskList" do
    it "has to be real" do
        expect{Task.new}.to_not raise_error
    end
    it "can make an empty array" do
        tasklist = TaskList.new
        expect(tasklist.tasklist).to eq []
    end
    it "can shovel tasks into array" do
        task = Task.new
        tasklist = TaskList.new
        other = "I'm not a task"
        expect { raise tasklist.add_task(other) }.to raise_error("Must be a task")
    end
    it "can shovel complete tasks into an array" do
        task = Task.new
        tasklist = TaskList.new
        other = "I'm not a complete task"
        expect { raise tasklist.show_complete_tasks(other, true) }.to raise_error("Must be a complete task")
    end
    it "can shovel incomplete tasks into an array" do
        task = Task.new
        tasklist = TaskList.new
        other = "I'm not an incomplete task"
        expect { raise tasklist.show_incomplete_tasks(other, false) }.to raise_error("Must be an incomplete task")
    end
end

describe "Task" do
    it "has to be real" do
        expect{Task.new}.to_not raise_error
    end
    it "has a title" do
        task = Task.new
        expect(task.title).to be_a String
    end
    it "has a description" do
        task = Task.new
        expect(task.description).to be_a String
    end
    it "can be marked done" do
        task = Task.new
        expect(task.mark_complete).to be false or be true
    end
    it "can toggle the mark" do
        task = Task.new
        expect{task.toggle_mark}.to change {task.mark_complete}.from(false).to(true)
        expect{task.toggle_mark}.to change {task.mark_complete}.from(true).to(false)
    end
    it "can toggle check_status" do
        task = Task.new
        expect{task.toggle_mark}.to change {task.check_status}.from(false).to(true)
        expect{task.toggle_mark}.to change {task.check_status}.from(true).to(false)
    end
    it "can change status" do
        task = Task.new
        expect{task.toggle_mark}.to change {task.status}.to eq "task is complete"
        expect{task.toggle_mark}.to change {task.status}.to eq "task not complete"
    end
end
