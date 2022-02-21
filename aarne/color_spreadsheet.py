import xlsxwriter
import csv
import sys

def main():
    workbook = xlsxwriter.Workbook('Lawsheet.xlsx')
    worksheet = workbook.add_worksheet()

    header_format = workbook.add_format()
    header_format.set_bg_color('cyan')
    left_format = workbook.add_format()
    left_format.set_bg_color('yellow')

    row, col = 0, 0
    
    tsvreader = csv.reader(sys.stdin, delimiter='\t')
    for xs in tsvreader:
        for i,x in enumerate(xs):
            if x[:3] == "#H ":
                worksheet.write(row, i, x[3:], header_format)
            elif x[:3] == "#L ":
                worksheet.write(row, i, x[3:], left_format)
            else:
                worksheet.write(row, i, x)
        row += 1
    workbook.close()
    print("wrote Lawsheet.xlsx")


if __name__ == '__main__':
    main()

