import os
import signal
import sys

from PySide2.QtCore import Qt
from PySide2.QtWidgets import QApplication

from utils import QmlInstantEngine

if __name__ == "__main__":
    # Force exit on Keyboard Interrupt from command line (Ctrl+C)
    signal.signal(signal.SIGINT, signal.SIG_DFL)

    app = QApplication(sys.argv)

    app.setAttribute(Qt.AA_EnableHighDpiScaling)

    font = app.font()
    font.setPointSize(9)
    app.setFont(font)

    pwd = os.path.dirname(__file__)
    qmlDir = os.path.join(pwd, "qml")
    url = os.path.join(qmlDir, "main.qml")

    engine = QmlInstantEngine()
    engine.addFilesFromDirectory(qmlDir, recursive=True)
    engine.setWatching(os.environ.get("MESHROOM_INSTANT_CODING", True))
    engine.addImportPath(qmlDir)

    # engine.rootContext().setContextProperty("_reconstruction", r)

    engine.load(os.path.normpath(url))
    #print(engine.rootObjects()[0])

    app.exec_()

