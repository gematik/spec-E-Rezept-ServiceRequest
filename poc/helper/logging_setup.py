import logging

def setup_logger(name, log_file=None, level=logging.INFO):
    """Setzt das Logging für die Anwendung."""
    logger = logging.getLogger(name)
    logger.setLevel(level)
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

    # StreamHandler (für die Konsole)
    ch = logging.StreamHandler()
    ch.setFormatter(formatter)
    logger.addHandler(ch)

    # Optional: FileHandler (zum Speichern in Datei)
    if log_file:
        fh = logging.FileHandler(log_file)
        fh.setFormatter(formatter)
        logger.addHandler(fh)

    return logger