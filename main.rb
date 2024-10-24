require 'yaml'

ACTIONS = {
  '1' => -> do
    p 'write a task'
    input = gets.chomp

    yaml_string = File.read('tasks.yml')
    tasks_array = YAML.load(yaml_string) || []

    tasks_array << input
    result = YAML.dump(tasks_array)
    File.write('tasks.yml', result)
  end,
  '2' => -> do
    p 'write a task to remove'
    tasks_array = YAML.load(File.read("tasks.yml"))

    tasks_array.each do |task|
      p task
    end

    input = gets.chomp

    tasks_array.delete(input)

    result = YAML.dump(tasks_array)
    File.write('tasks.yml', result)
  end,
  '3' => -> do
    p "Getting a random item"
    tasks_array = YAML.load(File.read("tasks.yml"))

    p "Your random task is #{tasks_array.sample}"
  end
}

p "What would you like to do?"
p "1. Add a new item"
p "2. Remove an item"
p "3. Get a random item"

input = gets.chomp

ACTIONS[input].call

