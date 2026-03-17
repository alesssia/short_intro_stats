---
theme: gaia
_class: lead
paginate: false
marp: true
backgroundColor: #FAFAFA
color: black

style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
---

<style>
section {
 font-family:  'Atkinson Hyperlegible', 'Helvetica', 'Arial', sans-serif;
}
</style>

# Introduction to statistics

### (Day 3)

---
![bg opacity](./img/backgrounds/wrappingup_bg.png)

<span style="display:block; height:190px;"></span>

# Recap


---
## Recap


<div style="font-size: 90%">

- Statistics is divided in  *Descriptive*  and *Inferential*

<span style="display:block; height:1px;"></span>

- Categorical variables  are described with absolute and relative frequencies, numerical ones are described with measures of central tendency, dispersion, and correlation
- Variables can be summarised with multiple graphical representations
- Parameters (calculated on the population) *vs*&nbsp; statistics (calculated on the sample)

</div>


---
## Recap

<div style="font-size: 90%">

- The Normal distribution allows us to determine both the probability of observing a certain value and its expected frequency
- The z-score allows us to position an observation relative to the reference population and to compare data from very different distributions

<span style="display:block; height:1px;"></span>

- We use statistics to estimate parameters (point estimates), which should be communicated along with a measure of confidence (CI or ME; interval estimates)
- A 95% confidence interval results from a procedure that, in 95% of cases, contains the true population value.


</div>

<!-- 95% confidence intervals tell us the the true value has 95% probability of being inside the given range -->

---
![bg opacity](./img/backgrounds/hypothesis_testing_bg.png)

<span style="display:block; height:190px;"></span>

# Making decision with data

<!-- Sino ad adesso siamo andati a raccogliere i dati, descriverli e fare stime di paramentri di popolazione partendo da campioni, ma fare stime non basta. Dobbiamo anche prendere decisioni. Se Florence Nightingale si fosse limitata a fare stime dei soldiati morti, il governo non avrebbe stanziato fondi per migliorare la situazione non solo dei soldati, ma anche dei malati in tempo di pace.

Vediamo quindi ora come usare dell'evidenza dai dati per prendere delle decisioni -->

---
## Learning objectives

<span style="display:block; height:2px;"></span>

- Make and test hypotheses
- Interpret P values
- Distinguish between Type I and Type II errors
- Understand the importance of the statistical power

---
## Why we observe data variability ?

<div style="font-size: 90%">

- We will see how to determine whether the variability depends on the experimental conditions or whether it is due to individual differences and/or measurement errors.

<span style="display:block; height:20px;"></span>

<center>
<img src="./img/data/head_circiference_doll.png" img height="190px"  border="4px"/> 
<img src="./img/data/head_circiference_children.png" img height="190px"  border="4px"/>
<img src="./img/data/head_circiference_children_groups.png" img height="190px" border="4px"/>
</center>

</div>

---
## &nbsp;&nbsp;&nbsp; :warning:  Disclaimer  :warning:

<span style="display:block; height:10px;"></span>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This part continues to be complex.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Don’t worry, we're almost there!



---
## Making hypotheses

<span style="display:block; height:30px;"></span>

> *A hypothesis can be defined as a proposed explanation for a phenomenon. It is not the absolute truth, but a provisional, working assumption, perhaps best thought of as a potential suspect in a criminal case.*

<span style="display:block; height:160px;"></span>

<div style="font-size: 50%" align="right">

Spiegelhalter, D., *The Art of Statistics: Learning From Data*, Pelican, 2019

</div>

<!-- 
Ogni studio inizia con un'ipotesi, quella che viene chiamata "domanda di ricerca"

A hypothesis can be defined as a proposed explanation for a phenomenon. It is not the absolute truth, but a provisional, working assumption, perhaps best thought of as a potential suspect in a criminal case. -->

---
## Making hypotheses

<span style="display:block; height:10px;"></span>

<div style="font-size: 80%">

- The outcomes in the intervention and the control group are different
- The proportion of an event in the intervention and control group is different

</div>

--- 
### Exercise #1

<div style="font-size: 90%">

:question: &nbsp;&nbsp;&nbsp; Suppose our hypothesis is that everyone who lives beyond 90 years  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of age is a non-smoker

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To investigate this hypothesis, it is easier to:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) <u>Prove the hypothesis</u>  by finding every single person aged 90 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or older and verifying that all of them are non-smokers
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) <u>Refute the hypothesis</u>  by finding just one person aged 90 or 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; older who is a smoker

</div>


---
### The falsification principle and the null hypothesis

<span style="display:block; height:10px;"></span>

<div style="font-size: 80%">

- The outcomes in the intervention and the control group are <s>different</s> **the same**
- The proportion of an event in the intervention and control group is <s>different</s> **the same**

</div>

<!-- 
Nei pazienti con COVID-19 e sindrome da distress respiratorio acuto moderato o grave (ARDS), desametasone è efficace nell’aumentare il numero di giorni di respirazione autonoma?

Vogliamo rispondere a questa domanda perche' dobbiamo decidere se dobbiamo iniziare ad aggiungere dexametasone endovenoso per trattare i nostri pazienti con COVID.

Ogni studio inizia con un'ipotesi, quella che viene chiamata "domanda di ricerca"
Questo e' cosa ci aspettiamo di poter concludere come risultato del nostro test statistico 

Un'ipotesi puo' essere definita come una congettura su una o piu' popplaioni 

Tuttavia quello che andiamo a testaere e' un'affermazione diversa, il suo opposto: sono dexamethasone e la cura standard uguali? 

È più semplice trovare evidenze contro un’ipotesi piuttosto che evidenze a favore

Il metodo scientifico si basa sulla falsificazione delle ipotesi (K. Popper), infatti il fatto di aver trovato dell'evidenza in favore di un'ipotesi non vuold dire che non sara' mai possibile trovare ulteriore evidenza che la renda falsa -->


---
### Exercise #2

<!-- <span style="display:block; height:1px;"></span> -->

<center>
<img src="./img/sampling/abstract_ex1.png" img height="180px" border="4px"/>
</center>

<div style="font-size: 70%">

:question: &nbsp;&nbsp;&nbsp; Which is the null hypothesis of this study?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Dexamethasone plus standard care is  **more  effective** than standard care alone 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Dexamethasone plus standard care is  **less  effective** than standard care alone 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Dexamethasone plus standard care is **as effective** as standard care alone 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) Dexamethasone plus standard care is not a **as effective** as  standard care alone 

</div>


<span style="display:block; height:30px;"></span>

<div style="font-size: 50%" align="right">

Tomazini, B.M., *et al.*, Effect of dexamethasone on days alive and ventilator-free in patients with moderate or severe acute respiratory distress syndrome and COVID-19: the CoDEX randomized clinical trial.", JAMA, 2020, doi:10.1001/jama.2020.17021
</div>

---
### Exercise #3

<!-- <span style="display:block; height:1px;"></span> -->

<center>
<img src="./img/sampling/abstract_ex1.png" img height="180px" border="4px"/>
</center>

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; How do you define the null hypothesis in this study?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) $\mu_{\text{c}} - \mu_{\text{i}} = 0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) $\mu_{\text{c}} - \mu_{\text{i}} \neq 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) $\bar{x}_\text{c}-\bar{x}_\text{i} = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) $\bar{x}_\text{c}-\bar{x}_\text{i} \neq 0$

</div>



</div>
</div>

---
## Making hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}=151, \bar{x}_{\text{i}}=6.6, s_{\text{i}}=10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}=148, \bar{x}_{\text{c}}=4.0, s_{\text{c}}=8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow \text{Null hypothesis} \text{ } (\mathcal{H}_0)$

</div>

<!-- Il metodo statistico formalizza questa idea (È più semplice trovare evidenze contro un’ipotesi piuttosto che evidenze a favore) attraverso l’ipotesi nulla, 

HO ci dice che non ci sono differenze. Dexamethasome ha la stessa efficacia della terapia standard e non aumenta il numero di giorni di respirazione autonoma.

L’ipotesi nulla (𝐻_0 )  è l’ipotesi considerata vera finché non vengono presentate delle prove (evidenza empirica) per mostrare che non lo è

come per i dinosauri: non ganno piume sino a che non ne troviamo uno che ce l'ha

Non possiamo provare una teoria, ma possiamo falsificare delle affermazioni -->

---
## Making hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}=151, \bar{x}_{\text{i}}=6.6, s_{\text{i}}=10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}=148, \bar{x}_{\text{c}}=4.0, s_{\text{c}}=8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}}  = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow \text{Null hypothesis} \text{ } (\mathcal{H}_0)$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \neq 0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow \text{Alternative hypothesis} \text{ } (\mathcal{H}_1/\mathcal{H}_A)$

</div>

<!-- e l'ipotesti alternativa (la nostra congettura).
Le due ipotesi sono complementari: insieme esauriscono tutte i possibili valori assunti dal parametro studiato

ATtENZIONE: com il test di ipotesi non si fa la DIMOSTRAZIONE di un'ipotesi, si ha semplicemente un'indicazione sul fatto che l'ipotesi sia o meno supportata dai dati.

Non rifiutando l'ipotesi nulla, non diciamo che essa sia vera, ma che potrebbe essere vera 

ATTENZIONE ad un ultimo punto: i dati su cui andiamo a testare la nostra ipotesi sono quelli di un campione, ma l'ipotesi viene fatta sull'intera popolazione -->

