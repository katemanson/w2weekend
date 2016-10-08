require "find"

def in_specs_dir?
  Dir.getwd.split("/").last == "specs"
end

def get_spec_files
  test_files = []
  if in_specs_dir?
    Dir.foreach(".") do |file_path|
      if file_path.include?("_spec.rb")
        test_files << file_path
      end
    end
  else
    Find.find("specs") do |file_path|
      if file_path.include?("_spec.rb")
        test_files << file_path
      end
    end
  end
  return test_files
end

def run_tests spec_files
  spec_files.each_with_index do |file, index|
    puts "Running test: \e[1;35m#{File.basename(file)}\e[0m"
    system("ruby #{file}")
    puts "-" * 51 if (index != spec_files.length - 1)
  end
end

files = get_spec_files()

run_tests(files)