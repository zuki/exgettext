defmodule Exgettext.Mixfile do
  use Mix.Project

  def project do
    [app: :exgettext,
     version: "0.1.2",
#     elixir: "~> 1.1.0-beta or ~> 1.0.0 or ~> 0.15.0-dev",
     compilers: Mix.compilers ++ [:po],
     description: "Localization package using GNU gettext",
     source_url: "https://zuki_ebetu@bitbucket.org/zuki_ebetsu/exgettext",
     homepage_url: "https://elixir-lang/docs",
     package: [
               contributors: ["k1complete"],
               licenses: ["MIT"],
               links: %{"GitHub" => "https://github.com/k1complete/exgettext"}
       ],
     docs: docs(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  def abs_path(s) when is_list(s) do
    Path.join([File.cwd! | s])
  end
  def abs_path(s) do
    Path.join(File.cwd!, s)
  end
  def make_source_ref(source_dir) do
    gitdir = Path.join(source_dir, ".git")
    {shead, 0} = System.cmd("git", ["--git-dir", gitdir,
                                    "rev-parse", "HEAD"])
    shead = String.trim_trailing(shead)
    {stag, 0} = System.cmd("git", ["--git-dir", gitdir,
                                   "tag", "--points-at", shead])
    stag = String.trim_trailing(stag)
    case stag do
      nil -> shead
      "" -> shead
      _ -> stag
    end
  end
  def docs do
    source_dir = "."
    sr = abs_path([source_dir, "_build/dev/lib/exgettext/ebin"])
#    IO.inspect File.ls(source_dir)
    sref = if (File.exists?(source_dir)) do
             make_source_ref(source_dir)
           else
             nil
           end
    version_path = Path.join(source_dir, "VERSION")
#    IO.inspect [version_path: version_path, sref: sref]
    {:ok, version} = if File.exists?(version_path) do
                       File.read(version_path)
                     else
                       {:ok, nil}
                     end
    [
     project: "Exgettext",
     app: "exgettext",
     version: version,
     formatter: Exgettext.HTML,
     source_root: abs_path("."),
     logo: "logo.png",
     logo_url: "http://elixir-lang.org/docs/logo.png",
     source_beam: sr,
     source_ref: sref,
     output: "doc/",
     main: "Exgettext"
    ]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.14.5"}]
  end
end