---
### Exercise #4

<span style="display:block; height:1px;"></span>

<div style="font-size: 90%">

:question: &nbsp;&nbsp;&nbsp; The fact that the null hypothesis and the alternative hypothesis  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; are mutually exclusive means that if the null hypothesis is true, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  the alternative hypothesis

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) must also be true
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) may be either true or false
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) must be false
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) depends on the alternative hypothesis


</div>

<span style="display:block; height:30px;"></span>


---
## Testing hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/jama_network.png" img height="170px" border="4px"/>
</center>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 151, \text{ } \text{ } \text{ } \text{ } \bar{x}_{\text{i}}= 6.6, \text{ } \text{ } \text{ }  s_\text{i} = 10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 148, \text{ } \text{ }  \text{ } \text{ }  \bar{x}_{\text{c}}= 4.0, \text{ } \text{ }  s_\text{c} = 8.7$ 

</div>

<span style="display:block; height:1px;"></span>

<div style="font-size: 50%" align="right">

<br/> Tomazini B.M., *et al.*, *Effect of Dexamethasone on Days Alive and Ventilator-Free in Patients With <br/>Moderate or Severe Acute Respiratory Distress Syndrome and COVID-19*, JAMA, 2020

</div>

---
## Testing hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

<div class="columns">
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}=151, \bar{x}_{\text{i}}=6.6, s_{\text{i}}=10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}=148, \bar{x}_{\text{c}}=4.0, s_{\text{c}}=8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$ &nbsp;&nbsp;&nbsp; $\leftarrow$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $\bar{x}_{\text{c}} - \bar{x}_{\text{i}} = 6.6 - 4.0 = 2.6$

</div>
<div>

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/hypothesis_testing/Day_ventilation_free_distribution_by_treatment.png" img height="380px" border="0px"/>
</center>

</div>
</div>

</div>

---
### Exercise #5

<span style="display:block; height:1px;"></span>

<div style="font-size: 90%">

:question: &nbsp;&nbsp;&nbsp; Even if the null hypothesis were true, the difference between 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the means might not be exactly zero because of

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) the null hypothesis being formulated imprecisely
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) individual differences
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) measurement errors
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) if the null hypothesis is true, the difference is always zero

</div>

<span style="display:block; height:70px;"></span>

---
## Testing hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care


<div class="columns">
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}=151, \bar{x}_{\text{i}}=6.6, s_{\text{i}}=10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}=148, \bar{x}_{\text{c}}=4.0, s_{\text{c}}=8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$ &nbsp;&nbsp;&nbsp; $\leftarrow$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{c}} - \bar{x}_{\text{i}} = 6.6 - 4.0 = 2.6$

</div>
<div>

<span style="display:block; height:50px;"></span>

<center>
<img src="./img/hypothesis_testing/Delta_day_ventilation_free.png" img height="130px" border="0px"/>
</center>

</div>
</div>

<span style="display:block; height:10px;"></span>

:question: &nbsp;&nbsp;&nbsp; What is the probability of observing a difference of 2.6 days
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  if $\mu_{\text{c}} - \mu_{\text{i}} = 0$?

</div>

<!-- Se &egrave; abbastanza probabile, tipo 1 caso su 10, vuol dire che e' abbastanza vicino, se invece e' 1 su 1000 allora e' alquanto improbabile, e di conseguenza vuol dire che e' "sufficientemente lontano".

Se vi dico probabilita' di osservare, quale argomento passato vi viene in mente? -->

---
## Let's take a step back


<div style="font-size: 92%" >

1. The Normal distribution is defined by its mean $\mu$ and standard deviation $\sigma$ and represents a probability distribution
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp;&nbsp; Area under the curve $\equiv$  probability $\mathcal{P}$

2. Sampling distributions (including that of the difference between means) follow a Normal distribution according to the Central Limit Theorem

</div>

<div style="font-size: 90%" align="right">

For the difference of means:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (\mu_1 - \mu_2, \frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2})$ with 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\sqrt{ \frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2} } \text{ }\text{ }\rightarrow$ &nbsp; standard error

</div>

---
## Testing hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care


<div class="columns">
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}=151, \bar{x}_{\text{i}}=6.6, s_{\text{i}}=10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}=148, \bar{x}_{\text{c}}=4.0, s_{\text{c}}=8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$ &nbsp;&nbsp;&nbsp; $\leftarrow$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{c}} - \bar{x}_{\text{i}} = 6.6 - 4.0 = 2.6$

</div>
<div>

<span style="display:block; height:50px;"></span>

<!-- <center>
<img src="./img/hypothesis_testing/Delta_day_ventilation_free.png" img height="100px" border="4px"/>
</center> -->

</div>
</div>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (\mu_{\text{c}} - \mu_{\text{i}}, \frac{\sigma_c^2}{n_c} + \frac{\sigma_i^2}{n_i}) \text{  } \rightarrow  \text{  } \mu_{\text{c}} - \mu_{\text{i}} = 0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $\hat{\text{SE}}^{(*)}= \sqrt{\frac{s_\text{c}^2}{n_\text{c}} + \frac{s_\text{i}^2}{n_\text{i}}} = 1.08$ 

</div>

<div style="font-size: 50%" >

<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $^{(*)}$ In reality, we don't know $\sigma$, only $s$. Therefore, we'll use a Student's $t$ with $\text{df} = (n_\text{c} + n_\text{i} - 2)$, which we'll approximate to $z$

</div>

---
## Testing hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

</div>

<div class="columns">
<div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}=1.08$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{c}} - \bar{x}_{\text{i}} = 6.6 - 4.0 = 2.6$

:question: &nbsp;&nbsp;&nbsp; What is the probability of 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; observing a difference of 2.6 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; days if $\mu_{\text{c}} - \mu_{\text{i}} = 0$?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{(\bar{x}_{\text{c}} - \bar{x}_{\text{i}}) - (\mu_{\text{c}} - \mu_{\text{i}})}{\hat{SE}} = \frac{2.6-0}{1.08} = 2.4$


</div>


</div>
<div>


<center>
<img src="./img/hypothesis_testing/Delta_day_ventilation_free_normale_standard.png" img height="450px" border="0px"/>
</center>

</div>
</div>


---
## Testing hypotheses

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

</div>

<div class="columns">
<div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}=1.08$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{c}} - \bar{x}_{\text{i}} = 6.6 - 4.0 = 2.6$

:question: &nbsp;&nbsp;&nbsp; What is the probability of 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; observing a difference of 2.6 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; days if $\mu_{\text{c}} - \mu_{\text{i}} = 0$?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = 2.4 \rightarrow \mathcal{P} = 2 \times 0.008 = 0.016$


</div>

</div>
<div>

<center>
<img src="./img/hypothesis_testing/Delta_day_ventilation_free_normale_standard.png" img height="450px" border="0px"/>
</center>

</div>
</div>


<!-- P = 1.4e-16 

Usando il P-value, che ci dice quanto sono improbabili i risultati ottenuti da questo campione dato che l'ipotesi nulla &egrave; vera.

Un P-value molto piccolo ci dice quindi che sia molto improbabile che H0 sia vera dandoci una forte ragione per dubitare che le due medie siano uguali 

-->


---
## P-value

<span style="display:block; height:10px;"></span>

<div style="font-size: 90%" >

:dart: &nbsp;&nbsp;&nbsp; The P-value measures the discrepancy between the data and $\mathcal{H}_0$,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and correspond to the probability of observing a result at least as
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extreme as the one obtained, assuming  $\mathcal{H}_0$  is true

</div>

<span style="display:block; height:3px;"></span>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{P-value} = 0.5 \rightarrow 50\% \rightarrow 1 \text{ sample out of } 2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{P-value} = 0.1 \rightarrow 10\% \rightarrow 1 \text{ sample out of } 10$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{P-value} = 0.05 \rightarrow 5\% \rightarrow 1 \text{ sample out of } 20$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{P-value} = 0.01 \rightarrow 1\% \rightarrow 1 \text{ sample out of } 100$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{P-value} = 0.005 \rightarrow 0.5\% \rightarrow 1 \text{ sample out of } 200$

</div>

 <!-- ci dice quanto e' probabile fare un errore (il peso alla nascita e' diverso) se accettiamo l'ipotesi nulla 
  
  Se p-value = 0.02
  Se l’ipotesi nulla fosse vera, la probabilità di osservare il risultato che abbiamo ottenuto, o una differenza ancora maggiore, sarebbe solo dell’2%
  Se il farmaco non fosse efficace (ipotesi nulla fosse vera) solo in 2 campione ogni 100 avremmo il risultato osservato 

  In modo molto informale. L’espressione statisticamente significativo vuol dire che sono state raccolte prove sufficienti per rifiutare l’ipotesi nulla 
  
 -->

---
## P-value e statistical significance

<span style="display:block; height:1px;"></span>

<div style="font-size: 90%" >

:dart: &nbsp;&nbsp;&nbsp; The P-value measures the discrepancy between the data and $\mathcal{H}_0$,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and correspond to the probability of observing a result at least as
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extreme as the one obtained, assuming  $\mathcal{H}_0$  is true

</div>

<!-- <span style="display:block; height:1px;"></span> -->

<div style="font-size: 90%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If the P-value is smaller than a pre-specified significance level $\alpha$,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we consider the observed difference to be statistically significant

