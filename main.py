import os
import signal
import sys

from PySide2.QtCore import Qt, QObject, Property, Signal
from PySide2.QtWidgets import QApplication

from utils import QmlInstantEngine


class Connector(QObject):

    def __init__(self):
        super(Connector, self).__init__()
        self._text = "default"
        self.setObjectName("ConnectorObject")

    def setText(self, value):
        print("setText : " + value)
        self._text = value
        self.textChanged.emit()

    def getText(self):
        return self._text

    textChanged = Signal()
    text = Property(str, getText, setText, notify=textChanged)


class Num(QObject):

    def __init__(self):
        super(Num, self).__init__()
        self._number = "10"
        self.setObjectName("NumObject")

    def setNumber(self, number):
        print("setNumber : " + number)
        self._number = number
        self.numberChanged.emit()

    def getNumber(self):
        return self._number

    numberChanged = Signal()
    number = Property(str, getNumber, setNumber, notify=numberChanged)


if __name__ == "__main__":
    # Force exit on Keyboard Interrupt from command line (Ctrl+C)
    signal.signal(signal.SIGINT, signal.SIG_DFL)

    app = QApplication(sys.argv)

    app.setAttribute(Qt.AA_EnableHighDpiScaling)

    c = Connector()
    d = Num()
    # c.text = "TOTO"
    print("Python: " + c.text)
    print("Python: " + d.number)
    # c._text = "TOTO"
    # c.setText("TOTO")
    # print(c.getText())

    font = app.font()
    font.setPointSize(10)
    app.setFont(font)

    pwd = os.path.dirname(__file__)
    qmlDir = os.path.join(pwd, "qml")
    url = os.path.join(qmlDir, "main.qml")

    engine = QmlInstantEngine()
    engine.addFilesFromDirectory(qmlDir, recursive=True)
    engine.setWatching(os.environ.get("MESHROOM_INSTANT_CODING", True))
    engine.addImportPath(qmlDir)

    engine.rootContext().setContextProperty("_Connector", c)
    engine.rootContext().setContextProperty("_Num", d)
    engine.load(os.path.normpath(url))

    app.exec_()
