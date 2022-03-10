from tkinter import *
from tkinter import ttk
import cx_Oracle

conn = cx_Oracle.connect('userandi/password@//localhost:1521/xepdb1')

window = Tk()
window.title("Reprezentanta Auto")
window.geometry("1200x600")


tabs = ttk.Notebook(window)
cursor = conn.cursor()

tab1 = Frame(tabs, bg = '#e8f4f8')
tab2 = Frame(tabs, bg = '#e8f4f8')
tab3 = Frame(tabs, bg = '#e8f4f8')
tab4 = Frame(tabs, bg = '#e8f4f8')
tab5 = Frame(tabs, bg = '#e8f4f8')
tab6 = Frame(tabs, bg = '#e8f4f8')

tabs.add(tab1, text = "Afisare")
tabs.add(tab2, text = "Afisare cu join")
tabs.add(tab3, text = "Afisare cu group")
tabs.add(tab4, text = "Stergere")
tabs.add(tab5, text = "Editare")
tabs.add(tab6, text = "Vizualizari")

tabs.pack(expand = 1, fill = "both")


#---------------TAB1-----------------------


tree = ttk.Treeview(tab1, show = "headings", height = "15")
scrollbar = ttk.Scrollbar(tab1, orient = VERTICAL, command = tree.yview)
tree.configure(yscroll = scrollbar.set)
scrollbar.place(x = 1120, y = 70)


label1 = Label(tab1, text = "Nume tabel: ", bg = '#e8f4f8')
label1.place(x = 180, y = 400)
entry1 = Entry(tab1)
entry1.place(x = 260, y = 400)

label2 = Label(tab1, text = "Sorteaza dupa: ", bg ='#e8f4f8')
label2.place(x = 500, y = 400)
entry2 = Entry(tab1)
entry2.place(x = 590, y = 400)

def selectall(tabel):
    query = f"select * from {tabel}"
    return query

def afisare(tabel):
    query = selectall(tabel)
    cursor = conn.cursor()
    cursor.execute(query)
    rows_ret = cursor.fetchall()
    nrcol = len(rows_ret[0])
    if tabel == 'adresa':
        tree["col"] = (0, 1, 2, 3, 4)
    elif tabel == 'client':
        tree["col"] = (0, 1, 2, 3, 4, 5)
    elif tabel == 'vanzator':
        tree["col"] = (0, 1, 2, 3, 4, 5)
    elif tabel == 'comanda':
        tree["col"] = (0, 1, 2, 3, 4)
    elif tabel == 'marca':
        tree["col"] = (0, 1, 2)
    elif tabel == 'furnizor':
        tree["col"] = (0, 1, 2, 3, 4)
    elif tabel == 'motorizare':
        tree["col"] = (0, 1, 2, 3)
    else:
        tree["col"] = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    tree.pack()
    colname = [i[0] for i in cursor.description]
    for i in range(0, nrcol):
        tree.heading(i, text = colname[i])
        tree.column(i, minwidth = 0, width = 130)
    for i in rows_ret:
        tree.insert('', 'end', values = i)
    cursor.execute("commit")

def selectallcresc(tabel, order):
    query = f"select * from {tabel} order by {order} asc"
    return query

def selectalldesc(tabel, order):
    query = f"select * from {tabel} order by {order} desc"
    return query

def sortafisare(tabel, order, ok):
    if ok == 0:
        query = selectallcresc(tabel, order)
    else:
        query = selectalldesc(tabel, order)
    cursor = conn.cursor()
    cursor.execute(query)
    rows_ret = cursor.fetchall()
    nrcol = len(rows_ret[0])
    if tabel == 'adresa':
        tree["col"] = (0, 1, 2, 3, 4)
    elif tabel == 'client':
        tree["col"] = (0, 1, 2, 3, 4, 5)
    elif tabel == 'vanzator':
        tree["col"] = (0, 1, 2, 3, 4, 5)
    elif tabel == 'comanda':
        tree["col"] = (0, 1, 2, 3, 4)
    elif tabel == 'marca':
        tree["col"] = (0, 1, 2)
    elif tabel == 'furnizor':
        tree["col"] = (0, 1, 2, 3, 4)
    elif tabel == 'motorizare':
        tree["col"] = (0, 1, 2, 3)
    else:
        tree["col"] = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    tree.pack()
    colname = [i[0] for i in cursor.description]
    for i in range(0, nrcol):
        tree.heading(i, text = colname[i])
        tree.column(i, minwidth = 0, width = 130)
    for i in rows_ret:
        tree.insert('', 'end', values = i)
    cursor.execute("commit")

def afisareB():
    entry = entry1.get()
    entry1.delete(0, END)
    entry1.insert(0, "")
    for i in tree.get_children():
        tree.delete(i)
    afisare(entry)