<!-- <span style="display:block; height:1px;"></span> -->

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \text{ or } 0.01$

</div>


<!-- 
In modo molto informale. L’espressione statisticamente significativo vuol dire che sono state raccolte prove sufficienti per rifiutare l’ipotesi nulla 

Ronald Fisher used P < 0.05 and P < 0.01 as convenient critical thresholds for indicating significance, and produced tables of the critical values of test statistics needed to achieve these levels of significance. The popularity of these tables led to 0.05 and 0.01 becoming established conventions, although it is now recommended that exact P-values should be reported. 

The standard thresholds for declaring ‘significance’, P < 0.05 and P < 0.01, were fairly arbitrary choices by Ronald Fisher for his tables, back in the days when calculating exact P-values was not possible using the mechanical and electrical calculators available. 

And it is important to emphasize that the exact P-value is conditional not only on the truth of the null hypothesis, but also on all other assumptions underlying the statistical model, such as lack of systematic bias, independent observations, and so on.

--->

---
## Why $\mathbf{\alpha = 0.05}$?

<div class="columns">
<div>

<!-- <span style="display:block; height:1px;"></span> -->

<div style="font-size: 75%" >

- *"The value for which P=0.05, or 1 in 20, is 1.96 or nearly 2; it is convenient to take this point as a limit in judging whether a deviation ought to be considered significant or not"* 

- *"Either there is something in the treatment, or a coincidence has occurred such as does not occur more than once in twenty trials"*

- *"If one in twenty does not seem high enough odds, we may, if we prefer it, draw the line at one in fifty (the 2 per cent. point), or one in a hundred (the 1 per cent. point)"* <!-- (1926) -->

</div>

</div>
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/hypothesis_testing/Youngronaldfisher2.jpg" img height="500px" border="0px"/>
</center>

</div>
</div>

<!-- 
Source point 1 and 3: Fisher RA. The arrangement of field experiments. Journal of the Ministry of Agriculture of Great Britain. 1926;33:503–513, https://link.springer.com/chapter/10.1007/978-1-4612-4380-9_8

Source point 2: Fisher RA. Statistical methods and scientific inference. Oliver and Boyd; Edinburgh: 1956, https://archive.org/details/statisticalmetho0000fish

1914, Karl Pearson published his Tables for Statisticians & Biometricians 

Fisher published Statistical
Methods for Research Workers (SMRW) in 1925, he included tables that gave the value of the
random variable for specially selected values ofP

Kendall mentioned that Fisher produced the tables of significance levels to save space and to avoid copyright problems with Karl Pearson, whom he disliked in Foundations of Statistical Inference, 1971

-->

---
### Exercise #6

<!-- <span style="display:block; height:1px;"></span> -->

<div style="font-size: 90%" >

:question: &nbsp;&nbsp;&nbsp; When a result in a study is described as "statistically significant",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; it means that

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) the null hypothesis has been rejected
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) the null hypothesis has **not** been rejected
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) the observed result is probably due to sampling errors
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) the observed result is probably **not** due to sampling errors
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) the p-value is lower than the significance level $\alpha$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f) the p-value is greater than the significance level $\alpha$

</div>

<span style="display:block; height:1px;"></span>

---
### Exercise #7

<span style="display:block; height:5px;"></span>

<div style="font-size: 90%" >

:question: &nbsp;&nbsp;&nbsp; If one **doesn't** reject the null hypothesis it means that...

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) the null hypothesis is true
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) the null hypothesis is false
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) the observations are compatible with the null hypothesis
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) the observations aren't compatible with the null hypothesis
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) it depends on the research question
</div>

<span style="display:block; height:20px;"></span>


---
## Hypothesis testing, one step at a time

<!-- This whole process has become known as Null Hypothesis Significance Testing (NHST) and, as we shall see below, it has become a source of major controversy. But first we should examine how Fisher’s ideas are used in practice.

Ronald Fisher was an extraordinary, but difficult, man. He was extraordinary because he is regarded as a pioneering figure in two distinct fields – genetics and statistics. Yet he had a notorious temper and could be extremely critical of anyone who he felt questioned his ideas, while his support for eugenics and his public criticism of the evidence for the link between smoking and lung cancer damaged his standing. His personal reputation has suffered as his financial connections with the tobacco industry have been revealed, but his scientific reputation is undiminished, as his ideas find repeated new applications in the analysis of large data sets. -->

---
## Hypothesis testing, one step at a time

<div style="font-size: 90%" >

1. Define a null hypothesis $(\mathcal{H_0})$

</div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dexamethasone plus standard care is  **as effective as** standard care

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H_0} : \mu_\text{c} - \mu_\text{i} = 0$

</div>

---
## Hypothesis testing, one step at a time

<div style="font-size: 90%" >

1. Define a null hypothesis $(\mathcal{H_0})$
2. Choose a test statistic that estimates something that, if extreme enough, would lead one to doubt $\mathcal{H_0}$

</div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $t$-test$^{(*)}$ for differences in mean

</div>

<span style="display:block; height:180px;"></span>

<div style="font-size: 50%" >

$^{(*)}$ Formally, we use the $t$-test for comparing means rather than the $z$-test because the population standard deviation is unknown, so we estimate it using the sample standard deviation

</div>

---
## Hypothesis testing, one step at a time

<div style="font-size: 90%" >

1. Define a null hypothesis $(\mathcal{H_0})$
2. Choose a test statistic that estimates something that, if extreme enough, would lead one to doubt $\mathcal{H_0}$
3. Generate the sampling distribution of the chosen test statistic, assuming $\mathcal{H_0}$ to be true

</div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (\mu_\text{c} - \mu_\text{i}, \text{SE})$, with $\mu_{\text{c}} - \mu_{\text{i}} = 0 \text{ and } \hat{\text{SE}}= \sqrt{\frac{s_\text{c}^2}{n_\text{c}} + \frac{s_\text{i}^2}{n_\text{i}}}$

</div>

---
## Hypothesis testing, one step at a time

<div style="font-size: 90%" >

1. Define a null hypothesis $(\mathcal{H_0})$
2. Choose a test statistic that estimates something that, if extreme enough, would lead one to doubt $\mathcal{H_0}$
3. Generate the sampling distribution of the chosen test statistic, assuming $\mathcal{H_0}$ to be true
4. Check whether the observed statistic lies in the tails of this distribution, and calculate a probability (P-value) for this event

</div>

<div class="columns">
<div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{P} = 2 \times 0.0082 = 0.0164$

</div>

</div>
<div>

<img src="./img/hypothesis_testing/Delta_day_ventilation_free_normale_standard.png" img height="180px" border="0px" align="left"/>

</div>
</div>


<!-- P-value: the probability, were the null hypothesis true, of observing such an extreme statistic. The P-value is therefore a particular tail-area. -->

---
## Hypothesis testing, one step at a time

<div style="font-size: 90%" >

1. Define a null hypothesis $(\mathcal{H_0})$
2. Choose a test statistic that estimates something that, if extreme enough, would lead one to doubt $\mathcal{H_0}$
3. Generate the sampling distribution of the chosen test statistic, assuming $\mathcal{H_0}$ to be true
4. Check whether the observed statistic lies in the tails of this distribution, and calculate a probability (P-value) for this event
5. Declare the result statistically significant if the P-value is below some critical threshold $\alpha$

</div>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{P} = 2 \times 0.0082 = 0.0164 < \alpha = 0.05$ &nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp; one rejects $\mathcal{H_0}$

</div>
<!-- P-value measures how likely it is that we would have observed such an extreme value were the null hypothesis really true. -->


---
## Share the conclusions

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone combined with standard care is not as effective as  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard care alone. We observe a statistically significant difference
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of 2.6 days between the two treatments (P = 0.016).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What is the uncertainty associated with this estimate?

</div>

---
## Share the conclusions

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone combined with standard care is not as effective as  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard care alone. We observe a statistically significant difference
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of 2.6 days between the two treatments (P = 0.016).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What is the uncertainty associated with this estimate?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.  $\hat{\text{SE}}= \sqrt{\frac{s_\text{c}^2}{n_\text{c}} + \frac{s_\text{i}^2}{n_\text{i}}} = 1.08$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.  $95\% \text{ ME} = 2 \times \hat{\text{SE}} = 2 \times 1.08 = 2.16$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.  $\text{95\% CI} = (\bar{x}_{\text{i}} - \bar{x}_{\text{c}}) - \text{95\% ME} \text{ } ; \text{ } (\bar{x}_{\text{i}} - \bar{x}_{\text{c}}) + \text{95\% ME} =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (2.6 - 2.16 \text{ } ; \text{ } 2.6+2.16 ) = (0.44 \text{ } ; \text{ } 4.78)$

</div>

---
### Hypothesis Testing and Confidence Intervals

<div style="font-size: 80%" >

:dart: &nbsp;&nbsp;&nbsp; The 95% confidence interval is the set of null hypotheses that would 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not be rejected at a significance level of  $\alpha = 0.05$

</div>

<div class="columns">
<div>

<span style="display:block; height:1px;"></span>



<span style="display:block; height:190px;"></span>

<div style="font-size: 78%" align="right">

| Confidence level | $\alpha$ | $\alpha/2$ |
| ----: | ----- | ---- | 
| 95% | 5% | 2.5% | 

