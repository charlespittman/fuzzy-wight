" ATP project vim script: Wed Jan 30, 2013 at 11:47 PM -0500.

let b:atp_MainFile = 'latexusage.tex'
let g:atp_mapNn = 0
let b:atp_autex = 1
let b:atp_TexCompiler = 'pdflatex'
let b:atp_TexOptions = '-synctex=1'
let b:atp_TexFlavor = 'tex'
let b:atp_auruns = '1'
let b:atp_ReloadOnError = '1'
let b:atp_OutDir = '/home/charles/src/tex/asymptote'
let b:atp_OpenViewer = '1'
let b:atp_XpdfServer = 'latexusage'
let b:atp_Viewer = 'okular'
let b:TreeOfFiles = {}
let b:ListOfFiles = []
let b:TypeDict = {}
let b:LevelDict = {}
let b:atp_BibCompiler = 'bibtex'
let b:atp_StarEnvDefault = ''
let b:atp_StarMathEnvDefault = ''
let b:atp_updatetime_insert = 4000
let b:atp_updatetime_normal = 2000
let b:atp_LocalCommands = ['\asydir', '\A', '\B']
let b:atp_LocalEnvironments = []
let b:atp_LocalColors = []