def afisarecrescB():
    entry = entry1.get()
    entry1.delete(0, END)
    entry1.insert(0, "")
    ec = entry2.get()
    entry2.delete(0, END)
    entry2.insert(0, "")
    for i in tree.get_children():
        tree.delete(i)
    sortafisare(entry, ec, 0)

def afisaredescB():
    entry = entry1.get()
    entry1.delete(0, END)
    entry1.insert(0, "")
    ec = entry2.get()
    entry2.delete(0, END)
    entry2.insert(0, "")
    for i in tree.get_children():
        tree.delete(i)
    sortafisare(entry, ec, 1)


buton1 = Button(tab1, text = "Afiseaza", pady = 5, bg = 'white', command = afisareB)
buton1.place(x = 270, y = 440)

buton2 = Button(tab1, text = "Crescator", pady = 5, bg = 'white', command = afisarecrescB)
buton2.place(x = 739, y = 370)

buton3 = Button(tab1, text = "Descrescator", pady = 5, bg = 'white', command = afisaredescB)
buton3.place(x = 730, y = 420)


#---------------TAB2-----------------------


tree2 = ttk.Treeview(tab2, show = "headings", height = "12")
label4 = Label(tab2, text = "Afisare masini cu puterea mai mare decat 150, furnizate de Volkswagen Group", bg ='#e8f4f8')
label4.place(x = 380, y = 320)

scrollbar2 = ttk.Scrollbar(tab2, orient = VERTICAL, command = tree2.yview)
tree.configure(yscroll = scrollbar.set)
scrollbar2.place(x = 850, y = 90)

def tabeltab2():
    query = "select nume_companie, putere, model from furnizor f join masina m on f.furnizor_id = m.furnizor_id join motorizare n on m.motorizare_id = n.motorizare_id where nume_companie like 'Volkswagen Group' and putere > 150"
    cursor.execute(query)
    rows_ret = cursor.fetchall()
    nrcol = len(rows_ret[0])
    tree2["col"] = (0, 1, 2)
    tree2.pack()
    colname = [i[0] for i in cursor.description]
    for i in range(0, nrcol):
        tree2.heading(i, text = colname[i])
        tree2.column(i, minwidth = 0, width = 160)
    for i in rows_ret:
        tree2.insert('', 'end', values = i)
    cursor.execute("commit")

def afisarejB():
    for i in tree2.get_children():
        tree2.delete(i)
    tabeltab2()


buton4 = Button(tab2, text = 'Afiseaza', pady = 5, bg = 'white', command = afisarejB)
buton4.place(x = 540, y = 350)


#---------------TAB3-----------------------

tree3 = ttk.Treeview(tab3, show = "headings", height = "9")
label5 = Label(tab3, text = "Afisare cod, nume marca si numarul de masini cu acea marca pentru marcile cu mai putin de 5 masini", bg = '#e8f4f8')
label5.place(x = 320, y = 220)

def tabeltab4():
    query = "select marca_id, nume, count(masina_id) from masina join marca using (marca_id) group by marca_id, nume having count(masina_id) < 5"
    cursor = conn.cursor()
    cursor.execute(query)
    rows_ret = cursor.fetchall()
    nrcol = len(rows_ret[0])
    tree3["col"] = (0, 1, 2)
    tree3.pack()
    colname = [i[0] for i in cursor.description]
    for i in range(0, nrcol):
        tree3.heading(i, text = colname[i])
        tree3.column(i, minwidth = 0, width = 160)
    for i in rows_ret:
        tree3.insert('', 'end', values = i)
    cursor.execute("commit")

def afisaregB():
    for i in tree3.get_children():
        tree3.delete(i)
    tabeltab4()


buton5 = Button(tab3, text = 'Afiseaza', pady = 5, bg = 'white', command = afisaregB)
buton5.place(x = 540, y = 250)


#---------------TAB4-----------------------

label6 = Label(tab4, text = "Nume tabel:", bg = '#e8f4f8')
label6.place(x = 350, y = 200)
entry4 = Entry(tab4)
entry4.place(x = 350, y = 230)
label7 = Label(tab4, text = "ID:", bg = '#e8f4f8')
label7.place(x = 550, y = 200)
entry5 = Entry(tab4)
entry5.place(x = 550, y = 230) 