</div>

</div>
<div>


<center>
<img src="./img/confidence_intervals/alpha_level.png" img height="450px" border="0px"/>
</center>

</div>
</div>

---
### Hypothesis Testing and Confidence Intervals

<div style="font-size: 80%" >

:dart: &nbsp;&nbsp;&nbsp; The 95% confidence interval is the set of null hypotheses that would 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not be rejected at a significance level of  $\alpha = 0.05$

</div>

<div class="columns">
<div>

<div style="font-size: 80%" >

<span style="display:block; height:10px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In a two-sided test,  $\text{P} <0.05$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if the 95% confidence interval 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; does not include the null 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  hypothesis (usually zero)

</div>


</div>
<div>

<center>
<img src="./img/hypothesis_testing/rifiuto_non_rifiuto.png" img height="450px" border="0px"/>
</center>

</div>
</div>

<!-- This intimate link between hypothesis testing and confidence intervals should stop people misinterpreting results that are not statistically significantly different from 0 – this does not mean that the null hypothesis is actually true, but simply that a confidence interval for the true value includes 0. Unfortunately, as we shall see later, this lesson is often ignored. -->

---
## Share the conclusions


<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone combined with standard care is not as effective as  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard care alone. We observe a statistically significant difference
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of 2.6 days (95% CI = 0.44 ; 4.78) between the two treatments 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (P = 0.016).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What is the clinical significance of the treatment, considering that
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  the true population difference could be as small as 0.44 days?

</div>


<span style="display:block; height:20px;"></span>


---
## Effect size


