require 'date'
class TaskList
    attr_accessor :tasklist, :complete_list, :incomplete_list
    def initialize
        @tasklist = []
        @complete_list = []
        @incomplete_list = []
    end
    def add_task(t)
        if t.class != Task
            raise RuntimeError.new("Must be a task")
        else
            @tasklist << t
        end
    end
    def show_tasks
        @tasklist
    end
    def show_complete_tasks(t, v)
        if t.class != Task
            raise RuntimeError.new("Must be a complete task")
        elsif v == true
            @complete_list << t
        end
    end
    def show_incomplete_tasks(t, v)
        if t.class != Task
            raise RuntimeError.new("Must be an incomplete task")
        elsif v == false
            @incomplete_list << t
        end
    end
end

class Task
    attr_accessor :title, :description, :mark_complete, :check_status, :status
    def initialize(title="my_title", description="my_description", mark_complete=false, check_status=false)
        @title = title
        @description = description
        @mark_complete = mark_complete
        @check_status = check_status
        @status = "task not complete"
    end
    def change_title(title)
        @title = title
    end
    def change_description(description)
        @description = description
    end
    def toggle_mark
        @mark_complete = !(@mark_complete)
        @check_status = !(@check_status)
        if @check_status == true
            @status = "task is complete"
        else
            @status = "task not complete"
        end
    end
    def show_check_status
        @check_status
    end
end

class DueDateTask < Task
    attr_accessor :due_date
    def initialize(due_date=Date.today+3)
        @due_date = due_date
    end
    def super
        super
    end
end

tasklist = TaskList.new

task1 = Task.new
task1.change_title("Title1")
task1.change_description("Descripton1")
task1.toggle_mark

task2 = Task.new
task2.change_title("Title2")
task2.change_description("Descripton2")
# task2.toggle_mark

task3 = Task.new
task3.change_title("Title3")
task3.change_description("Descripton3")

task4 = DueDateTask.new
task4.change_title("Title4")
task4.change_description("Description4")
p task4

# tasklist.add_task(task1)
# tasklist.add_task(task2)
# tasklist.add_task(task3)
tasklist.show_complete_tasks(task1, task1.show_check_status)
tasklist.show_complete_tasks(task2, task2.show_check_status)
tasklist.show_complete_tasks(task3, task3.show_check_status)

tasklist.show_incomplete_tasks(task1, task1.show_check_status)
tasklist.show_incomplete_tasks(task2, task2.show_check_status)
tasklist.show_incomplete_tasks(task3, task3.show_check_status)

# p tasklist.complete_list
# p tasklist.incomplete_list
# tasklist.show_tasks
p Date.today
