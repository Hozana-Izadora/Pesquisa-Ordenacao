import timeit
from random import randint
import matplotlib.pyplot as plt

# Gerador de lista com base no tamanho recebido
def geraLista(tam):
    lista = []
    while len(lista) < tam:
        n = randint(1,1*tam)
        if n not in lista: lista.append(n)
    return lista

# Plot de grafico
def geraGraf(x,BSort,xl = "Entradas", yl = "loops",nam="img"):
    fig = plt.figure(figsize=(10, 13))
    ax = fig.add_subplot(111)
    ax.plot(x,BSort, label = "Bubble Sort")
    ax.legend(bbox_to_anchor=(1, 1),bbox_transform=plt.gcf().transFigure)
    plt.ylabel(yl)
    plt.xlabel(xl)
    plt.savefig(nam)

# Bubblesort -> Rearranjo -> Comparação de valores e modificação da posição dos elementos
def bubbleSort(array):
    count = 0
    n = len(array)
    for i in range(n):
        for j in range(0, n-i-1):
            count+=1
            if array[j] > array[j+1] :
                array[j], array[j+1] = array[j+1], array[j]
    return count
  
lista = [1000,10000,30000,60000]
saidaB = []
saidaL = []


for i in range(len(lista)):
  saidaB.append(timeit.timeit("bubbleSort({})".format(geraLista(lista[i])),setup="from __main__ import geraLista,bubbleSort",number=1))

geraGraf(lista,saidaB,nam="graf1")

for i in range(len(lista)):

  saidaL.append(bubbleSort(geraLista(lista[i])))

geraGraf(lista,saidaL,nam="graf2")