<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; $\text{Cohen's } d=  |\frac{\bar{x}_{\text{c}} - \bar{x}_{\text{i}}}{s_p}|$  &nbsp;&nbsp; con  &nbsp;&nbsp; $s_p = \sqrt{\frac{(n_i - 1) \times s_i + (n_c - 1) \times s_c}{(n_i - 1) + (n_c - 1)}}$

</div>

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>



</div>
<div>

<span style="display:block; height:10px;"></span>



</div>
</div>

---
## Effect size


<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; $\text{Cohen's } d=  |\frac{\bar{x}_{\text{c}} - \bar{x}_{\text{i}}}{s_p}|$  &nbsp;&nbsp; with  &nbsp;&nbsp; $s_p = \sqrt{\frac{(n_i - 1) \times s_i + (n_c - 1) \times s_c}{(n_i - 1) + (n_c - 1)}}$

</div>

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/hypothesis_testing/Small_cohen_d.png" img height="370px" border="0px"/>
</center>

</div>
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" align="right">

| d | Interpretation |
| ----:    | :---- |
0.2| Small
&nbsp;&nbsp;&nbsp; | 
&nbsp;&nbsp;&nbsp; | 

</div>

</div>
</div>

---
## Effect size

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; $\text{Cohen's } d=  |\frac{\bar{x}_{\text{c}} - \bar{x}_{\text{i}}}{s_p}|$  &nbsp;&nbsp; with  &nbsp;&nbsp; $s_p = \sqrt{\frac{(n_i - 1) \times s_i + (n_c - 1) \times s_c}{(n_i - 1) + (n_c - 1)}}$

</div>

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/hypothesis_testing/Medium_cohen_d.png" img height="370px" border="0px"/>
</center>

</div>
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" align="right">

| d | Interpretation |
| ----:    | :---- |
0.2| Small
0.5 | Medium
&nbsp;&nbsp;&nbsp; | 

</div>

</div>
</div>

---
## Effect size


<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; $\text{Cohen's } d=  |\frac{\bar{x}_{\text{c}} - \bar{x}_{\text{i}}}{s_p}|$  &nbsp;&nbsp; with  &nbsp;&nbsp; $s_p = \sqrt{\frac{(n_i - 1) \times s_i + (n_c - 1) \times s_c}{(n_i - 1) + (n_c - 1)}}$

</div>

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/hypothesis_testing/Large_cohen_d.png" img height="370px" border="0px"/>
</center>

</div>
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" align="right">

| d | Interpretation |
| ----:    | :---- |
0.2| Small
0.5 | Medium
0.8 | Large


</div>

</div>
</div>

---
## Effect size

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone combined with standard care is not as effective as  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard care alone. We observe a statistically significant difference
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of 2.6 days (95% CI = 0.44 ; 4.78) between the two treatments 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (P = 0.016).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{Cohen's } d=  |\frac{\bar{x}_{\text{c}} - \bar{x}_{\text{i}}}{s_p}|$  &nbsp;&nbsp; with  &nbsp;&nbsp; $s_p = \sqrt{\frac{(n_i - 1) \times s_i + (n_c - 1) \times s_c}{(n_i - 1) + (n_c - 1)}}$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $s_p = \sqrt{\frac{(151 - 1) \times 10 + (148 - 1) \times 8.7}{(151 - 1) + (148 - 1)}} = 3$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $d =  \frac{2.6}{3} = 0.85$ &nbsp;&nbsp; $\rightarrow$  &nbsp;&nbsp; Large 

</div>

---
## Share the conclusions

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; Dexamethasone combined with standard care is not as effective as  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard care alone. We observe a statistically significant difference
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of 2.6 days (95% CI = 0.44 ; 4.78) between the two treatments 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (P = 0.016).  This suggests that the combined treatment has a large 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; effect on the number of ventilator-free days (Cohen's $d$ = 0.85).

</div>



---
## Share (and interpret) the conclusions

<div style="font-size: 90%" >

- **Hypothesis testing:** is the procedure used to evaluate whether the observed data provide sufficient evidence to support a hypothesis

- **Confidence interval:** quantifies the uncertainty around a statistic and estimates a range of plausible values where the true population value is likely to lie

- **Effect size:** The magnitude of the study results, indicating whether the findings are large enough to be meaningful in the real world

</div>

<!-- Each of these statistical procedures helps researchers give meaning to the results of asignificance test -->

---
## Share (and interpret) the conclusions

<div style="font-size: 90%" >

**Scenario 1**

- Hypothesis testing: P value $< \alpha$
- Confidence interval: very narrow
- Effect size: medium or large

</div>

<span style="display:block; height:40px;"></span>

<div style="font-size: 90%" align="right">

We have three pieces of evidence supporting<br/> the significance of the result

</div>

---
## Share (and interpret) the conclusions

<div style="font-size: 90%" >

**Scenario 2**

- Hypothesis testing: P value $< \alpha$
- Confidence interval: very narrow
- Effect size: very small or small

</div>

<span style="display:block; height:40px;"></span>

<div style="font-size: 90%" align="right">

We have two pieces of evidence supporting the significance <br/> of the result, but the clinical significance is negligible

</div>

---
## Share (and interpret) the conclusions

<div style="font-size: 90%" >

**Scenario 3**

- Hypothesis testing: P value $> \alpha$
- Confidence interval: very large
- Effect size: very small or small

</div>

<span style="display:block; height:40px;"></span>

<div style="font-size: 90%" align="right">

We have three pieces of evidence supporting<br/> the lack of significance of the result

</div>

---
## Share (and interpret) the conclusions

<div style="font-size: 90%" >

**Scenario 4**

- Hypothesis testing: P value $> \alpha$
- Confidence interval: very large
- Effect size: large

</div>

<span style="display:block; height:40px;"></span>

<div style="font-size: 90%" align="right">

Likely, our sample is too small to determine <br/> with confidence whether to reject the null hypothesis

</div>



---
### $t$-test

<div style="font-size: 90%" >

<!-- :pushpin: &nbsp;&nbsp;&nbsp; Which is the *true* difference in proportion between two groups? -->

<span style="display:block; height:1px;"></span>


:pushpin: &nbsp;&nbsp;&nbsp; For the difference between two means
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (\mu_{\text{c}} - \mu_{\text{i}}, \frac{\sigma_c^2}{n_c} + \frac{\sigma_i^2}{n_i})$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}= \sqrt{\frac{s_\text{c}^2}{n_\text{c}} + \frac{s_\text{i}^2}{n_\text{i}}}$ 

<span style="display:block; height:1px;"></span>

:pushpin: &nbsp;&nbsp;&nbsp; For the difference between two proportions
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (\pi_{\text{c}} - \pi_{\text{i}}, \frac{\pi_{\text{c}} \times (1-\pi_{\text{c}})}{n_{\text{c}}}+\frac{\pi_{\text{i}} \times (1-\pi_{\text{i}})}{n_{\text{i}}})$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{\bar{p}_{\text{c}} \times (1-\bar{p}_{\text{c}})}{n_{\text{c}}}+\frac{\bar{p}_{\text{i}} \times (1-\bar{p}_{\text{i}})}{n_{\text{i}}}}$

</div>


---
### Exercise #8

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/nejm.png" img height="140px" border="4px"/>
</center>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (\pi_{\text{c}} - \pi_{\text{i}}, \frac{\pi_{\text{c}} \times (1-\pi_{\text{c}})}{n_{\text{c}}}+\frac{\pi_{\text{i}} \times (1-\pi_{\text{i}})}{n_{\text{i}}})$ 


</div>



<span style="display:block; height:1px;"></span>

<div style="font-size: 50%" align="left">

<br/> Connor, E.M. *et al.*, *Reduction of Maternal-Infant Transmission of Human Immunodeficiency Virus Type 1 with Zidovudine Treatment*, NEJM, 1994

</div>

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

<span style="display:block; height:50px;"></span>

<div align="right">

Let's use another test to compare differences in proportion!

</div>

</div>

<!-- Proviamo ora a calcolare se l'uso di zidovudine influisce sulla trasmissione del virus dell'HIV da madre a bambino usando un test diverso, il Pearson\s chi2, un testo usato comunemente per testare le differenze tra variabili categoriche

Di nuovo andiamo a definire H0 come proporzione di bambini che contraggio il virus essere la stessa tra chi ha assunto il medicinale e chi no (ipotesi di indipendenza) e H1 proporzione di infetti diversi tra chi a preso il farmaco o meno (ipotesi di associazione)

non le riporto nelle slide perche' tra poco diventeranno parecchio piene! -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Define a null hypothesis $(\mathcal{H_0})$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Zidovudine is **as effective as** placebo to reduce mother-infant 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HIV transmission
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ &nbsp; $\mathcal{H}_0: \pi_\text{c} - \pi_\text{i} = 0$

</div>


---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Choose a test statistic that estimates something that, if extreme 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enough, would lead one to doubt $\mathcal{H_0}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ &nbsp; Pearson's $\chi^2$ test for categorical data

</div>

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Generate the sampling distribution of the chosen test statistic, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assuming $\mathcal{H_0}$ to be true

</div>

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Generate the sampling distribution of the chosen test statistic, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assuming $\mathcal{H_0}$ to be true


<span style="display:block; height:10px;"></span>

<div class="columns">
<div>

:question: &nbsp;&nbsp;&nbsp; Let's fill this contingency table

</div>
<div>


<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |   |    |    |
| Placebo |   |    |  |
| Total |  |   |  |

</center>

</div>
</div>

</div>

<!-- Andiamo a definire H0 come proporzione di bambini che muoiono in Bristol essere la stessa che nel resto dello UK (ipotesi di indipendenza) e H1 proporzione di morti diversa (ipotesi di associazione)

non le riporto nelle slide perche' tra poco diventeranno parecchio piene! -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  \bar{p}_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  \bar{p}_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Generate the sampling distribution of the chosen test statistic, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assuming $\mathcal{H_0}$ to be true

</div>

<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>



</div>
</div>



<!-- Andiamo innanzitutto a costruirci una tabella di contingenza, dove andiamo ad indicare le dimensioni dei due campioni -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

</div>

<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>



</div>
</div>

<!-- Se non ci fosse differenza tra i due gruppi (ovvero se H0 fosse vera), la proporzione di infetti nei due campioni sarebbe la stessa, e sarebbe la stessa osservata nel Total -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

</div>


<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>


<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

</div>

<center>

<div style="font-size: 68%" >

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  180*0.146 |    |  180  |
| Placebo | 183*0.146 |    | 183 |
| Total | 53 | 310  | 363 |

</div>

</center>

</div>

</div>
</div>

<!-- Andiamo quindi a costruire una nuova tabella di contingenza, che non rappresenta piu' le condizioni osservate ma quelle attese se la nosrra ipotesi fosse vera -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

</div>


<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  26.28 |    |  180  |
| Placebo | 26.72 |    | 183 |
| Total | 53 | 310  | 363 |

</center>

</div>

</div>
</div>

<!-- Attenzione che le somme ai margini devono essere le stesse del dataset originario  -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

</div>


<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  26.28 | 153.72   |  180  |
| Placebo | 26.72 |  156.28  | 183 |
| Total | 53 | 310  | 363 |

</center>

</div>

</div>
</div>

<!-- L'idea alla ase del chi2 test e' che Tanto maggiore è la differenza tra frequenze osservate ed attese, tanto meno plausibile è l'ipotesi nulla, cioè tanto più improbabile è che la frequenza di decessi sia indipendente dall'ospedale dove e' avvenuto l'intervento -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

</div>


<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  26.28 | 153.72   |  180  |
| Placebo | 26.72 |  156.28  | 183 |
| Total | 53 | 310  | 363 |

</center>

</div>

</div>
</div>

<div style="font-size: 70%" >

$\chi^2 = \sum \frac{(Observed- Expected)^2}{Expected} = \frac{(13-26.28)^2}{26.28} + \frac{(167-153.72)^2}{153.72} +\frac{(40-26.72)^2}{26.72} + \frac{(143-156.28)^2}{156.28} = 15.57$

</div>

<!-- Andiamo quindi a calcolarci queste differenze fra la i valori attesi e quelli osservati secondo questa formula -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

</div>


<div class="columns">
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  13 |  167  |  180  |
| Placebo | 40  | 143   | 183 |
| Total | 53 |  310 | 363 |

</center>

</div>

</div>
<div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

<center>

| Treatment/Infected | Yes | No | Total |
| ----: | -----: | ----: | ----: |
| Zidovudine |  26.28 | 153.72   |  180  |
| Placebo | 26.72 |  156.28  | 183 |
| Total | 53 | 310  | 363 |

</center>

</div>

</div>
</div>

<div style="font-size: 70%" >

$\chi^2 = \sum \frac{(Observed- Expected)^2}{Expected} = \frac{(13-26.28)^2}{26.28} + \frac{(167-153.72)^2}{153.72} +\frac{(40-26.72)^2}{26.72} + \frac{(143-156.28)^2}{156.28} = 15.57$

$\text{df}= (n_\text{rows}-1) \times (n_\text{columns}-1) = 1$


</div>

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/hypothesis_testing/chitable.png" img height="190px" border="4px"/>
</center>

</div>

<div style="font-size: 75%" >

4. Check whether the observed statistic lies in the tails of this distribution, and calculate a probability (P-value) for this event

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\chi^2 = 15.57$ &nbsp;&nbsp;&nbsp; $\text{df} = 1$ &nbsp;&nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp;&nbsp; $\text{P} < 0.001 = 7.9 \times 10^{-5}$

</div>


<!-- Il chi2 e' di nuovo una distribuzione di probabilita' per cui esistono delle tavole. Come la distribuzione t, amche la chi2 e' una famiglia di distribuzioni, 1 per ogni grado di liberta'. Nel nostro caso, in cui abbiamo uan tabella 2x2 abbiamo 1 grado di liberta'. Infatti dobbiamo definire il valore di solo 3 celle perche' tutte e 4 siano definite 

I GdL sono numero di righe -1 * numero di colonne -1 -->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Is Zidovudine better than placebo to reduce mother-infant HIV transmission?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\Pi = \frac{tot_\text{infected}}{total} = \frac{53}{363} = 0.146$

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/hypothesis_testing/chitable.png" img height="190px" border="4px"/>
</center>

</div>

<div style="font-size: 75%" >

4.  Declare the result statistically significant if the P-value is below some critical threshold $\alpha$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\chi^2 = 15.57$ &nbsp;&nbsp;&nbsp; $\text{df} = 1$ &nbsp;&nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp;&nbsp; $\text{P} < 0.001 = 7.9 \times 10^{-5} < \alpha = 0.05 \rightarrow$ reject $\mathcal{H}_0$


</div>

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:pushpin: &nbsp;&nbsp;&nbsp; Does education level influences physical activity frequency?

</div>

<div style="font-size: 65%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Observed values

| | No Exercise |  Sporadic Exercise | Regular Exercise | Total
| :---- | -----: | ----: | ----: | ----- |
Primary education | |  |  | 
Secondary education |  |  | 
Bachelor/Master |  |  |  |
Doctorate | | | |
Total | | | |

</div>

<!-- E' pressoche' equivalente al z-test per confrontare due popolazioni, ,a puo' essere esteso a piu' di due gruppi e con piu' di due categorie (anche se qui ci siamo limitati ad usarne 2 per comodita' e per confronto con z-test)

ATTENSIONE: funziona bene con "grandi" sample size (>5 in each cell) -> se meno di questo uso il Fisher's test 
-->

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:pushpin: &nbsp;&nbsp;&nbsp; Does education level influences physical activity frequency?

</div>

<div style="font-size: 65%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

| | No Exercise |  Sporadic Exercise | Regular Exercise | Total
| :---- | -----: | ----: | ----: | ----- |
Primary education | $\frac{\Sigma \text{Row}_1 \times \Sigma \text{Column}_1}{\text{Total}}$ | $\frac{\Sigma \text{Row}_1 \times \Sigma \text{Column}_2}{\text{Total}}$ | $\frac{\Sigma \text{Row}_1 \times \Sigma \text{Column}_3}{\text{Total}}$ | $\Sigma \text{Row}_1$
Secondary education | $\frac{\Sigma \text{Row}_2 \times \Sigma \text{Column}_1}{\text{Total}}$ | ... | ... |  $\Sigma \text{Row}_2$
Bachelor/Master | $\frac{\Sigma \text{Row}_3 \times \Sigma \text{Column}_1}{\text{Total}}$ | ... | ... |  $\Sigma \text{Row}_3$
Doctorate  | $\frac{\Sigma \text{Row}_4 \times \Sigma \text{Column}_1}{\text{Total}}$ | ... | ... |  $\Sigma \text{Row}_4$
Total | $\Sigma \text{Column}_1$ | $\Sigma \text{Column}_2$ | $\Sigma \text{Column}_3$ | Total

</div>


<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; $\text{df} = \text{ ?}$

</div>

---
## Pearson's $\chi^2$ test

<div style="font-size: 80%" >

:pushpin: &nbsp;&nbsp;&nbsp; Does education level influences physical activity frequency?

</div>

<div style="font-size: 65%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expected values

| | No Exercise |  Sporadic Exercise | Regular Exercise | Total
| :---- | -----: | ----: | ----: | ----- |
Primary education | $\frac{\Sigma \text{Row}_1 \times \Sigma \text{Column}_1}{\text{Total}}$ | $\frac{\Sigma \text{Row}_1 \times \Sigma \text{Column}_2}{\text{Total}}$ | $\frac{\Sigma \text{Row}_1 \times \Sigma \text{Column}_3}{\text{Total}}$ | $\Sigma \text{Row}_1$
Secondary education | $\frac{\Sigma \text{Row}_2 \times \Sigma \text{Column}_1}{\text{Total}}$ | ... | ... |  $\Sigma \text{Row}_2$
Bachelor/Master | $\frac{\Sigma \text{Row}_3 \times \Sigma \text{Column}_1}{\text{Total}}$ | ... | ... |  $\Sigma \text{Row}_3$
Doctorate  | $\frac{\Sigma \text{Row}_4 \times \Sigma \text{Column}_1}{\text{Total}}$ | ... | ... |  $\Sigma \text{Row}_4$
Total | $\Sigma \text{Column}_1$ | $\Sigma \text{Column}_2$ | $\Sigma \text{Column}_3$ | Total

</div>


<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; $\text{df} = (n_\text{row}-1) \times (n_\text{column}-1) = (4 - 1) \times (3 - 1) = 3 \times 2 = 6$

</div>

---
### Exercise #9

<div style="font-size: 70%" >

:question: &nbsp;&nbsp;&nbsp; Does the area of practice influences drinking habits of Italian healthcare workers?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Out of 279, 230, and 130 healthcare professionals working in medicine, surgery, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and other wards (*e.g.*, laboratories and other hospital services), 122, 107, and 51 were 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; non-drinkers, respectively.

</div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/hypothesis_testing/chitable.png" img height="210px" border="4px"/>
</center>

</div>


<!-- in laboratories and other hospital services -->

<div style="font-size: 50%" align="left">

<br/> Albano, L. *et al.*, *Alcohol consumption in a sample of Italian healthcare workers: A cross-sectional study*, Archives of Environmental & Occupational Health, 2020

</div>


---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | -----: | ----: | 
True  | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp; | |  
False |                |  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</br>&nbsp;   | 

</center>

</div>

<!-- Their framework required specification of not only a null hypothesis, but also an alternative hypothesis which represents a more complex explanation for the data. They then considered the possible decisions after a hypothesis test, which are either to reject a null hypothesis in favour of the alternative, or not to reject the null. -->


---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :----- | :---- | 
True  |  | False <br/>positive |  
False | False <br/>negative   |   | 

</center>

</div>


<!-- Two types of mistake are therefore possible: a Type I error is made when we reject a null hypothesis when it is true, and a Type II error is made when we do not reject a null hypothesis when in fact the alternative hypothesis holds. -->


---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| Suspect is | Absolved | Convicted | 
| :---- | :----- | :---- | 
Innocent |  | One convicts an <br/>innocent  |  
Guilty | One absolve an <br/>offender |  | 

</center>

</div>

<!-- There is a strong legal analogy which is illustrated in Table 10.6 – a Type I legal error is to falsely convict an innocent person, and a Type II error is to find someone ‘not guilty’ when in fact they did commit the crime.  

Un falso positivo (o errore del primo tipo) occorre quando H0 e' corretta, ma il test conduce a un risultato significativo. E quanto e' probabile questo errore?

Se usiamo un livello si significativita' del 5% abbiamo 5% di possibilita' di dichiarare nulla H0 quando non lo &egrave;. 
-->

---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :----- | :---- | 
True  |  | Type I error |  
False | Type II error  |   | 

</center>

</div>

--- 
### Exercise #10

<div style="font-size: 90%" >

:question: &nbsp;&nbsp;&nbsp; There was a shepherd boy who repeatedly cried wolf when there   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  was no wolf. Yet, each time, villagers went to help him. Then, the  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  wolf arrived, but, when the boy cried wolf, no villager helped.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First we see an example of a... 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Type I error, then Type II error
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Type II error, then Type I error
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Null error, then alternative error
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) Alternative error, then null error

</div>


---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :----- | :---- | 
True  |  | Type I error ($\alpha$)|  
False | Type II error  |   | 

</center>

<span style="display:block; height:20px;"></span>

&nbsp;&nbsp;&nbsp; $p < \alpha \rightarrow \text{reject } \mathcal{H}_0$
&nbsp;&nbsp;&nbsp; $p \geq \alpha \rightarrow \text{does not reject } \mathcal{H}_0$

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true

</div>

---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :----- | :---- | 
True  |  | Type I error ($\alpha$)|  
False | Type II error ($\beta$) |   | 

</center>

</div>

---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :----- | :---- | 
True  |  | Type I error ($\alpha$)|  
False | Type II error ($\beta$) |  $1 - \beta$ <br/> (Statistical power) | 

</center>

<span style="display:block; height:60px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\alpha = 0.05$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $1-\beta = 0.8$


</div>

</div>


---
## The power of a study

<div style="font-size: 90%" >

<div class="columns">
<div>

<span style="display:block; height:60px;"></span>

<div style="font-size: 80%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :-----: | :----: | 
True  |  | $\alpha$ |  
False | $\beta$  |  $1 - \beta$ <br/> Power |

</center>

</div>

</div>
<div>


<center>
<img src="./img/hypothesis_testing/power.png" img height="500px" border="4px"/>
</center>

</div>
</div>


</div>

<!-- quello interessante e' il TP, op 1-beta, che e' anche la potenza di uno studio, ovvero la probabilita' di rifiutare G0 quando e' falsa -->

---
## The power of a study

<div style="font-size: 90%" >

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

:dart: &nbsp;&nbsp;&nbsp;  The power is increased by:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger $\alpha$

</div>
<div>


<center>
<img src="./img/hypothesis_testing/power_larger_alpha.png" img height="550px" border="0px"/>
</center>

</div>
</div>


</div>

<!-- - scegliere alfa piu' grande (sposta il valore critico a sx) -->

---
## The power of a study

<div style="font-size: 90%" >

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

:dart: &nbsp;&nbsp;&nbsp;  The power is increased by:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger $\alpha$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$

</div>
<div>


<center>
<img src="./img/hypothesis_testing/power_larger_effect.png" img height="550px" border="0px"/>
</center>

</div>
</div>

</div>

<!-- - spostare la curva rossa a dx (ovvero aumentare la differenz tra le medie) -->

---
## The power of a study

<div style="font-size: 90%" >

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

:dart: &nbsp;&nbsp;&nbsp;  The power is increased by:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger $\alpha$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - smaller $\sigma^2$

</div>
<div>


<center>
<img src="./img/hypothesis_testing/power_smaller_sigma.png" img height="550px" border="0px"/>
</center>

</div>
</div>

</div>

<!-- - avere le curve meno sovvrapposte, quindi con una standard deviation piu bassa -> gruppi piu' omogenei (e eterogenei tra di loro) -->



---
## The power of a study

<div style="font-size: 90%" >

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

:dart: &nbsp;&nbsp;&nbsp;  The power is increased by:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger $\alpha$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - smaller $\sigma^2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger sample size $n$

</div>
<div>


<center>
<img src="./img/hypothesis_testing/power_smaller_sigma.png" img height="550px" border="0px"/>
</center>

</div>
</div>

</div>

<!-- - avere campioni piu' grandi (piu' informazioni sulla popolazione, SE piu' piccolo, piu' precisione nelle conclusioni) -->

--- 
### Exercise #11

<div style="font-size: 90%" >

:question: &nbsp;&nbsp;&nbsp; Which of these factors can be modified to increase the statistical  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  power of a study?)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) the level of significance $\alpha$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) the difference $\mu_{\text{c}} - \mu_{\text{i}}$ &nbsp;/&nbsp;  $\pi_{\text{c}} - \pi_{\text{i}}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) the samples' $\sigma^2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) the samples' size $n$

