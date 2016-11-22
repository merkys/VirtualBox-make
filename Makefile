PATH := bin:${PATH}
export PATH

OUT_DIR = outputs
COM_DIR = com

COMS = $(wildcard ${COM_DIR}/*.com)
LOGS = ${COMS:${COM_DIR}/%.com=${OUT_DIR}/%.log}

all: ${LOGS}

${OUT_DIR}/%.log: ${COM_DIR}/%.com
	execute-cannon $< > $@ 2>&1

clean:
	rm -f ${LOGS}
