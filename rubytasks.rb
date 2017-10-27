require 'date'
class TaskList
    attr_accessor :tasklist, :complete_list, :incomplete_list, :due_tasks
    def initialize
        @tasklist = []
        @complete_list = []
        @incomplete_list = []
        @due_tasks = []
    end
    def add_task(t)
        if t.class != DueDateTask
            raise RuntimeError.new("Must be a task")
        else
            @tasklist << t
        end
    end
    def show_tasks
        @tasklist
    end
    def show_complete_tasks(t, v)
        if t.class != DueDateTask
            raise RuntimeError.new("Must be a complete task")
        elsif v == true
            @complete_list << t
        end
    end
    def show_incomplete_tasks(t, v)
        if t.class != DueDateTask
            raise RuntimeError.new("Must be an incomplete task")
        elsif v == false
            @incomplete_list << t
        end
        @incomplete_list = @incomplete_list.sort_by{|object| object.due_date}
    end
    def show_due_tasks(t)
        if t.show_due_date == Date.today
            @due_tasks << t
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
        super()
    end
    def show_due_date
        @due_date
    end
    def change_due_date(due_date)
        @due_date = due_date
    end
    def remove_date_from_completed_task
        if @check_status == true
            remove_instance_variable(:@due_date)
        end
    end
end

tasklist = TaskList.new
task1 = DueDateTask.new
task1.change_title("Title1")
task1.change_description("Descripton1")
task1.change_due_date(Date.today+1)
task1.remove_date_from_completed_task
tasklist.show_due_tasks(task1)

task2 = DueDateTask.new
task2.change_title("Title2")
task2.change_description("Descripton2")
task2.remove_date_from_completed_task
tasklist.show_due_tasks(task2)

task3 = DueDateTask.new
task3.change_title("Title3")
task3.change_description("Descripton3")
task3.change_due_date(Date.today)
task3.remove_date_from_completed_task
tasklist.show_due_tasks(task3)

task4 = DueDateTask.new
task4.change_title("Title4")
task4.change_description("Description4")
task4.change_due_date(Date.today-10)
task4.remove_date_from_completed_task
tasklist.show_due_tasks(task4)

p tasklist.due_tasks

tasklist.show_complete_tasks(task1, task1.show_check_status)
tasklist.show_complete_tasks(task2, task2.show_check_status)
tasklist.show_complete_tasks(task3, task3.show_check_status)
tasklist.show_complete_tasks(task4, task4.show_check_status)

tasklist.show_incomplete_tasks(task1, task1.show_check_status)
tasklist.show_incomplete_tasks(task2, task2.show_check_status)
tasklist.show_incomplete_tasks(task3, task3.show_check_status)
tasklist.show_incomplete_tasks(task4, task4.show_check_status)

p tasklist.complete_list
p " "
p tasklist.incomplete_list
