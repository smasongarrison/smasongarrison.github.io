### Datasets in R
if (!require("DT")) install.packages('DT')
if (!require("plyr")) install.packages('plyr')
if (!require("R2HTML")) install.packages('R2HTML')
unload_Namespaces<- function(try=1,loadedOnly=TRUE,otherPkgs=TRUE){
  ns<-NULL
  if(loadedOnly){
  ns <-  c(ns,names(sessionInfo()$loadedOnly))}
  if(otherPkgs){
      ns <-  c(ns,names(sessionInfo()$otherPkgs))
  }
  for(i in 1:try){
    for (name in ns) {
      try(unloadNamespace(name), silent=TRUE)
    }
  }
}

is.even <- function(x) x %% 2 == 0
is.odd <- function(x) x %% 2 != 0
is.10 <- function(x) x %% 10 == 0
is.25 <- function(x) x %% 25 == 0
detach_package <- function(pkg, character.only = FALSE)
{
  if(!character.only)
  {
    pkg <- deparse(substitute(pkg))
  }
  search_item <- paste("package", pkg, sep = ":")
  while(search_item %in% search())
  {
    detach(search_item, unload = TRUE, character.only = TRUE)
  }
}

unloadNamespaces <- function(ns, ...) {
while (length(ns) > 0) {
ns0 <- loadedNamespaces()
for (name in ns) {
try(unloadNamespace(name), silent=TRUE)
}
ns1 <- loadedNamespaces()
## No namespace was unloaded?
if (identical(ns1, ns0)) break
ns <- intersect(ns, ns1)
}
if (length(ns) > 0) warning("Failed to unload namespace: ",
paste(sQuote(ns), collapse=", "))
} # unloadNamespaces()

library(R2HTML)
  A = c('abn',
               'Actigraphy',
               'AdaptFit',
               'adlift',
               'Agreement',
               'AID',
               'anapuce',
               'anesrake',
               'ape',
               'aqp',
               'argosfilter',
               'aster',
               'autopls'  )
  B<-c(
               'babynames',
               'BaM',
               'BaSTA',
               'BayesFactor',
               'bayespref',
               'BayHaz',
               'bda',
               'BDgraph',
              # 'bear',
               'bentcableAR',
               'betaper',
               'bethel',
               'Biodem',
               'BioMark',
               'bit64',
               'biwavelet',
               'blm',
               'boot',
               'breakage',
               'bReeze',
               'BSagri'
  )
  C<-c(
			   'C50',
              # 'CADStat',
               'car',
               'CARE1',
               'caschrono',
               'cat',
               'CCM',
              # 'charlson',
               'ChemometricsWithRData',
               'CircStats',
               'classInt',
               #'clim.pact',
               'climatol',
               'clue',
               'cluster',
               #'clusterCons',
               'clusterSim',
               'CMC',
               'CNVassoc',
               #'cobs99',
               'colorspace',
               'compareGroups',
               'CompareTests',
               'compoisson',
               'condGEE',
               'copula',
               'CorrBin',
               #'corrgram',
               'COUNT',
               'cumSeg',
               'cvq2'
			   # 'cyclones',
  )
  D<-c(
			   'datasets',
			   'dblcens',
			   'depthTools',
			   'DiagTest3Grp',
			   'dinamic',
			  # 'diveRsity',
			   'drfit',
			   'drm',
			#   'DSpat',
			   'DTDA',
			   'DynClust',
			   'dynCorr')
E<-c(
			   'Ecdat',
			   'eha',
			   #  'el.convex',
			   'elec',
			   'EMD',
			   'EngrExpt',
			   'Epi',
			   'EpiContactTrace',
			   # 'esd4all',
			   # 'ESPRESSO',
			   'evir',
			   'exactLoglinTest',
			   'exactRankTests',
			   'ExomeDepth',
			   # 'ExPD2D',
			   'expoRkit',
			   'expsmooth',
			   'extRemes'  )
FF<-c(
			   'FAMT',
			   'FAwR',
			   'fda',
			   'fds',
			   'FeaLect',
			   'fExtremes',
			   'fields',
			   'FlexParamCurve',
			   'Flury',
			   'fma',
			   'forams',
			   'forward',
			   'frailtypack',
			   'FRB',
			   'freqMAP',
			   'frt',
			   'fueleconomy',
			   #  'FunNet',
			   'fwi.fbp'  )
