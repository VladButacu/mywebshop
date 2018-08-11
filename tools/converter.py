#!/usr/bin/python3

import sys
import getopt
import xlrd
import sqlite3

from xlwt import Workbook

config = {
    "component_name": 3,
    "mgmt_address": 32
}

def main(args):
    if not args:
        return 0
    inputFile = args[0]

    conn = sqlite3.connect('../db.sqlite')
    c = conn.cursor()

    book = xlrd.open_workbook(inputFile)
    sheet = book.sheet_by_name('OBO')

    for i in range(2, sheet.nrows):
        cn = str(sheet.cell_value(i, config["component_name"]))
        ma = str(sheet.cell_value(i, config["mgmt_address"]).strip())
        print("Component " + cn)
        print("Mgmt Address " + ma)

        c.execute("INSERT INTO hosts(component_name, mgmt_address) VALUES (?, ?)", (cn, ma))
        conn.commit()

    conn.close()


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))