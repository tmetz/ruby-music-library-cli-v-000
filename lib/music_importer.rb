class MusicImporter
  def initialize(filepath)
    @filepath = filepath
  end

  def path
    @filepath
  end

  def files
    Dir.chdir(@filepath) do
      @files = Dir.glob("*.mp3")
    end
  end

end