</div>

<span style="display:block; height:50px;"></span>


---
## What’s the deal with power?

<div style="font-size: 90%" >

:dart: &nbsp;&nbsp;&nbsp; Power $= 1- \beta \rightarrow$ chance of rejecting $\mathcal{H}_0$ when is false

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$ $\longrightarrow$ larger effect size
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger sample size $n$

<span style="display:block; height:1px;"></span>

Observation #1: because any intervention likely has some real effect, by 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collecting a sufficiently large amount of data, one can 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; always find a statistically significant result. 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The effect size, however, will be extremely tiny and 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; probably clinically irrelevant

</div>

<!-- Lo abbiamo gia' visto parlando di effect size -->

---
## What’s the deal with power?

<div style="font-size: 90%" >

:dart: &nbsp;&nbsp;&nbsp; Power $= 1- \beta \rightarrow$ chance of rejecting $\mathcal{H}_0$ when is false

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$ $\longrightarrow$ larger effect size
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger sample size $n$

<span style="display:block; height:1px;"></span>

Observation #2: if one doesn't collect a sufficiently large amount of data, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; they can only detect very large effect sizes

</div>

---
## What’s the deal with power?

<div style="font-size: 90%" >

:dart: &nbsp;&nbsp;&nbsp; Power $= 1- \beta \rightarrow$ chance of rejecting $\mathcal{H}_0$ when is false

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$ $\longrightarrow$ larger effect size
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger sample size $n$