def stergere():
    tabel = entry4.get()
    id = entry5.get()
    if tabel == 'adresa':
        idd = "adresa_id"
    elif tabel == 'client':
        idd = "client_id"
    elif tabel == 'vanzator':
        idd = "vanzator_id"
    elif tabel == 'comanda':
        idd = "comanda_id"
    elif tabel == 'marca':
        idd = "marca_id"
    elif tabel == 'furnizor':
        idd = "furnizor_id"
    elif tabel == 'motorizare':
        idd = "motorizare_id"
    else:
        idd = "masina_id"
    
    query = f"delete from {tabel} where {idd} = {id}"
    cursor.execute(query)

    entry5.delete(0, END)
    entry5.insert(0, "")
    entry4.delete(0, END)
    entry4.insert(0, "")


buton6 = Button(tab4, text = 'Sterge', pady = 5, bg = 'white', command = stergere)
buton6.place(x = 490, y = 260)


#---------------TAB5-----------------------

label8 = Label(tab5, text = "Nume tabel:", bg = '#e8f4f8')
label8.place(x = 350, y = 200)
entry6 = Entry(tab5)
entry6.place(x = 350, y = 230)
label9 = Label(tab5, text = "ID:", bg = '#e8f4f8')
label9.place(x = 550, y = 200)
entry7 = Entry(tab5)
entry7.place(x = 550, y = 230) 
label10 = Label(tab5, text = "Atributul de modificat:", bg = '#e8f4f8')
label10.place(x = 350, y = 290)
entry8 = Entry(tab5)
entry8.place(x = 350, y = 320)
label11 = Label(tab5, text = "Data cu care se va modifica:", bg = '#e8f4f8')
label11.place(x = 540, y = 290)
entry9 = Entry(tab5)
entry9.place(x = 550, y = 320)


def editare():
    tabel = entry6.get()
    id = entry7.get()
    atribut = entry8.get()
    datanoua = entry9.get()
    if tabel == 'adresa':
        idd = "adresa_id"
    elif tabel == 'client':
        idd = "client_id"
    elif tabel == 'vanzator':
        idd = "vanzator_id"
    elif tabel == 'comanda':
        idd = "comanda_id"
    elif tabel == 'marca':
        idd = "marca_id"
    elif tabel == 'furnizor':
        idd = "furnizor_id"
    elif tabel == 'motorizare':
        idd = "motorizare_id"
    else:
        idd = "masina_id"
     
    query = f"update {tabel} set {atribut} = '{datanoua}' where {idd} = {id}"
    cursor.execute(query)
    cursor.execute("commit")
    
    entry6.delete(0, END)
    entry6.insert(0, "")
    entry7.delete(0, END)
    entry7.insert(0, "")
    entry8.delete(0, END)
    entry8.insert(0, "")
    entry9.delete(0, END)
    entry9.insert(0, "")


buton7 = Button(tab5, text = 'Modifica', pady = 5, bg = 'white', command = editare)
buton7.place(x = 739, y = 260)


#---------------TAB6-----------------------

tree4 = ttk.Treeview(tab6, show = "headings", height = "10")
label12 = Label(tab6, text = "Vizualizare compusa", bg = '#e8f4f8')
label12.place(x = 220, y = 270)
label13 = Label(tab6, text = "Afisare detalii despre comenzile corespunzatoare vanzatorilor al caror salariu > 3000", bg = '#e8f4f8')
label13.place(x = 50, y = 340)

label14 = Label(tab6, text = "Vizualizare complexa", bg = '#e8f4f8')
label14.place(x = 785, y = 270)

label15 = Label(tab6, text = "Pentru fiecare furnizor este afisat numarul de modele furnizate", bg = '#e8f4f8')
label15.place(x = 700, y = 340)



def afisare_viz(query, ok):
    cursor = conn.cursor()
    cursor.execute(query)
    rows_ret = cursor.fetchall()
    nrcol = len(rows_ret[0])
    if ok == 0:
        tree4["col"] = (0, 1)
    else:
        tree4["col"] = (0, 1, 2, 3, 4)
    tree4.pack()
    col_names = [i[0] for i in cursor.description]
    for i in range(0, nrcol):
        tree4.heading(i, text = col_names[i])
        tree4.column(i, minwidth = 0, width = 130)
    for i in rows_ret:
        tree4.insert('', 'end', values = i)
    cursor.execute("commit")

def afisvizc():
     for i in tree4.get_children():
        tree4.delete(i)
     query = "select * from viz_compusa"
     afisare_viz(query, 1)

def afisvizcx():
    for i in tree4.get_children():
        tree4.delete(i)
    query = "select * from viz_complexa"
    afisare_viz(query, 0)


buton8 = Button(tab6, text = 'Afiseaza', pady = 5, bg = 'white', command = afisvizc)
buton8.place(x = 250, y = 300)

buton9 = Button(tab6, text = 'Afiseaza', pady = 5, bg = 'white', command = afisvizcx)
buton9.place(x = 820, y = 300)

window.mainloop()