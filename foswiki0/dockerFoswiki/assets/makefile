


PLUGIN = TutorialPlugin
ROOTDIR = /home/bram/devfoswiki/
PLUGINDIR = ${ROOTDIR}/${PLUGIN}
KATACODADIR = /home/bram/programs/Katacoda
PRODDIR = ${KATACODADIR}/katacoda-scenarios/foswiki0/dockerFoswiki
COLLATE = ${KATACODADIR}/collateAndDeploy.pl


BINDIR = ${ROOTDIR}/core/bin

# needed for unit tests and rest
FOSWIKI_HOME=/home/bram/devfoswiki/core
FOSWIKI_LIBS=${FOSWIKI_HOME}/lib:${FOSWIKI_HOME}/lib/CPAN/lib
SET_ENV = cd ${MODULEDIR}/lib/Foswiki/Plugins/${MODULE}; export FOSWIKI_HOME=${FOSWIKI_HOME}; export FOSWIKI_LIBS=${FOSWIKI_LIBS}
REST_ENV = export FOSWIKI_HOME=${FOSWIKI_HOME}; export FOSWIKI_LIBS=${FOSWIKI_LIBS}


TOPICS = 'KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep01,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep02,\
	KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep03,\
	KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep04,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep05,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep06,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep07,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep08,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep09,\
    KatacodaCourses.Foswiki0.KcDockerAF.ScenarioStep10,\
	KatacodaCourses.Foswiki0.KcDockerAF.ScenarioIntro,\
	KatacodaCourses.Foswiki0.KcDockerAF.ScenarioFinish'
	
update:
	cd ${KATACODADIR}; make update

test: 
	cd ${BINDIR}; ${REST_ENV}; ./rest /TutorialPlugin/create publish=on translate=on deploy=on topics=${TOPICS} outdir=tutorialmd user=admin
collate:
	${COLLATE}
    
install:
	cd ${ROOTDIR}/core && ./pseudo-install.pl TutorialPlugin
	
    