<span style="display:block; height:1px;"></span>

Observation #2: if one doesn't collect a sufficiently large amount of data, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; they can only detect very large effect sizes

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\longrightarrow$ they may conclude that *"there was no statistically* 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *significant difference between groups”*, when actually
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; there was insufficient data to detect any but the 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; largest difference: **the study is underpowered**.

</div>

---
## What’s the deal with power?

<div style="font-size: 90%" >

**Scenario 4**

- Hypothesis testing: P value $> \alpha$
- Confidence interval: very large
- Effect size: large

</div>

<span style="display:block; height:40px;"></span>

<div style="font-size: 90%" align="right">

Likely, our sample is too small to determine <br/> with confidence whether to reject the null hypothesis

Our study is underpowered

</div>


---
## What’s the deal with power?

<div style="font-size: 90%" >

:dart: &nbsp;&nbsp;&nbsp; Power $= 1- \beta \rightarrow$ chance of rejecting $\mathcal{H}_0$ when is false

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger  $\mu_{\text{c}} - \mu_{\text{i}}$ or $\pi_{\text{c}} - \pi_{\text{i}}$ $\longrightarrow$ larger effect size
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - larger sample size $n$

<span style="display:block; height:1px;"></span>

Observation #2: if one doesn't collect a sufficiently large amount of data, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; they can only detect very large effect sizes

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\longrightarrow$ they may conclude that *"there was a very large*
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *difference between groups which was statistically*  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *significant"*: **the effect size is inflated** 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Type M error**

</div>

<!-- This happens again because the study is underpowered 
This explains why larger replication studies always find smaller effect size than the original study

It's colled M-error (for Magnitude)

Some replication studies frame their negative results
in terms of significance: “The original paper obtained a sig-
nificant result, but this more careful study did not.” But even
if the replication experiment was designed to have sufficient
statistical power to detect the effect reported in the initial study,
there was probably truth inflation—the initial study probably
overstated the effect. Since a larger sample is required to detect
a smaller effect, the true power of the replication experiment
may be lower than intended,

-->

---
## Making multiple comparisons 

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp;  A research group showed to a single subject (*) a series of pics
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of humans expressing different emotions while carrying out brain 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imaging (fMRI). They identified 16 out of  brain regions showing a  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 130,000 significant response at $\text{P} < 0.001$.  

</div>

<!-- Un gruppo di ricerca ha effettuato fMRI su un singolo soggetto (*)  mentre gli venivano mostrate delle fotografie in cui le persone fotografate esprimevano diverse emozioni. Sedici regioni cerebrali risultano statisticamente significative con $\text{P} < 0.001$.    -->

---
## Making multiple comparisons

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp;  A research group showed to a single subject (*) a series of pics
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of humans expressing different emotions while carrying out brain 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imaging (fMRI). They identified 16 out of  brain regions showing a  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 130,000 significant response at $\text{P} < 0.001$. 

</div>

<span style="display:block; height:1px;"></span>

<img src="./img/hypothesis_testing/salmon.png" img height="200px" border="4px" align="right"/>

<span style="display:block; height:60px;"></span>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*) Atlantic salmon, *'not alive at 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the time of scanning'*

</div>

<span style="display:block; height:1px;"></span>

<div style="font-size: 50%" align="right">

</br> Bennett, C. M., Miller M.B., and Wolford G.L.,. *Neural correlates of interspecies perspective taking in the post-mortem Atlantic Salmon: An argument for multiple comparisons correction.* Neuroimage 47.Suppl 1 (2009) doi:10.1016/S1053-8119(09)71202-9

</div>

---
## Errors in decision making 

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%" >

<center>

| $\mathcal{H}_0$ is | Not rejected | Rejected | 
| :---- | :----- | :---- | 
True  |  | Type I error ($\alpha$)|  
False | Type II error  |   | 

</center>

<span style="display:block; height:20px;"></span>

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true
&nbsp;&nbsp;&nbsp; $1 - \alpha = 0.95 \rightarrow 95\%$ chance of not rejecting $\mathcal{H}_0$ when is true

</div>

<!-- Suppose a drug truly does not work; that the null hypothesis is true. If we do one clinical trial, we will declare the result as statistically significant if the P-value is less than 0.05 and, since the drug is ineffective, the chance of this happening is 0.05 or 5% – that is the definition of a P-value. This would be considered a false-positive result, since we incorrectly believe the drug is effective.  -->


---
## Making multiple comparisons

<div style="font-size: 90%" >

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true
&nbsp;&nbsp;&nbsp; $1 - \alpha = 0.95 \rightarrow 95\%$ chance of not rejecting $\mathcal{H}_0$ when is true

&nbsp;&nbsp;&nbsp; Probability of finding at least a statistically significant result 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 1 test $\longrightarrow$  $1 - 0.95 = 0.05 = 5\%$ 

</div>

---
## Making multiple comparisons

<div style="font-size: 90%" >

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true
&nbsp;&nbsp;&nbsp; $1 - \alpha = 0.95 \rightarrow 95\%$ chance of not rejecting $\mathcal{H}_0$ when is true

&nbsp;&nbsp;&nbsp; Probability of finding at least a statistically significant result 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 1 test $\longrightarrow$  $1 - 0.95 = 0.05 = 5\%$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 2 tests $\longrightarrow$  $1 - 0.95 \times 0.95 = 1 - 0.95^2 = 0.0975 \approx 10\%$

</div>

<!--  If we do two trials, and look at the most extreme, the chance of getting at least one significant – and hence false-positive – result is close to 0.10 or 10%.fn5 The chance of getting at least one false-positive result increases quickly as we do more trials; if we do ten trials of useless drugs the chance of getting at least one significant at P < 0.05 gets as high as 40%. This is known as the problem of multiple testing, and occurs whenever many significance tests are carried out and then the most significant result is reported. -->

---
## Making multiple comparisons

<div style="font-size: 90%" >

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true
&nbsp;&nbsp;&nbsp; $1 - \alpha = 0.95 \rightarrow 95\%$ chance of not rejecting $\mathcal{H}_0$ when is true

&nbsp;&nbsp;&nbsp; Probability of finding at least a statistically significant result 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 1 test $\longrightarrow$  $1 - 0.95 = 0.05 = 5\%$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 2 tests $\longrightarrow$  $1 - 0.95 \times 0.95 = 1 - 0.95^2 = 0.0975 \approx 10\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 3 tests $\longrightarrow$  $1 - 0.95^3 = 0.142625 \approx 14\%$

</div>

---
## Making multiple comparisons

<div style="font-size: 90%" >

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true
&nbsp;&nbsp;&nbsp; $1 - \alpha = 0.95 \rightarrow 95\%$ chance of not rejecting $\mathcal{H}_0$ when is true

&nbsp;&nbsp;&nbsp; Probability of finding at least a statistically significant result 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 1 test $\longrightarrow$  $1 - 0.95 = 0.05 = 5\%$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 2 tests $\longrightarrow$  $1 - 0.95 \times 0.95 = 1 - 0.95^2 = 0.0975 \approx 10\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 3 tests $\longrightarrow$  $1 - 0.95^3 = 0.142625 \approx 14\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 10 tests $\longrightarrow$  $1 - 0.95^{10} = 0.40126 \approx 40\%$

</div>

---
## Making multiple comparisons

<div style="font-size: 90%" >

&nbsp;&nbsp;&nbsp; $\alpha = 0.05 \rightarrow 5\%$ chance of rejecting $\mathcal{H}_0$ when is true
&nbsp;&nbsp;&nbsp; $1 - \alpha = 0.95 \rightarrow 95\%$ chance of not rejecting $\mathcal{H}_0$ when is true

&nbsp;&nbsp;&nbsp; Probability of finding at least a statistically significant result 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 1 test $\longrightarrow$  $1 - 0.95 = 0.05 = 5\%$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 2 tests $\longrightarrow$  $1 - 0.95 \times 0.95 = 1 - 0.95^2 = 0.0975 \approx 10\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 3 tests $\longrightarrow$  $1 - 0.95^3 = 0.142625 \approx 14\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 10 tests $\longrightarrow$  $1 - 0.95^{10} = 0.40126 \approx 40\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 130,000 tests $\longrightarrow$  $1 - 0.95^{130,000} = 1 = 100\%$

<div align="right">

$1 - (1 - \alpha)^{N_\text{tests}}$

</div>

</div>


---
## Correcting for multiple comparisons

<div style="font-size: 90%" >

:dart: &nbsp; Using a smaller significance level $\alpha$ to determine statistical 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; significance


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Bonferroni correction**: $\frac{\alpha}{N_\text{tests}} \text{ } \longrightarrow \text{ } \frac{0.05}{N_\text{tests}}$

</div>

---
## Correcting for multiple comparisons

<div style="font-size: 90%" >

:dart: &nbsp; Using a smaller significance level $\alpha$ to determine statistical 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; significance


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Bonferroni correction**: $\frac{\alpha}{N_\text{tests}} \text{ } \longrightarrow \text{ } \frac{0.05}{N_\text{tests}}$

</div>

<span style="display:block; height:20px;"></span>