G<-c(
			   'GA4Stratification',
			   'GAD',
			   'gamclass',
			   'GANPAdata',
			   'gap',
			   'geepack',
			   'GeneReg',
			   'geomapdata',
			   'geomorph',
			   'GeoXp',
			   'ggm',
			   'ggplot2',
			   'glmc',
			   'gMCP',
			   'gmt',
			   #   'gmvalid',
			   'googleVis',
			   'GrapheR',
			   'gRbase',
			   'grpreg',
			   #  'GRRGI',
			   'gvlma',
			   'gwerAM',
			   'haplo.ccs',
			   #  'hapsim',
			   'hbmem',
			   'HGNChelper',
			   #  'HIBAG',
			   'hier.part',
			   'HistData',
			   'homtest',
			   'Hotelling',
			   'HPbayes',
			   'HSAUR',
			   'hwde',
			   'hydroTSM',
			   'ibr',
			   'ICE',
			   'IDPmisc',
			   'idr',
			   'iFad',
			   #   'iid.test',
			   'ImpactIV',
			   'imputeMDR',
			   'IndependenceTests',
			   'indicspecies',
			   'InfDim',
			   # 'intcox',
			   'Interpol',
			   'introgress',
			   'ipred',
			   'ISDA.R',
			   'isopam',
			   'isopat',
			   'joineR',
			   'kinship2',
			   'kknn',
			   'KMsurv',
			   'laeken',
			   'Lahman',
			   'Lambda4',
			   'landsat',
			   'LaplacesDemon',
			   'lasso2',
			   'Laterality',
			   'lattice',
			   'lava',
			   'lavaan',
			   'lavaan.survey',
			   'lawstat',
			   'LearnBayes',
			   'lessR',
			   'lifecontingencies',
			   'LIStest',
			   'ljr',
			   'lme4',
			   'lmec',
			   'logcondens',
			   # 'longRPart',
			   'LoopAnalyst',
			   'lsmeans',
			   'lss',
			   'maptools',
			   'mAr',
			   'maRketSim',
			   'MASS',
			   'Matrix',
			   'MAVTgsa',
			   'maxstat',
			   'MBCluster.Seq',
			   'mcll',
			   'MEMSS',
			   'meta',
			   'metaLik',
			   'mgcv',
			   'MindOnStats',
			   'minerva',
			   #  'miP',
			   'mirt',
			   'mixcat',
			   'mixdist',
			   #   'mixedQF',
			   'mixsmsn',
			   'MKLE',
			   'MLDS',
			   'monomvn',
			   'moonsun',
			   #   'motmot',
			   'MPV',
			   'mratios',
			   'mtsdi',
			   'multcomp',
			   'multgee',
			   'multisensi',
			   'mvnmle',
			   'nadiv',
			   'nasaweather',
			   #  'NCBI2R',
			   'ncvreg',
			   'NestedCohort',
			   'NetData',
			   #   'nga',
			   'nlme',
			   'nonrandom',
			   'nontarget',
			   'nopp',
			   'nparcomp',
			   'npde',
			   'nplplot',
			   'nsRFA',
			   'nycflights13',
			   'Oncotree',
			   #    'opm',
			   #    'opmdata',
			   #    'oposSOM',
			   'ordPens',
			   'ORIClust',
			   'ORMDR',
			   'paleoMAS',
			   'parfm',
			   #   'parser',
			   'partitionMetric',
			   'pastecs',
			   'PASWR',
			   'PBSadmb',
			   'PBSmapping',
			   'PBSmodelling',
			   'pcse',
			   #  'pcurve',
			   'pec',
			   'penalized',
			   'peplib',
			   'pesticides',
			   'pheno',
			   'phenology',
			   'phonTools',
			   'PHYLOGR',
			   #  'PL.popN',
			   'plm',
			   'plyr',
			   'polysat',
			   #   'POT',
			   'PowerTOST',
			   'ppls',
			   #   'ppMeasures',
			   'pps',
			   'ProbForecastGOP',
			   'pscl',
			   #   'PSCN',
			   'psych',
			   'psychotools',
			   'psychotree',
			   'psytabs',
			   'PwrGSD',
			   #  'qlspack',
			   'qmap',
			   'qPCR.CT',
			   'QSARdata',
			   #   'QT',
			   'QuACN',
			   'quantreg',
			   'RadioSonde',
			   'RAMpath',
			   'RandomFields',
			   'randomForest',
			   'randomForestSRC',
			   'Rearrangement',
			   'reldist',
			   'repolr',
			   'reshape2',
			   'ResistorArray',
			   'Rfit',
			   'RFLPtools',
			   'rgam',
			   'RGCCA',
			   'rgr',
			   'riv',
			   'Rivivc',
			   'rmeta',
			   'rminer',
			   'robustbase',
			   'ROCwoGS',
			   'rpart',
			   'rpart.plot',
			   'rugarch',
			   #  'Rvelslant',
			   'rworldmap'  )
