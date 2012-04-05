class Utils
  def self.files_modified
    `git status --porcelain | egrep "^(A |M |R ).*" | awk ' { if ($3 == "->") print $4; else print $2 } '`.split
  end

  def self.use_rvm?
    File.exists?(".rvmrc")
  end

  def self.rvm_command(command)
    f = File.read(".rvmrc").split("\n").first
    rvm_version = nil
    if f.match(/rvm( use|) ([^ ]+)$/)
      rvm_version = $2
    end
    if rvm_version.nil?
      puts "Cannot determine rvm version"
      exit 1
    else
      puts "Using '#{rvm_version}' version"
    end
    cmd = "$rvm_path/bin/rvm-shell '#{rvm_version}' -c '#{command}'"
    Utils.command cmd
  end

  def self.command(cmd)
    system('echo ' + cmd)
    system(cmd)
  end
end