<div style="font-size: 82%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 1 test $\rightarrow$  $1 - (1 - \frac{0.05}{1})^1 = 1 - (1 - 0.05)^1 = 1 - 0.95^1 = 0.05$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 2 tests $\rightarrow$  $1 - (1 - \frac{0.05}{2})^2 = 1 - (1 - 0.025)^2 = 1 - 0.975^2 = 0.049$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 3 tests $\rightarrow$  $1 - (1 - \frac{0.05}{3})^3 = 1 - (1 - 0.0167)^3 = 1 - 0.983^3 = 0.050$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 10 tests $\rightarrow$  $1 - (1 - \frac{0.05}{10})^{10} = 1 - (1 - 0.005)^{10} = 1 - 0.995^{10} = 0.049$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - with 130,000 tests $\rightarrow$  $1 - (1 - \frac{0.05}{130,000})^{130,000} = 1 - (1 - 4 \times 10^{-7})^{130,000} =$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= 1 - 0.999^{130,000} = 0.049$



</div>

<!-- One way around this problem is to demand a very low P-value at which significance is declared, and the simplest method, known as the Bonferroni correction, is to use a threshold of 0.05/n, where n is number of tests done. So, for example, the tests at each site of the salmon’s brain could be carried out demanding a P-value of 0.05/8,000 = 0.00000625, or 1 in 160,000. This technique has become standard practice when searching the human genome for sites with association with diseases: since there are roughly 1,000,000 sites for genes, a P-value smaller than 0.05/1,000,000 = 1 in 20 million is routinely demanded before claiming a discovery. 

Moltp stringente
-->


---
## Correcting for multiple comparisons

<!-- <span style="display:block; height:1px;"></span> -->

<div style="font-size: 80%" >

:dart: &nbsp;&nbsp;&nbsp; Controlling the **expected** proportion of false discoveries

<span style="display:block; height:1px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **False discovery rate (FDR, Benjamini–Hochberg procedure)**:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Sort test results from the smallest to the largest P-value
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. For a given $\alpha$,  find the largest $k$ such that $\mathcal{P}(k) \leq  {\frac{k}{m}}\alpha$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Reject the null hypothesis for $i=1,\ldots ,k$

</div>

<!--

So when large numbers of hypotheses are being tested at the same time, as in brain imaging or genomics, the Bonferroni method can be used to decide whether the most extreme findings are significant. Simple techniques have also been developed that slightly relax the Bonferroni criterion for the second most extreme result, the third most extreme and so on, that are designed to control the overall proportion of ‘discoveries’ that turn out to be false claims – the so-called false discovery rate.

FDR intuitivamente ci dice quale proporzione di falso positivi andiamo ad accettare (FDR = FP/(FP+TP) ) 
Un FDR del 5%, per esempio, ci dice che accettiamo che oni 100 volte che "chiamiamo" un risultato (diciamo che un test e' significativo), in 5 stiamo facendo un errore -->

---
## One- and two-tailed tests

<span style="display:block; height:10px;"></span>

<div class="columns">
<div>

<div style="font-size: 80%" >

:dart: &nbsp;&nbsp;&nbsp; $\mathcal{H}_1$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \neq 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_0$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ two-tailed test

</div>

</div>
<div>

<center>
<img src="./img/hypothesis_testing/Two-tailed_test.png" img height="500px" border="0px"/>
</center>

</div>
</div>


<!-- a one-sided hypothesis test is used when a null hypothesis specifies that, say, the effect of a medical treatment is negative. This would only be rejected by large positive values of a test statistic representing an estimated treatment effect. A two-sided test would be appropriate for a null hypothesis that a treatment effect, say, is exactly zero, and so both positive and negative estimates would lead to the null being rejected. -->


---
## One- and two-tailed tests

<span style="display:block; height:10px;"></span>

<div class="columns">
<div>

<div style="font-size: 80%" >

:dart: &nbsp;&nbsp;&nbsp; $\mathcal{H}_1$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \neq 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_0$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ two-tailed test

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_1$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} < 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_0$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \geq  0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ one-tailed test

</div>

</div>
<div>

<center>
<img src="./img/hypothesis_testing/One-tailed_test_left.png" img height="500px" border="0px"/>
</center>

</div>
</div>


<!-- a one-sided hypothesis test is used when a null hypothesis specifies that, say, the effect of a medical treatment is negative. This would only be rejected by large positive values of a test statistic representing an estimated treatment effect. A two-sided test would be appropriate for a null hypothesis that a treatment effect, say, is exactly zero, and so both positive and negative estimates would lead to the null being rejected. -->



---
## One- and two-tailed tests

<span style="display:block; height:10px;"></span>

<div class="columns">
<div>

<div style="font-size: 80%" >

:dart: &nbsp;&nbsp;&nbsp; $\mathcal{H}_1$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \neq 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_0$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} = 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ two-tailed test

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_1$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} < 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_0$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \geq  0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  or
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_1$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} > 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{H}_0$: &nbsp;&nbsp;&nbsp; $\mu_{\text{c}} - \mu_{\text{i}} \leq 0$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ one-tailed test

</div>

</div>
<div>


<center>
<img src="./img/hypothesis_testing/One-tailed_test_right.png" img height="500px" border="0px"/>
</center>

</div>
</div>


<!-- a one-sided hypothesis test is used when a null hypothesis specifies that, say, the effect of a medical treatment is negative. This would only be rejected by large positive values of a test statistic representing an estimated treatment effect. A two-sided test would be appropriate for a null hypothesis that a treatment effect, say, is exactly zero, and so both positive and negative estimates would lead to the null being rejected. -->



<!-- a one-sided hypothesis test is used when a null hypothesis specifies that, say, the effect of a medical treatment is negative. This would only be rejected by large positive values of a test statistic representing an estimated treatment effect. A two-sided test would be appropriate for a null hypothesis that a treatment effect, say, is exactly zero, and so both positive and negative estimates would lead to the null being rejected. -->

---
## Non-parametric tests

<span style="display:block; height:20px;"></span>


<center>

<div style="font-size: 90%" >

| Sample | Data type | $\mathcal{H}_0$ | Non-parametric test |
| ---- | ---- |  ----- | ---- | 
| Independent | Numerical | $\mu_1 = \mu_2$ |  Mann-Whitney's test |
| Paired | Numerical | $\mu_1 = \mu_2$ |  Wilcoxon's test |
| Independent | Categorical | $\pi_1 = \pi_2$ | Fisher's test |
| Paired | Categorical | $\pi_1 = \pi_2$ |  McNemar's test |

</div>

</center>

<!-- I test studiati finora sulle variabili quantitative partono dal presupposto che i dati si distribuiscano nei campioni studiati seguendo una certa distribuzione (normale, di Student)

Sono detti parametrici perché dipendono da determinati parametri (media, deviazione standard, varianza …) che devo stimare nel campione e che devo “inferire” alla popolazione

Cosa succede quando le nostre assunzioni sulla distribuzione sono violate? Per esempio i nostri dati sono chiaramente non normali? 
 -->

<!-- Andiamo ad utilizzare dei test alternativi -->

---
![bg opacity](./img/backgrounds/hypothesis_testing_bg.png)

## Summary


<div style="font-size: 80%" >

- The P-value measures the discrepancy between the data and the null hypothesis  $\mathcal{H}_0$, and correspond to the probability of observing such an extreme value, if  $\mathcal{H}_0$ was true
- Traditionally, results are considered statistically significant if the p-value is lower than $\alpha$ = 0.05$ or 0.01, but these thresholds should be adjusted when multiple tests are performed.
- Statistical significance does not necessarily imply clinical significance
- Type I errors (or false positive) depend on the chosen significance threshold $\alpha$ 
- There is a relationship between Type II errors (false negative; $\beta$) and the statistical power of a study
- Underpowered studies may miss real effects or produce inflated effect size estimates (Type M error)

</div>

---
![bg opacity](./img/backgrounds/wrappingup_bg.png)

<span style="display:block; height:190px;"></span>

# Wrap up

---
## The PARACHUTE trial 

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/conclusions/parachute.png" img height="490px" border="4px"/>
</center>

---
## The PARACHUTE trial 

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/conclusions/parachute_RWY.jpg" img height="450px" border="4px"/>
<img src="./img/conclusions/parachute_LRV.jpg" img height="450px" border="4px"/>
<img src="./img/conclusions/parachute_BKN.jpg" img height="450px" border="4px"/>
</center>

<!-- Significativita' clinica \neq significativita' statistica -->

---
## Closing remarks

<span style="display:block; height:10px;"></span>

> *When the designers of scientific studies don’t employ statistics with sufficient care, they can sink years of work and thousands of dollars into research that cannot possibly answer the questions it is meant to answer*

<span style="display:block; height:10px;"></span>

<div align="right" style="font-size: 80%">

A. Reinhart, *Statistics Done Wrong*, 2015, No Starch Press

</div>


---
## Closing remarks

<span style="display:block; height:10px;"></span>

> *To consult the statistician after an experiment is finished is often merely to ask him to conduct a post mortem examination. He can perhaps say what the experiment died of.*

<span style="display:block; height:10px;"></span>

<div align="right" style="font-size: 90%">

R.A. Fisher

</div>


---
![bg opacity](./img/backgrounds/wrappingup_bg.png)

<span style="display:block; height:190px;"></span>

# Thank you