S<-c(
			   #   'sabreR',
			   'samplingVarEst',
			   'sandwich',
			   'sas7bdat',
			   'sdef',
			   'seacarb',
			   'secr',
			   'sem',
			   'SemiPar',
			   'semPLS',
			   'semTools',
			   'seqCBS',
			   'seqRFLP',
			   'seriation',
			   'sfsmisc',
			   #  'sifds',
			   'SightabilityModel',
			   'SimComp',
			   'SimultAnR',
			   'SiZer',
			   'SMIR',
			   'sna',
			   'sp',
			   'spaa',
			   'spacetime',
			   'spartan',
			   'SpatialExtremes',
			  # 'spatstat',
			   'speff2trial',
			   'spgwr',
			   'spi',
			   'sporm',
			   'stepwise',
			   'stpp',
			   'stratification',
			   'stratigraph',
			   'StreamMetabolism',
			   #  'surv2sample',
			   #   'survBayes',
			   'survival',
			   'survivalROC',
			   'survJamda.data',
			   'survPresmooth',
			   'SwissAir',
			   'sybil',
			   'Synth',
			   'tableplot',
			   'TeachingSampling',
			   'texmex',
			   'tgp',
			   'ThreeWay',
			   'timeROC',
			   'titan',
			   'topicmodels',
			   'TraMineR',
			   'TSA',
			   'tsDyn',
			   'twang',
			   'unmarked',
			   #   'UScensus2000blkgrp',
			   'UScensus2000cdp',
			   'UScensus2000tract',
			   #   'VBmix',
			   'vcd',
			   'vcdExtra',
			   'VecStatGraphs3D',
			   'vegan',
			   'vegclust',
			   'vegetarian',
			   'VIM',
			   'waterfall',
			   #   'WaveCD',
			   'wavethresh',
			   'wikibooks',
			   #   'wild1',
			   'wle',
			   #   'WMBrukerParser',
			   'xgobi',
			   'xts',
			   'YieldCurve',
			   'Zelig',
			   'ZeligChoice')
packages=S
  # Installed only packages that are not pre-installed.
  # Credits: http://stackoverflow.com/a/9345167/756986
  new.packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages, repos="http://cran.rstudio.com")
  index = data(package=packages)$results[,c(1,3,4)]
  index = data.frame(index, stringsAsFactors=FALSE)
  index_out = NULL
  index<-arrange(index,Package,Item)
  # Load packages which store datasets
  # and then Save datasets
  for (i in 1:nrow(index)) {

    library(index$Package[i], character.only=TRUE)
    dataset = index$Item[i]
    package = index$Package[i]
    # Load data in new environment (very hackish)
    e = new.env(hash = TRUE, parent = parent.frame(), size = 29L)
    cmd = paste('data(', dataset, ', envir=e)', sep='')
    eval(parse(text=cmd))
    d = e[[dataset]]
    if(class(d) %in% c('data.frame', 'matrix', 'numeric', 'table', 'ts')){
      cat("Processing data set: ", dataset, "\n")
      if(class(d)=='ts'){
        d = data.frame(time(d), d)
        colnames(d) = c('time', dataset)
      }
      try(dir.create(paste('datalists/csv/', package, sep='')))
      try(dir.create(paste('datalists/doc/', package, sep='')))
      dest_csv = paste('datalists/csv/', package, '/', dataset, '.csv', sep='')
      dest_doc = paste('datalists/doc/', package, '/', dataset, '.html', sep='')
      # Save data as CSV
      write.csv(d, dest_csv)
      # Save documentation as HTML
      help.ref = help(eval(dataset), package=eval(package))
      help.file = utils:::.getHelpFile(help.ref)
      tools::Rd2HTML(help.file, out=dest_doc)
      # Add entry to index out
      index_out = rbind(index_out, index[i,])
    }
    detach_package(index$Package[i],character.only = TRUE)
    if(is.10(i)){
      try(unload_Namespaces(try=2,loadedOnly=FALSE))
    }
    closeAllConnections()
  }
  index_out$unique<-paste0(index_out$Package,index_out$Item)
  write.csv(index_out, file='datalists/datasets_import.csv', row.names=FALSE)
