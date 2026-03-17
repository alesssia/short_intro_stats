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

### (Day 2)

---
![bg opacity](./img/backgrounds/wrappingup_bg.png)

<span style="display:block; height:190px;"></span>

# Recap

---
## Recap


<div style="font-size: 90%">

- The collection, organisation, summarisation, and analysis of data <br/> &nbsp;&nbsp;&nbsp; &rarr; *Descriptive* &nbsp;statistics

- The drawing of inferences about a body of data when only a part of the data is observed <br/> &nbsp;&nbsp;&nbsp; &rarr; *Inferential* &nbsp;statistics

<span style="display:block; height:1px;"></span>


- When can't study a population, we select a representative sample
- There are different sampling strategies

</div>

<!-- - Individuare in maniera efficiente i tratti importanti delle informazioni che sono state raccolte

- Partire dal particolare per capire come le informazioni si possono estendere alla totalità -->

---
## Recap


<div style="font-size: 90%">

- There are different types of variables
- Categorical variables  are described with absolute and relative frequencies
- Numerical variables are described with measures of central tendency, dispersion, and correlation
- Variables can be summarised with multiple graphical representations 
- Parameters (calculated on the population) *vs*&nbsp; statistics (calculated on the sample)

</div>

---
![bg opacity](./img/backgrounds/normal_bg.png)

<span style="display:block; height:150px;"></span>

# The Normal Distribution 

---
## Learning objectives


- Understand the characteristics of the Normal and the Standard Normal distributions
- Calculate and interpret $z$-scores
- Determine the proportion of individuals in a population who exhibits a certain characteristic
- Calculate the probability that an individual in a population exhibits a certain characteristic


---
## Population distribution

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

What is the distribution of birth weight among English twins?

<span style="display:block; height:180px;"></span>

<div style="font-size: 80%" align="right">

$N=1 \text{M}$
$median = 2400\text{ g}$
$\mu = 2400\text{ g}; \text{ } \sigma = 580\text{ g}$

</div>

</div>
<div>


<center>
<img src="./img/normal/Twin_BW_hist.png" img height="550px" border="0px"/>
</center>

</div>

<!-- The population distribution is the pattern made by the birth weights of all these babies, which we can obtain from TwinsUK data on the weights for 1M twins born in the UK from 1917 to 1998 to non-Hispanic white women – although this is not the entire set of twin births, it is such a large sample that we can take it as the population. (sono dati simulati a partire da dati reali) -->

---
## Population distribution

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

What is the distribution of birth weight among English twins?

<span style="display:block; height:180px;"></span>

<div style="font-size: 80%" align="right">

$N=1 \text{M}$
$median = 2400\text{ g}$
$\mu = 2400\text{ g}; \text{ } \sigma = 580\text{ g}$

</div>

</div>
<div>


<center>
<img src="./img/normal/Twin_BW_hist_normale.png" img height="550px" border="0px"/>
</center>

</div>

<!-- The shape of this distribution is important. Measurements such as weight, income, height, and so on can, at least in principle, be as fine-grained as desired, and so can be considered ‘continuous’ quantities whose population distributions are smooth. The classic example is the ‘bell-shaped curve’, or normal distribution, first explored in detail by Carl Friedrich Gauss.

Theory shows that the normal distribution can be expected to occur for phenomena that are driven by large numbers of small influences, for example a complex physical trait that is not influenced by just a few genes. 

Figure shows a normal curve with the same mean and standard deviation as the recorded weights. The smooth normal curve and the histogram are gratifyingly close, and other complex traits such as height and cognitive skills also have approximately normal population distributions. 
-->

---
## The Normal distribution

<div class="columns">
<div>

<span style="display:block; height:40px;"></span>

- $\mathcal{N} = (\mu, \sigma^2)$
- $\text{mode} \equiv \text{mean} \equiv \text{median}$
- Symmetrical

</div>
<div>



<center>
<img src="./img/normal/Twin_BW_normale.png" img height="550px" border="0px"/>
</center>

</div>

<!-- The normal distribution is characterized by its mean, or expectation, and its standard deviation.

It is an impressive achievement to be able to summarize over a million births by just these two quantities. 
 -->


---
### Exercise #1

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%">

:question: &nbsp;&nbsp;&nbsp; Which curve has the largest 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mean?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Green
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Blue
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Yellow
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) None of the above

</div>

</div>
<div>
<span style="display:block; height:80px;"></span>

<center>
<img src="./img/normal/1200px-Normal_Distribution_PDF.svg_covered.png" img height="350px" border="4px"/>
</center>

</div>
</div>

<span style="display:block; height:1px;"></span>

<style>
  #countdown_exercise_1{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float:right;
  }
  #countdown_exercise_1.running {
    background-color: green;
  }
  #countdown_exercise_1.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_1"></button>

<script>
<!--
const countdown_exercise_1= document.getElementById("countdown_exercise_1");
const seconds_exercise_1= 15; // seconds_exercise_1
let timeLeft_exercise_1= seconds_exercise_1;
let timerInterval_exercise_1= null;

function formatTime_exercise_1(seconds_exercise_1) {
  const minutes = Math.floor(seconds_exercise_1/ 60);
  const remainingseconds_exercise_1= seconds_exercise_1% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_1).padStart(2, '0')}`;
}

function updateButton_exercise_1() {
  countdown_exercise_1.textContent = formatTime_exercise_1(timeLeft_exercise_1);
}

function startTimer_exercise_1() {
  if (timerInterval_exercise_1=== null) {
    countdown_exercise_1.classList.add('running');
    countdown_exercise_1.classList.remove('finished');
    timerInterval_exercise_1= setInterval(() => {
      if (timeLeft_exercise_1> 0) {
        timeLeft_exercise_1--;
        updateButton_exercise_1();
      } else {
        clearInterval(timerInterval_exercise_1);
        timerInterval_exercise_1= null;
        countdown_exercise_1.classList.remove('running');
        countdown_exercise_1.classList.add('finished');
        countdown_exercise_1.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_1();
  }
}

function pauseTimer_exercise_1() {
  clearInterval(timerInterval_exercise_1);
  timerInterval_exercise_1= null;
  countdown_exercise_1.classList.remove('running');
}

function resetTimer_exercise_1() {
  timeLeft_exercise_1= seconds_exercise_1;
  updateButton_exercise_1();
  countdown_exercise_1.classList.remove('finished');
  countdown_exercise_1.classList.remove('running');
  timerInterval_exercise_1= null;
}

countdown_exercise_1.addEventListener("click", () => {
  if (countdown_exercise_1.classList.contains('finished')) {
    resetTimer_exercise_1();
  } else {
    startTimer_exercise_1();
  }
});

updateButton_exercise_1();
-->
</script>

---
### Exercise #1 -- Solution

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%">

:question: &nbsp;&nbsp;&nbsp; Which curve has the largest 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mean?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Green
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Blue
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Yellow
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) None of the above &nbsp; :white_check_mark:

</div>

</div>
<div>
<span style="display:block; height:80px;"></span>

<center>
<img src="./img/normal/1200px-Normal_Distribution_PDF.svg_sd_covered.png" img height="350px" border="4px"/>
</center>

</div>

---
### Exercise #2

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%">

:question: &nbsp;&nbsp;&nbsp; Which curve has the largest 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard deviation?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Green
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Blue
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Yellow
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) None of the above

</div>

</div>
<div>
<span style="display:block; height:80px;"></span>

<center>
<img src="./img/normal/1200px-Normal_Distribution_PDF.svg_sd_covered.png" img height="350px" border="4px"/>
</center>

</div>
</div>

<span style="display:block; height:1px;"></span>

<style>
  #countdown_exercise_2{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float:right;
  }
  #countdown_exercise_2.running {
    background-color: green;
  }
  #countdown_exercise_2.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_2"></button>

<script>
<!--
const countdown_exercise_2= document.getElementById("countdown_exercise_2");
const seconds_exercise_2= 15; // seconds_exercise_2
let timeLeft_exercise_2= seconds_exercise_2;
let timerInterval_exercise_2= null;

function formatTime_exercise_2(seconds_exercise_2) {
  const minutes = Math.floor(seconds_exercise_2/ 60);
  const remainingseconds_exercise_2= seconds_exercise_2% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_2).padStart(2, '0')}`;
}

function updateButton_exercise_2() {
  countdown_exercise_2.textContent = formatTime_exercise_2(timeLeft_exercise_2);
}

function startTimer_exercise_2() {
  if (timerInterval_exercise_2=== null) {
    countdown_exercise_2.classList.add('running');
    countdown_exercise_2.classList.remove('finished');
    timerInterval_exercise_2= setInterval(() => {
      if (timeLeft_exercise_2> 0) {
        timeLeft_exercise_2--;
        updateButton_exercise_2();
      } else {
        clearInterval(timerInterval_exercise_2);
        timerInterval_exercise_2= null;
        countdown_exercise_2.classList.remove('running');
        countdown_exercise_2.classList.add('finished');
        countdown_exercise_2.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_2();
  }
}

function pauseTimer_exercise_2() {
  clearInterval(timerInterval_exercise_2);
  timerInterval_exercise_2= null;
  countdown_exercise_2.classList.remove('running');
}

function resetTimer_exercise_2() {
  timeLeft_exercise_2= seconds_exercise_2;
  updateButton_exercise_2();
  countdown_exercise_2.classList.remove('finished');
  countdown_exercise_2.classList.remove('running');
  timerInterval_exercise_2= null;
}

countdown_exercise_2.addEventListener("click", () => {
  if (countdown_exercise_2.classList.contains('finished')) {
    resetTimer_exercise_2();
  } else {
    startTimer_exercise_2();
  }
});

updateButton_exercise_2();
-->
</script>

---
### Exercise #2 -- Solution

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%">

:question: &nbsp;&nbsp;&nbsp; Which curve has the largest 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mean?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Green
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Blue
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Yellow &nbsp;&nbsp;&nbsp; :white_check_mark:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) None of the above

</div>

</div>
<div>
<span style="display:block; height:80px;"></span>

<center>
<img src="./img/normal/1200px-Normal_Distribution_PDF.svg.png" img height="350px" border="4px"/>
</center>

</div>

<!-- A diverse combinazioni di mu/sigma corrispondono diverse (e infinte) distribuzioni normali 
-->

---
## Three-sigma rule

<div class="columns">
<div>

<span style="display:block; height:60px;"></span>

<div style="font-size: 85%">

- approximately 68% of the values lie within one standard deviations (1 $\sigma$) of the mean


</div>
</div>
<div>

<span style="display:block; height:10px;"></span>


<img src="./img/normal/3sigma_1.png" img height="320px" border="0px"/>


</div>

<!-- From the mathematical properties of the normal distribution, we know that roughly 95% of the population will be contained in the interval given by the mean ± two standard deviations, and 99.8% in the central ± three standard deviations. 

68% at 1SD -> valori comuni vs valori inusuali -->


---
## Three-sigma rule

<div class="columns">
<div>

<span style="display:block; height:60px;"></span>

<div style="font-size: 85%">

- approximately 68% of the values lie within one standard deviations (1 $\sigma$) of the mean
- approximately 95% lie within 2 $\sigma$ 

</div>
</div>
<div>

<span style="display:block; height:10px;"></span>

<img src="./img/normal/3sigma_2_a.png" img height="320px" border="0px"/>


</div>

---
## Three-sigma rule

<div class="columns">
<div>

<span style="display:block; height:60px;"></span>

<div style="font-size: 85%">

- approximately 68% of the values lie within one standard deviations (1 $\sigma$) of the mean
- approximately 95% lie within 2 $\sigma$ 

</div>
</div>
<div>

<span style="display:block; height:10px;"></span>

<img src="./img/normal/3sigma_2_b.png" img height="320px" border="0px"/>


</div>

---
## Three-sigma rule

<div class="columns">
<div>

<span style="display:block; height:60px;"></span>

<div style="font-size: 85%">

- approximately 68% of the values lie within one standard deviations (1 $\sigma$) of the mean
- approximately 95% lie within 2 $\sigma$ 
- approximately 99.7% lie within 3 $\sigma$ 

</div>
</div>
<div>

<span style="display:block; height:10px;"></span>


<img src="./img/normal/3sigma_3_a.png" img height="320px" border="0px"/>


</div>

---
## Three-sigma rule

<div class="columns">
<div>

<span style="display:block; height:60px;"></span>

<div style="font-size: 85%">

- approximately 68% of the values lie within one standard deviations (1 $\sigma$) of the mean
- approximately 95% lie within 2 $\sigma$ 
- approximately 99.7% lie within 3 $\sigma$ 


</div>
</div>
<div>

<span style="display:block; height:10px;"></span>


<img src="./img/normal/3sigma_3_b.png" img height="320px" border="0px"/>


</div>



---
## Back to the boxplot.

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/normal/Boxplot_vs_PDF.svg.png" img height="480px" border="0px"/>
</center>

<!-- Se i dati sono distribuiti normalmente c'e' una corrispondenza tra 1.5IQR dal 1o e 3o quartile e le standard deviation dalla media 
1.5 IQR (fence of the boxplot) -> If the data are normally distributed, the fence will be 2.7 standard deviations from the mean, so cases outside of it will be quite rare (0.4%)
-->
-->

---
### Exercise #3

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The values considered unusual and/or outliers
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) The most common height
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) The range that includes 68% of the individuals
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f) The height of the tallest Italian man

</div>

<style>
  #countdown_exercise_3{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_3.running {
    background-color: green;
  }
  #countdown_exercise_3.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_3"></button>

<script>
<!--
const countdown_exercise_3= document.getElementById("countdown_exercise_3");
const seconds_exercise_3= 120; // seconds_exercise_3
let timeLeft_exercise_3= seconds_exercise_3;
let timerInterval_exercise_3= null;

function formatTime_exercise_3(seconds_exercise_3) {
  const minutes = Math.floor(seconds_exercise_3/ 60);
  const remainingseconds_exercise_3= seconds_exercise_3% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_3).padStart(2, '0')}`;
}

function updateButton_exercise_3() {
  countdown_exercise_3.textContent = formatTime_exercise_3(timeLeft_exercise_3);
}

function startTimer_exercise_3() {
  if (timerInterval_exercise_3=== null) {
    countdown_exercise_3.classList.add('running');
    countdown_exercise_3.classList.remove('finished');
    timerInterval_exercise_3= setInterval(() => {
      if (timeLeft_exercise_3> 0) {
        timeLeft_exercise_3--;
        updateButton_exercise_3();
      } else {
        clearInterval(timerInterval_exercise_3);
        timerInterval_exercise_3= null;
        countdown_exercise_3.classList.remove('running');
        countdown_exercise_3.classList.add('finished');
        countdown_exercise_3.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_3();
  }
}

function pauseTimer_exercise_3() {
  clearInterval(timerInterval_exercise_3);
  timerInterval_exercise_3= null;
  countdown_exercise_3.classList.remove('running');
}

function resetTimer_exercise_3() {
  timeLeft_exercise_3= seconds_exercise_3;
  updateButton_exercise_3();
  countdown_exercise_3.classList.remove('finished');
  countdown_exercise_3.classList.remove('running');
  timerInterval_exercise_3= null;
}

countdown_exercise_3.addEventListener("click", () => {
  if (countdown_exercise_3.classList.contains('finished')) {
    resetTimer_exercise_3();
  } else {
    startTimer_exercise_3();
  }
});

updateButton_exercise_3();
-->
</script>


---
### Exercise #3 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp;  The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height $\rightarrow$ coincide with the mean $= 170 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$

</div>

---
### Exercise #3 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp;  The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height $\rightarrow$ 170cm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$ $\rightarrow$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; those at the right of the median, half of the area under the curve 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= 50\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The values considered unusual and/or outliers

</div>

---
### Exercise #3 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp;  The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height $\rightarrow$ 170cm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$ $\rightarrow 50\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The values considered unusual and/or outliers $\rightarrow$ those $>2$  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard deviation from the mean $= 170 - 2 \times 9.5  = 151 \text{ cm }$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{and } 170 + 2\times 9.5  = 189 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) The most common height

</div>

---
### Exercise #3 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp;  The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height $\rightarrow$ 170cm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$ $\rightarrow 50\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The values considered unusual and/or outliers
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow \text{ } <151 \text{ cm and }  >189 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) The most common height $\rightarrow$ the mode, which coincides with the 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mean and the median $= 170 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) The range that includes 68% of the individuals

</div>

---
### Exercise #3 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp;  The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height $\rightarrow$ 170cm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$ $\rightarrow 50\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The values considered unusual and/or outliers
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow \text{ } <151 \text{ cm and} >189 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) The most common height $\rightarrow 170 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) The range that includes 68% of the individuals $\rightarrow$  that included 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; between $\pm 1$   standard deviation from the mean 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= 170 - 9.5 \text{ to } 170 + 9.5 \text{ cm } = 160.5 \text{ to } 179.5$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f) The height of the tallest Italian man 

</div>

---
### Exercise #3 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp;  The height of the Italian male population follows a Normal distribution  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a mean of 170 cm and a standard deviation of 9.5 cm.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calculate the following values, when possible

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The median height $\rightarrow$ 170cm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) The proportion of Italian men taller than $170 \text{ cm}$ $\rightarrow 50\%$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The values considered unusual and/or outliers
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow \text{ } <151 \text{ cm and} >189 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) The most common height $\rightarrow 170 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) The range that includes 68% of the individuals $\rightarrow$  $160.5 \text{ to } 179.5 \text{ cm}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f) The height of the tallest Italian man $\rightarrow$ we can't calculate this!

</div>

---
## Characterize a single observation

<span style="display:block; height:0px;"></span>

<div style="font-size: 90%">

Suppose we are caring for a newborn twin who weighs 1450g. 

</div>

<span style="display:block; height:50px;"></span>

<div style="font-size: 90%" align="right">

How can this newborn’s weight be characterized <br/> in relation to the overall population?

</div>

---
## Let’s take a step back…

<div style="font-size: 90%">

<img src="./img/normal/Twin_BW_normale_zscore.png" img height="500px" border="0px" align="right"/>

<span style="display:block; height:70px;"></span>

- The mean indicates the center of a distribution
- The standard deviation indicates the "typical" distance from the mean

</div>


---
## Characterize a single observation

<span style="display:block; height:0px;"></span>

<div style="font-size: 90%">

Suppose we are caring for a newborn twin who weighs 1450g

- The mean indicates the center of a distribution

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $x = 1450\text{ g} < \mu = 2400\text{ g}$ &nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp; $x - \mu = 1450\text{ g}-2400\text{ g}=-950\text{ g}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The newborn weighs below the mean

---
## Characterize a single observation

<span style="display:block; height:0px;"></span>

<div style="font-size: 90%">

Suppose we are caring for a newborn twin who weighs 1450g

- The mean indicates the center of a distribution

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $x = 1450\text{ g} < \mu = 2400\text{ g}$ &nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp; $x - \mu = 1450\text{ g}-2400\text{ g}=-950\text{ g}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The newborn weighs below the mean

- The standard deviation indicates the "typical" distance from the mean

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $|x - \mu| = 950\text{ g} > \sigma = 580\text{ g}$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The weight is "atypically" far from the mean
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

</div>

---
## Characterize a single observation

<span style="display:block; height:0px;"></span>

<div style="font-size: 90%">

Suppose we are caring for a newborn twin who weighs 1450g

- The mean indicates the center of a distribution

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $x = 1450\text{ g} < \mu = 2400\text{ g}$ &nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp; $x - \mu = 1450\text{ g}-2400\text{ g}=-950\text{ g}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The newborn weighs below the mean

- The standard deviation indicates the "typical" distance from the mean

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $|x - \mu| = 950\text{ g} > \sigma = 580\text{ g}$ &nbsp;&nbsp; $\rightarrow$ &nbsp;&nbsp; $\frac{x - \mu}{\sigma} = \frac{-950\text{ g}}{580\text{ g}} = -1.87$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The weight is "atypically" far from the mean
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ It is an (almost) "unusual" weight

</div>

---
## Characterize a single observation

<span style="display:block; height:0px;"></span>

<div style="font-size: 90%">

Suppose we are caring for a newborn twin who weighs 1450g

<span style="display:block; height:0px;"></span>

<img src="./img/normal/Twin_BW_normale_zscore_annotated.png" img height="450px" border="0px" align="right"/>

<span style="display:block; height:1px;"></span>


- The mean indicates the center of a distribution
&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The newborn weighs below the mean

- The standard deviation indicates the "typical" distance from the mean
&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ The weight is "atypically" far from the mean
&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ It is an (almost) "unusual" weight

</div>

---
## The $z$-score

<div style="font-size: 120%">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z= \frac{x - \mu}{\sigma}$

</div>

<span style="display:block; height:20px;"></span>

<div style="font-size: 90%">

- Indicates whether an observation is above or below the population mean
- Indicates whether an observation’s deviation from the mean is large or small relative to the population’s typical deviation

</div>


---
### Exercise #4 

<div style="font-size: 63%">

:question: &nbsp;&nbsp;&nbsp; Maria suffered a traumatic brain injury following an accident, and the neurologist  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; caring for her administered three tests.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $1.$ Memory test: Maria heard words and had to repeat them. She recalled 6 words;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the general population recalls a mean of 7 objects, with a standard deviation of 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3 words.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $2.$ Object naming test: Maria had to identify objects from drawings. She recognized
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7; the general population recognizes a mean of 10 objects, with a standard deviation 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of 0.59 objects.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $3.$ Stroop test: Maria was given a list of colours written in different inks and had to 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name the ink colour as quickly as possible. She took 15.7 seconds; the general 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; population  takes a mean of 16.2 seconds, with a standard deviation of 1.3 seconds.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Based on these results, should the neurologist focus on Maria’s memory, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object naming ability, or attention in future visits?

</div>

<style>
  #countdown_exercise_4{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_4.running {
    background-color: green;
  }
  #countdown_exercise_4.finished {
    background-color: red;
  }
</style>


<button id="countdown_exercise_4"></button>

<script>
<!--
const countdown_exercise_4= document.getElementById("countdown_exercise_4");
const seconds_exercise_4= 180; // seconds_exercise_4
let timeLeft_exercise_4= seconds_exercise_4;
let timerInterval_exercise_4= null;

function formatTime_exercise_4(seconds_exercise_4) {
  const minutes = Math.floor(seconds_exercise_4/ 60);
  const remainingseconds_exercise_4= seconds_exercise_4% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_4).padStart(2, '0')}`;
}

function updateButton_exercise_4() {
  countdown_exercise_4.textContent = formatTime_exercise_4(timeLeft_exercise_4);
}

function startTimer_exercise_4() {
  if (timerInterval_exercise_4=== null) {
    countdown_exercise_4.classList.add('running');
    countdown_exercise_4.classList.remove('finished');
    timerInterval_exercise_4= setInterval(() => {
      if (timeLeft_exercise_4> 0) {
        timeLeft_exercise_4--;
        updateButton_exercise_4();
      } else {
        clearInterval(timerInterval_exercise_4);
        timerInterval_exercise_4= null;
        countdown_exercise_4.classList.remove('running');
        countdown_exercise_4.classList.add('finished');
        countdown_exercise_4.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_4();
  }
}

function pauseTimer_exercise_4() {
  clearInterval(timerInterval_exercise_4);
  timerInterval_exercise_4= null;
  countdown_exercise_4.classList.remove('running');
}

function resetTimer_exercise_4() {
  timeLeft_exercise_4= seconds_exercise_4;
  updateButton_exercise_4();
  countdown_exercise_4.classList.remove('finished');
  countdown_exercise_4.classList.remove('running');
  timerInterval_exercise_4= null;
}

countdown_exercise_4.addEventListener("click", () => {
  if (countdown_exercise_4.classList.contains('finished')) {
    resetTimer_exercise_4();
  } else {
    startTimer_exercise_4();
  }
});

updateButton_exercise_4();
-->
</script>

---
### Exercise #4 -- Solution

<div style="font-size: 63%">

:question: &nbsp;&nbsp;&nbsp; Maria suffered a traumatic brain injury following an accident, and the neurologist  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; caring for her administered three tests.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $1.$ Memory test. &nbsp;&nbsp; $x = 6$; &nbsp;&nbsp;  $\mu=7$, &nbsp;&nbsp; $\sigma=1.3$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{6-7}{1.3} = -0.77$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $2.$ Object naming test. &nbsp;&nbsp; $x = 7$; &nbsp;&nbsp;  $\mu=10$, &nbsp;&nbsp; $\sigma=0.59$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{7-10}{0.59} = -5.09$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $3.$ Stroop test. &nbsp;&nbsp; $x = 15.7$; &nbsp;&nbsp;  $\mu=16.2$, &nbsp;&nbsp; $\sigma=1.3$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{15.7-16.2}{1.3} = -0.39$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Based on these results, should the neurologist focus on Maria’s memory, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object naming ability, or attention in future visits?



</div>

---
### Exercise #4 -- Solution

<div style="font-size: 63%">

:question: &nbsp;&nbsp;&nbsp; Maria suffered a traumatic brain injury following an accident, and the neurologist  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; caring for her administered three tests.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $1.$ Memory test. &nbsp;&nbsp; $x = 6$; &nbsp;&nbsp;  $\mu=7$, &nbsp;&nbsp; $\sigma=1.3$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{6-7}{1.3} = -0.77$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $2.$ Object naming test. &nbsp;&nbsp; $x = 7$; &nbsp;&nbsp;  $\mu=10$, &nbsp;&nbsp; $\sigma=0.59$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{7-10}{0.59} = -5.09$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $3.$ Stroop test. &nbsp;&nbsp; $x = 15.7$; &nbsp;&nbsp;  $\mu=16.2$, &nbsp;&nbsp; $\sigma=1.3$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{15.7-16.2}{1.3} = -0.39$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Based on these results, should the neurologist focus on Maria’s memory, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object naming ability, or attention in future visits?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ object naming ability

</div>

---
## The Standard Normal distribution

<span style="display:block; height:0px;"></span>

<div style="font-size: 90%">

- $z = \frac{x - \mu}{\sigma}$
- $\mathcal{N} = (\mu, \sigma^2) \rightarrow Z = (0, 1)$

</duv>

<img src="./img/normal/n2z.png" img height="400px" align="right" border="0px"/>


---
## The Standard Normal distribution

<div class="columns">
<div>

<span style="display:block; height:80px;"></span>

<div style="font-size: 90%">

- $Z = (0, 1)$
- Area under the curve. $= 1$
- proportion $\equiv$ probability

</div>

</div>
<div>

<span style="display:block; height:20px;"></span>

<center>
<img src="./img/normal/normal_table_zoom.jpg" img height="420px" border="4px"/>
</center>

</div>
</div>

<!-- 
this is also known as her Z-score, which simply measures how many standard deviations a data-point is from the mean.

E perche la SND ci piace? Perche' esistono delle tavole che ci dicono qual e' l'area sottesa  ad una certa porzione della curva, che corrispondono alla probabilita' di trovare (nel caso di queste tavole) un valore < di quello osservato (area colorata)

Ci sono diverse versioni di queste tabelle, per esempio quella complementare che riporta l'area per la zona bianca (probabilita' di osservare valori piu' estremi) -->

---
## Proportion $\equiv$ probability


<div style="font-size: 90%">

<img src="./img/normal/Twin_BW_normale_area.png" img height="500px" border="0px" align="right"/>

<span style="display:block; height:40px;"></span>

- 6% of twins are born with very low birth weight (< 1500g)
- The probability of being born with very low birth weight is 0.06

<span style="display:block; height:80px;"></span>

<div align="right">
But how was it calculated? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</div>

</div>

---
## Let’s calculate the probability/proportion.

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

&nbsp;&nbsp;&nbsp; What is the probability that a twin is born with very low birth weight?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (2400, 580^2)$

<span style="display:block; height:1px;"></span>




</div>

---
## Let’s calculate the probability/proportion.

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

&nbsp;&nbsp;&nbsp; What is the probability that a twin is born with very low birth weight?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (2400, 580^2)$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Compute the $z$-score
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{x - \mu}{\sigma} = \frac{1500-2400}{580} = \frac{-900}{580} = -1.55$

</div>

---
## Let’s calculate the probability/proportion.

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

&nbsp;&nbsp;&nbsp; What is the probability that a twin is born with very low birth weight?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (2400, 580^2)$

<img src="./img/normal/Twin_BW_normale_area_z.png" img height="400px" align=right border="0px"/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Compute the $z$-score
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{x - \mu}{\sigma} = \frac{1500-2400}{580} = \frac{-900}{580} = -1.55$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Draw a Normal Distribution, and 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  shade the area we are interested in

</div>

---
## Let’s calculate the probability/proportion.

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

&nbsp;&nbsp;&nbsp; What is the probability that a twin is born with very low birth weight?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (2400, 580^2)$

<img src="./img/normal/normal_table_zoom.jpg" img height="350px" align=right border="4px"/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Compute the $z$-score
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{x - \mu}{\sigma} = \frac{1500-2400}{580} = \frac{-900}{580} = -1.55$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Draw a Normal Distribution, and 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  shade the area we are interested in

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Use a Unit Normal Table to find 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the area of the shaded curve

</div>

---
## Let’s calculate the probability/proportion.

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

&nbsp;&nbsp;&nbsp; What is the probability that a twin is born with very low birth weight?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (2400, 580^2)$

<img src="./img/normal/panic.gif" img height="350px" align=right border="4px"/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Compute the $z$-score
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{x - \mu}{\sigma} = \frac{1500-2400}{580} = \frac{-900}{580} = -1.55$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Draw a Normal Distribution, and 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  shade the area we are interested in

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Use a Unit Normal Table to find 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the area of the shaded curve
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\rightarrow$ There are no negative z-scores

</div>

---
## Find the area of the shaded curve

<div class="columns">
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/normal/Twin_BW_normale_area_z.png" img height="450px" border="0px"/>
</center>

</div>
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/normal/Twin_BW_normale_area_z_simmetrica.png" img height="450px" border="0px"/>
</center>

</div>
</div>

---
## Find the area of the shaded curve

<div class="columns">
<div>

<span style="display:block; height:1px;"></span>



</div>
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/normal/Twin_BW_normale_area_z_1-alpha.png" img height="450px" border="0px"/>
</center>


</div>
</div>


---
## Compute the probability/proportion

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

&nbsp;&nbsp;&nbsp; What is the probability that a twin is born with very low birth weight?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{N} = (2400, 580^2)$

<img src="./img/normal/normal_table_zoom_example.jpg" img height="350px" align=right border="4px"/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Compute the $z$-score
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $z = \frac{x - \mu}{\sigma} = \frac{1500-2400}{580} = \frac{-900}{580} = -1.55$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Draw a Normal Distribution, and 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  shade the area we are interested in


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Use a Unit Normal Table to find 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the area of the shaded curve

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{P} = 1 - 0.9394 = 0.0606 \rightarrow 6.06\%$

<!-- Fare vedere che la curva e' simmetrica quindi possiamo usare 1.56 per conoscere l'area -->



---
### Exercise #5

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp;  Not knowing that the baby is a twin, the pediatrician tells the mother that 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a birth weight below 2500 g is unusual. Is it really unusual?

</div>

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu = 2404\text{ g}; \text{ } \sigma = 580\text{ g}$

</div>

<span style="display:block; height:140px;"></span>

<style>
  #countdown_Exercise_5{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_Exercise_5.running {
    background-color: green;
  }
  #countdown_Exercise_5.finished {
    background-color: red;
  }
</style>

<span style="display:block; height:30px;"></span>

<button id="countdown_Exercise_5"></button>

<script>
<!--
const countdown_Exercise_5= document.getElementById("countdown_Exercise_5");
const seconds_Exercise_5= 300; // seconds_Exercise_5
let timeLeft_Exercise_5= seconds_Exercise_5;
let timerInterval_Exercise_5= null;

function formatTime_Exercise_5(seconds_Exercise_5) {
  const minutes = Math.floor(seconds_Exercise_5/ 60);
  const remainingseconds_Exercise_5= seconds_Exercise_5% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_Exercise_5).padStart(2, '0')}`;
}

function updateButton_Exercise_5() {
  countdown_Exercise_5.textContent = formatTime_Exercise_5(timeLeft_Exercise_5);
}

function startTimer_Exercise_5() {
  if (timerInterval_Exercise_5=== null) {
    countdown_Exercise_5.classList.add('running');
    countdown_Exercise_5.classList.remove('finished');
    timerInterval_Exercise_5= setInterval(() => {
      if (timeLeft_Exercise_5> 0) {
        timeLeft_Exercise_5--;
        updateButton_Exercise_5();
      } else {
        clearInterval(timerInterval_Exercise_5);
        timerInterval_Exercise_5= null;
        countdown_Exercise_5.classList.remove('running');
        countdown_Exercise_5.classList.add('finished');
        countdown_Exercise_5.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_Exercise_5();
  }
}

function pauseTimer_Exercise_5() {
  clearInterval(timerInterval_Exercise_5);
  timerInterval_Exercise_5= null;
  countdown_Exercise_5.classList.remove('running');
}

function resetTimer_Exercise_5() {
  timeLeft_Exercise_5= seconds_Exercise_5;
  updateButton_Exercise_5();
  countdown_Exercise_5.classList.remove('finished');
  countdown_Exercise_5.classList.remove('running');
  timerInterval_Exercise_5= null;
}

countdown_Exercise_5.addEventListener("click", () => {
  if (countdown_Exercise_5.classList.contains('finished')) {
    resetTimer_Exercise_5();
  } else {
    startTimer_Exercise_5();
  }
});

updateButton_Exercise_5();
-->
</script>



</div>
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/normal/normal_table_zoom.jpg" img height="380px" border="4px"/>
</center> 

</div>
</div>

<!-- For medical rather than statistical reasons, babies below 2,500 g are considered ‘low birth weight’, and those below 1,500 g ‘very low birth weight’.  -->

---
### Exercise #5 -- Solution

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp;  Not knowing that the baby is a twin, the pediatrician tells the mother that 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a birth weight below 2500 g is unusual. Is it really unusual?

</div>

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu = 2404\text{ g}; \text{ } \sigma = 580\text{ g}$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{z} = \frac{x - \mu}{\sigma} =  \frac{2500 - 2404}{580} = 0.17$



</div>

</div>
<div>

<span style="display:block; height:20px;"></span>

<center>
<img src="./img/normal/Twin_BW_normale_area_z_ex.png" img height="350px" border="0px"/>
</center> 

</div>
</div>

---
### Exercise #5 -- Solution

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp;  Not knowing that the baby is a twin, the pediatrician tells the mother that 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a birth weight below 2500 g is unusual. Is it really unusual?

</div>

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu = 2404\text{ g}; \text{ } \sigma = 580\text{ g}$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{z} = \frac{x - \mu}{\sigma} =  \frac{2500 - 2404}{580} = 0.17$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{P}(x < 2500) = 0.5675 \rightarrow 56.75\%$

</div>

</div>
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/normal/normal_table_zoom.jpg" img height="380px" border="4px"/>
</center> 


</div>
</div>

---
## Percentiles

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/descriptive/percentile.png" img height="350px" border="0px"/>
</center>

<!-- Mentre la median divide i dati in due meta' esatte, molto usati sono anche i quartili, che dividono i dati in 4 parti uguali -->

<span style="display:block; height:10px;"></span>

<div style="font-size: 90%" align="right">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mathcal{P} = 0.57$ tells us that our newborn twin is in the 57th percentile

</div>

---
## Summary

<span style="display:block; height:0px;"></span>

<div style="font-size: 80%">

- Many natural phenomena follow a Normal distribution
- The Normal distribution is defined by the mean and standard deviation and corresponds to a probability distribution
- A population’s Normal distribution allows us to determine both the probability of observing a certain value and its expected frequency
- If the data follow a Normal distribution, approximately 68% of values lie within 1 standard deviation of the mean, 95% within 2, and 99.7% within 3
- The z-score allows us to position an observation relative to the reference population and to compare data from very different distributions

</div>

---
![bg opacity](./img/backgrounds/confidence_intervals_bg.png)

<span style="display:block; height:190px;"></span>

# Estimates and Confidence Intervals 

<!--- Partire dal particolare per capire come le informazioni si possono estendere alla totalità -->

---
## Learning objectives

<span style="display:block; height:50px;"></span>

- Be able to use sample statistics to infer population parameters
- Be able to communicate the uncertainty of a statistic
- Be able to calculate and interpret a confidence interval

---
## &nbsp;&nbsp;&nbsp; :warning:  Disclaimer  :warning:

<span style="display:block; height:10px;"></span>

<div style="font-size: 90%">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If this part seems complex, it’s because it really is.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You may need to spend some time fully understanding it
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Don’t worry, we’ve all been there!

</div>

---
## From sample to population

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/sample2pop_empty.png" img height="450px" border="4px"/>
</center>

<!-- Ricapitoliamo: quando non possiamo studiare una popolazione ne usiamo un campione rappresentativo -->

---
## From sample to population

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/sample2pop.png" img height="450px" border="4px"/>
</center>

<!-- e poi usiamo le informazioni raccolte dal campione per trarre delle conclusioni sulla popolazione 
Questo processo si chiama statistica inferenziale,

Procedimento induttivo che ha lo scopo di stimare i parametri (caratteristiche) sconosciuti della popolazione a partire dalle statistiche (stime conosciute) del campione 

Sulla base di un campione estratto casualmente da 1 popolazione cosa può essere detto circa la popolazione da cui il campione è stato estratto? -->


---
##  Sampling error

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/confidence_intervals/sampling_variability_2.png" img height="450px" border="0px"/>
</center>

<!--  Sampling error occurs when the sample’s characteristics differ from the population’s characteristics. The greater the discrepancy, the greater the sampling error.  

If a sample had dramatically different characteristics than the population, it would provide sample statistics that are dramatically different from the population, creating a lot of sampling error. If you are trying to represent a specific population and get a poor sample,  even if the rest of the study is executed perfectly, the sample results will not represent those of the population, and the entire purpose for doing the study is compromised. Therefore, obtaining a representative sample that minimizes sampling error is critically important. Researchers minimize sampling error with good sampling procedures.
-->

---
##  Sampling error

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/confidence_intervals/sampling_variability_3.png" img height="450px" border="0px"/>
</center>

---
##  Sampling error

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/confidence_intervals/sampling_variability_4.png" img height="450px" border="0px"/>
</center>

---
##  Sampling error

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/confidence_intervals/sampling_variability_5.png" img height="450px" border="0px"/>
</center>

---
## The sampling distribution

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<center>
<img src="./img/confidence_intervals/sampling_distro.png" img height="450px" border="0px"/>
</center>

</div>
<div>

<div style="font-size: 90%">

<span style="display:block; height:1px;"></span>


</div>

</div>
</div>


---
## The Central Limit Theorem

<span style="display:block; height:2px;"></span>

<div style="font-size: 90%">

- There is variability in the estimate of a parameter that depends on the sample (the sampling distribution).

- We would like to have a range of plausible ("common") values for the population parameter

- The shape of the sampling distribution does not depend on the shape of the empirical distribution and, for large samples, can be approximated by a Normal distribution


</div>

<!-- 
- the variability in statistics based on samples

- the fact that the shape of the distribution of the statistics does not depend on the shape of the original distribution from which the individual data-points are drawn

- bootstrapping data when we do not want to make assumptions about the shape of the population

Rather remarkably, this has all been accomplished without any mathematics except the idea of drawing observations at random. -->


---
## Let’s put the jigsaw together

<div class="columns">
<div>

<span style="display:block; height:2px;"></span>

<div style="font-size: 80%">

- The sampling distribution can be approximated by a Normal distribution
- In a Normal distribution, about 95% of the values (those "common") lie within two standard deviations of the mean
- A 95% confidence interval (CI) lies (approximately) $\pm \text{} 2 \times SE$ from the mean of the sampling distribution

</div>

</div>
<div>

<span style="display:block; height:120px;"></span>

<img src="./img/normal/3sigma_2_a.png" img height="300px" border="0px"/>

</div>
</div>

<!-- Approssimando una Normale, la distribuzione campionaria ha le stesse (utili) caratteristiche della normale:
- &egrave; simmetrica
- ha area 1
- 95% delle medie campionarie sono a 2 SE dalla vera media della popolazione 

Tutti concetti che ci torneranno utili tra poco
-->

---
## Computing a Confidence Interval

<div style="font-size: 88%">

:dart: &nbsp; A 95% CI lies ± 2 × SE from the sampling distribution mean ($\bar{x}$)

</div>

<div class="columns">
<div>

<span style="display:block; height:50px;"></span>

<div style="font-size: 88%">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Compute the SE
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Compute $2 \times \text{SE}$, *i.e.*, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $95\%$ Margin of Error (ME)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Compute the $95\% \text{ CI}$ as 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $(\bar{x} - \text{ ME} \text{ } ; \text{ } \bar{x} + \text{ ME} )$

</div>

</div>
<div>

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/ME_and_CI.png" img height="450px" border="0px"/>
</center>

</div>
</div>

---
### Confidence intervals for the mean

<span style="display:block; height:40px;"></span>

:pushpin: &nbsp;&nbsp;&nbsp; $\mathcal{N} = (\mu, \frac{\sigma^2}{n})$ with
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\sqrt{ \frac{\sigma^2}{n}} = \frac{\sigma}{\sqrt{n}} = \text{standard error (SE)}$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\sigma =$? $\longrightarrow \hat{SE} = \frac{s}{\sqrt{n}}$



---
### Exercise #6

<div style="font-size: 90%" >

In a sample of 403 Italian 11-year-old girls, the mean BMI is $18.4 \pm  3.3 \text{ kg}/\text{m}^2$

:question: &nbsp; What is the 95% CI for the true population mean ?


</div>

<span style="display:block; height:180px;"></span>

<style>
  #countdown_exercise_6{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_6.running {
    background-color: green;
  }
  #countdown_exercise_6.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_6"></button>

<script>
<!--
const countdown_exercise_6= document.getElementById("countdown_exercise_6");
const seconds_exercise_6= 300; // seconds_exercise_6
let timeLeft_exercise_6= seconds_exercise_6;
let timerInterval_exercise_6= null;

function formatTime_exercise_6(seconds_exercise_6) {
  const minutes = Math.floor(seconds_exercise_6/ 60);
  const remainingseconds_exercise_6= seconds_exercise_6% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_6).padStart(2, '0')}`;
}

function updateButton_exercise_6() {
  countdown_exercise_6.textContent = formatTime_exercise_6(timeLeft_exercise_6);
}

function startTimer_exercise_6() {
  if (timerInterval_exercise_6=== null) {
    countdown_exercise_6.classList.add('running');
    countdown_exercise_6.classList.remove('finished');
    timerInterval_exercise_6= setInterval(() => {
      if (timeLeft_exercise_6> 0) {
        timeLeft_exercise_6--;
        updateButton_exercise_6();
      } else {
        clearInterval(timerInterval_exercise_6);
        timerInterval_exercise_6= null;
        countdown_exercise_6.classList.remove('running');
        countdown_exercise_6.classList.add('finished');
        countdown_exercise_6.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_6();
  }
}

function pauseTimer_exercise_6() {
  clearInterval(timerInterval_exercise_6);
  timerInterval_exercise_6= null;
  countdown_exercise_6.classList.remove('running');
}

function resetTimer_exercise_6() {
  timeLeft_exercise_6= seconds_exercise_6;
  updateButton_exercise_6();
  countdown_exercise_6.classList.remove('finished');
  countdown_exercise_6.classList.remove('running');
  timerInterval_exercise_6= null;
}

countdown_exercise_6.addEventListener("click", () => {
  if (countdown_exercise_6.classList.contains('finished')) {
    resetTimer_exercise_6();
  } else {
    startTimer_exercise_6();
  }
});

updateButton_exercise_6();
-->
</script>


---
### Exercise #6 -- Solution

<div style="font-size: 90%" >

In a sample of 403 Italian 11-year-old girls, the mean BMI is $18.4 \pm  3.3 \text{ kg}/\text{m}^2$

:question: &nbsp; What is the 95% CI for the true population mean?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. &nbsp; $\hat{\text{SE}}=s/\sqrt{n} = 3.3/\sqrt{403}=0.16$

<div>

---
### Exercise #6 -- Solution

<div style="font-size: 90%" >

In a sample of 403 Italian 11-year-old girls, the mean BMI is $18.4 \pm  3.3 \text{ kg}/\text{m}^2$

:question: &nbsp; What is the 95% CI for the true population mean?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. &nbsp; $\hat{\text{SE}}=s/\sqrt{n} = 3.3/\sqrt{403}=0.16$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. &nbsp; $95\% \text{ ME} = 2 \times \hat{\text{SE}} = 2 \times 0.16 = 0.32$

<!-- Per il CTL e per la legge dei grandi numeri, la media del campione e' la media della popolazione. Se io prendo 2SE a sx della media e 2SE a destra (quindi x +/- 2 SE) ho il 95% di probabilta' di includere il vero valore mu, la media della popolazione

1,96 e' il coefficiente di attendibilita', ci dice entro quanti errori standard si trova il 95% di tutti i possibili valori della media campionaria

Stima intervallare definita come stimatore +/- il prodotto tra coeff di attendibilita' e SE. Questa quantita' si chiama anche PRECISIONE della STIMA o MARGINE DI ERRORE -->

---
### Exercise #6 -- Solution

<div style="font-size: 90%" >

In a sample of 403 Italian 11-year-old girls, the mean BMI is $18.4 \pm  3.3 \text{ kg}/\text{m}^2$

:question: &nbsp; What is the 95% CI for the true population mean?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. &nbsp; $\hat{\text{SE}}=s/\sqrt{n} = 3.3/\sqrt{403}=0.16$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. &nbsp; $95\% \text{ ME} = 2 \times \hat{\text{SE}} = 2 \times 0.16 = 0.32$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.   &nbsp; $95\% \text{CI} =  (\bar{x} - 95\% \text{ ME} \text{ } ; \text{ } \bar{x} + 95\% \text{ ME} ) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=(18.4 - 0.32 \text{ } ; \text{ } 18.4 + 0.32) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (18.08 \text{ } ; \text{ }   18.72)$

</div>

<!-- Per il CTL e per la legge dei grandi numeri, la media del campione e' la media della popolazione. Se io prendo 2SE a sx della media e 2SE a destra (quindi x +/- 2 SE) ho il 95% di probabilta' di includere il vero valore mu, la media della popolazione

1,96 e' il coefficiente di attendibilita', ci dice entro quanti errori standard si trova il 95% di tutti i possibili valori della media campionaria

Stima intervallare definita come stimatore +/- il prodotto tra coeff di attendibilita' e SE. Questa quantita' si chiama anche PRECISIONE della STIMA o MARGINE DI ERRORE -->



---
## Interpreting confidence intervals 

<div style="font-size: 90%">

- If we could sample the population 100 times and compute the corresponding 100 CIs, 95 of them would include the true population parameter
<img src="./img/confidence_intervals/simulated_BMI_CI.png" img height="390px" border="-px" align="right"/>

:pushpin: &nbsp;&nbsp;&nbsp; Population: Italian 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11-year-old girls
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\mu=18.4  \text{ kg}/\text{m}^2$

</div>

<!-- Cosa rappresentano quindi i CI? Che dati 100 campioni estratti dalla popolazione, 95 stimano un IC al cui interno è compresa la media reale della popolazione e solo 5 stimano un ic che non include la media reale 

a confidence interval is the range of population parameters for which our observed statistic is a plausible consequence.
-->

---
### Exercise #7

<div style="font-size: 75%" >

:question: &nbsp;&nbsp;&nbsp; In the Results section, the authors reported the following

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *In Mexican Americans, the mean age at menarche was 12.09 years*
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(95% CI = 11.81 to 12.37 years old)*

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This means that...

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The age at menarche for Mexican American girls lies between 11.81
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and 12.37 years old
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) 95% of Mexican American girls experience menarche between 11.81 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and 12.37 years old
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The mean age at menarche for Mexican American girls has a 95% 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; probability of being between 11.81 and 12.37 years.

</div>


<!-- Questa differenza di 200 euro a dx e sx della media e' il margine di errore del 95% -->

<style>
  #countdown_exercise_7{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_7.running {
    background-color: green;
  }
  #countdown_exercise_7.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_7"></button>

<script>
<!--
const countdown_exercise_7= document.getElementById("countdown_exercise_7");
const seconds_exercise_7= 60; // seconds_exercise_7
let timeLeft_exercise_7= seconds_exercise_7;
let timerInterval_exercise_7= null;

function formatTime_exercise_7(seconds_exercise_7) {
  const minutes = Math.floor(seconds_exercise_7/ 60);
  const remainingseconds_exercise_7= seconds_exercise_7% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_7).padStart(2, '0')}`;
}

function updateButton_exercise_7() {
  countdown_exercise_7.textContent = formatTime_exercise_7(timeLeft_exercise_7);
}

function startTimer_exercise_7() {
  if (timerInterval_exercise_7=== null) {
    countdown_exercise_7.classList.add('running');
    countdown_exercise_7.classList.remove('finished');
    timerInterval_exercise_7= setInterval(() => {
      if (timeLeft_exercise_7> 0) {
        timeLeft_exercise_7--;
        updateButton_exercise_7();
      } else {
        clearInterval(timerInterval_exercise_7);
        timerInterval_exercise_7= null;
        countdown_exercise_7.classList.remove('running');
        countdown_exercise_7.classList.add('finished');
        countdown_exercise_7.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_7();
  }
}

function pauseTimer_exercise_7() {
  clearInterval(timerInterval_exercise_7);
  timerInterval_exercise_7= null;
  countdown_exercise_7.classList.remove('running');
}

function resetTimer_exercise_7() {
  timeLeft_exercise_7= seconds_exercise_7;
  updateButton_exercise_7();
  countdown_exercise_7.classList.remove('finished');
  countdown_exercise_7.classList.remove('running');
  timerInterval_exercise_7= null;
}

countdown_exercise_7.addEventListener("click", () => {
  if (countdown_exercise_7.classList.contains('finished')) {
    resetTimer_exercise_7();
  } else {
    startTimer_exercise_7();
  }
});

updateButton_exercise_7();
-->
</script>


---
### Exercise #7 -- Solution

<div style="font-size: 75%" >

:question: &nbsp;&nbsp;&nbsp; In the Results section, the authors reported the following

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *In Mexican Americans, the mean age at menarche was 12.09 years*
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(95% CI = 11.81 to 12.37 years old)*

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This means that...

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) The age at menarche for Mexican American girls lies between 11.81
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and 12.37 years old
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) 95% of Mexican American girls experience menarche between 11.81 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and 12.37 years old
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) The mean age at menarche for Mexican American girls has a 95% 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; probability of being between 11.81 and 12.37 years &nbsp; :white_check_mark:


</div>


---
## The confidence on the confidence intervals 

<span style="display:block; height:2px;"></span>

<div style="font-size: 90%">

- A confidence interval is a range of values which includes the
 estimated parameter with a given level of confidence (*e.g.*, 95%)
- Its width depends on the margin of error
- The margin of error is evaluated as:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $2 \times \text{SE}$ (at a confidence level of 95%)

<span style="display:block; height:60px;"></span>

<div align="right">
But why do we multiply by 2? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>


---
## The confidence level

<div style="font-size: 90%">

:dart: &nbsp; We multiply by the critical value from the Normal distribution $z$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  that corresponds to our confidence level

</div>


<div class="columns">
<div>
<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" >

| Confidence Level | $\alpha$ | $\alpha/2$ | 
| ----: | ----- | ---- | 
| 95% | 5% | 2.5% |  

</div>

</div>
<div>

<center>
<img src="./img/confidence_intervals/alpha_level.png" img height="440px" border="0px"/>
</center>

</div>
</div>

<!-- L’intervallo di confidenza (IC) al 95% è il più usato e intuitivamente abbiamo gia' capito da dove deirva il fattore 1.96 (circa 2SE contengono il 95% dei campioni), ma vediamolo in modo piu' formale 

Quando accettiamo un livello di confidenza del 95% accettiamo implicitamente un errore del 5%, distribuito equamente a dx e sx dell'intrevallo di confidenza (in verde), quindi 2.5% per parte -->

---
## The confidence level

<div style="font-size: 90%">

:dart: &nbsp; We multiply by the critical value from the Normal distribution $z$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  that corresponds to our confidence level

</div>

<div class="columns">
<div>
<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" >

| Confidence Level | $\alpha$ | $\alpha/2$ | 
| ----: | ----- | ---- | 
| 95% | 5% | 2.5% |

$100\% - 2.5\% = 97.5\%$ 
</div>

</div>
<div>

<center>
<img src="./img/confidence_intervals/alpha_level_area.png" img height="440px" border="0px"/>
</center>

</div>
</div>

<!--  e qual e' l'aera di questa parte bianca? E' la totalita' dell'area (1, o 100%) meno l'area bianca (2.5%), quindi 97.5%-->

---
## The confidence level

<div style="font-size: 90%">

:dart: &nbsp; We multiply by the critical value from the Normal distribution $z$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  that corresponds to our confidence level

</div>

<div class="columns">
<div>

<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" >

| Confidence Level | $\alpha$ | $\alpha/2$ | 
| ----: | ----- | ---- | 
| 95% | 5% | 2.5% |

$100\% - 2.5\% = 97.5\% \rightarrow \mathcal{z} = 1.96$  

</div>

</div>
<div>

<center>
<img src="./img/confidence_intervals/normal_table_zoom2.png" img height="400px" border="4px"/>
</center>

</div>
</div>

<!--  E' qual e' il valore di z per cui la curva sottende un'area del 97.5%? 1.96 (le tavole si possono anche leggere al contrario, non solo da z all'area, ma anche dall'area a z) 

coefficiente di attendibilita'-->

---
## The confidence level

<div style="font-size: 90%">

:dart: &nbsp; We multiply by the critical value from the Normal distribution $z$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  that corresponds to our confidence level

</div>

<div class="columns">
<div>
<span style="display:block; height:10px;"></span>

<div style="font-size: 80%" >

| Confidence Level | $\alpha$ | $\alpha/2$ | 
| ----: | ----- | ---- | 
| 95% | 5% | 2.5% |
| 90% | 10% | 5.0% | 
| 99% | 1% | 0.5% | 

<span style="display:block; height:10px;"></span>

$100\% - 2.5\% = 97.5\% \rightarrow \mathcal{z} = 1.96$ 
$100\% - 5.0\% = 95.0\% \rightarrow \mathcal{z} = 1.65$ 
$100\% - 0.5\% = 99.5\% \rightarrow \mathcal{z} = 2.58$ 

</div>

</div>
<div>

<center>
<img src="./img/confidence_intervals/alpha_level_area.png" img height="440px" border="0px"/>
</center>

</div>
</div>

<!-- 95% e' il valore piu' usato, ma altri comuni sono 90 e 99%, a cui corrispondono fattori di attendibilita' di 1.65 e 2.58

Faremo piu' avanti degli esercizi in cui ci calcoleremo 90 e 99% CI -->

---
### Exercise #8

<div style="font-size: 90%" >

:question: &nbsp;&nbsp;&nbsp; Given that $\mathcal{N} = (\mu, \frac{\sigma^2}{n})$ with $\sqrt{ \frac{\sigma^2}{n}} = \frac{\sigma}{\sqrt{n}} \rightarrow$ &nbsp; standard error (SE), 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  how can one reduce the width of the confidence interval?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) increasing $n$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) decreasing $n$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) increasing $\sigma$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) decreasing $\sigma$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) increasing the confidence level
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f) decreasing the confidence level


</div>

<span style="display:block; height:10px;"></span>

<style>
  #countdown_exercise_8{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_8.running {
    background-color: green;
  }
  #countdown_exercise_8.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_8"></button>

<script>
<!--
const countdown_exercise_8= document.getElementById("countdown_exercise_8");
const seconds_exercise_8= 30; // seconds_exercise_8
let timeLeft_exercise_8= seconds_exercise_8;
let timerInterval_exercise_8= null;

function formatTime_exercise_8(seconds_exercise_8) {
  const minutes = Math.floor(seconds_exercise_8/ 60);
  const remainingseconds_exercise_8= seconds_exercise_8% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_8).padStart(2, '0')}`;
}

function updateButton_exercise_8() {
  countdown_exercise_8.textContent = formatTime_exercise_8(timeLeft_exercise_8);
}

function startTimer_exercise_8() {
  if (timerInterval_exercise_8=== null) {
    countdown_exercise_8.classList.add('running');
    countdown_exercise_8.classList.remove('finished');
    timerInterval_exercise_8= setInterval(() => {
      if (timeLeft_exercise_8> 0) {
        timeLeft_exercise_8--;
        updateButton_exercise_8();
      } else {
        clearInterval(timerInterval_exercise_8);
        timerInterval_exercise_8= null;
        countdown_exercise_8.classList.remove('running');
        countdown_exercise_8.classList.add('finished');
        countdown_exercise_8.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_8();
  }
}

function pauseTimer_exercise_8() {
  clearInterval(timerInterval_exercise_8);
  timerInterval_exercise_8= null;
  countdown_exercise_8.classList.remove('running');
}

function resetTimer_exercise_8() {
  timeLeft_exercise_8= seconds_exercise_8;
  updateButton_exercise_8();
  countdown_exercise_8.classList.remove('finished');
  countdown_exercise_8.classList.remove('running');
  timerInterval_exercise_8= null;
}

countdown_exercise_8.addEventListener("click", () => {
  if (countdown_exercise_8.classList.contains('finished')) {
    resetTimer_exercise_8();
  } else {
    startTimer_exercise_8();
  }
});

updateButton_exercise_8();
-->
</script>


---
### Exercise #8 -- Solution

<div style="font-size: 90%" >

:question: &nbsp;&nbsp;&nbsp; Given that $\mathcal{N} = (\mu, \frac{\sigma^2}{n})$ with $\sqrt{ \frac{\sigma^2}{n}} = \frac{\sigma}{\sqrt{n}} \rightarrow$ &nbsp; standard error (SE), 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  how can one reduce the width of the confidence interval?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) increasing $n$ &nbsp; :white_check_mark:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) decreasing $n$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) increasing $\sigma$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d) decreasing $\sigma$ &nbsp; :ballot_box_with_check:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e) increasing the confidence level
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f) decreasing the confidence level &nbsp; :white_check_mark:


</div>

<!-- Abbiamo un confidence interval molto stretto perche' si sono verificate due condizioni che, indipendentemente, migliorano la stima intervallare:
- un'alta numerosit&agrave; campionaria e
- una bassa variabilita s tra le osservazioni 

Peccato che sigma non la possiamo controllare :) 
-->


---
### Exercise #9

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; If the CI is large we are...

<span style="display:block; height:10px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) more likely of including $\mu$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) less likely of including $\mu$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) there is no difference


</div>

</div>
<div>

<center>
<img src="./img/confidence_intervals/unannotated_CI.png" img height="400px" border="4px"/>
</center>

</div>
</div>

<span style="display:block; height:20px;"></span>

<style>
  #countdown_exercise_9{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_9.running {
    background-color: green;
  }
  #countdown_exercise_9.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_9"></button>

<script>
<!--
const countdown_exercise_9= document.getElementById("countdown_exercise_9");
const seconds_exercise_9= 60; // seconds_exercise_9
let timeLeft_exercise_9= seconds_exercise_9;
let timerInterval_exercise_9= null;

function formatTime_exercise_9(seconds_exercise_9) {
  const minutes = Math.floor(seconds_exercise_9/ 60);
  const remainingseconds_exercise_9= seconds_exercise_9% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_9).padStart(2, '0')}`;
}

function updateButton_exercise_9() {
  countdown_exercise_9.textContent = formatTime_exercise_9(timeLeft_exercise_9);
}

function startTimer_exercise_9() {
  if (timerInterval_exercise_9=== null) {
    countdown_exercise_9.classList.add('running');
    countdown_exercise_9.classList.remove('finished');
    timerInterval_exercise_9= setInterval(() => {
      if (timeLeft_exercise_9> 0) {
        timeLeft_exercise_9--;
        updateButton_exercise_9();
      } else {
        clearInterval(timerInterval_exercise_9);
        timerInterval_exercise_9= null;
        countdown_exercise_9.classList.remove('running');
        countdown_exercise_9.classList.add('finished');
        countdown_exercise_9.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_9();
  }
}

function pauseTimer_exercise_9() {
  clearInterval(timerInterval_exercise_9);
  timerInterval_exercise_9= null;
  countdown_exercise_9.classList.remove('running');
}

function resetTimer_exercise_9() {
  timeLeft_exercise_9= seconds_exercise_9;
  updateButton_exercise_9();
  countdown_exercise_9.classList.remove('finished');
  countdown_exercise_9.classList.remove('running');
  timerInterval_exercise_9= null;
}

countdown_exercise_9.addEventListener("click", () => {
  if (countdown_exercise_9.classList.contains('finished')) {
    resetTimer_exercise_9();
  } else {
    startTimer_exercise_9();
  }
});

updateButton_exercise_9();
-->
</script>

---
### Exercise #9 -- Solution

<span style="display:block; height:30px;"></span>

<center>
<img src="./img/confidence_intervals/small_large_CI_likelihood.png" img height="400px" border="4px"/>
</center>

---
### Exercise #9 -- Solution

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; If the CI is large we are...

<span style="display:block; height:10px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) more likely of including $\mu$ :white_check_mark:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) less likely of including $\mu$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) there is no difference


</div>
</div>
<div>

<center>
<img src="./img/confidence_intervals/unannotated_CI.png" img height="400px" border="4px"/>
</center>

</div>
</div>

---
### Exercise #10

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; If the CI is large we are...

<span style="display:block; height:10px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) more precise
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) less precise
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) there is no difference


</div>

</div>
<div>

<center>
<img src="./img/confidence_intervals/unannotated_CI.png" img height="400px" border="4px"/>
</center>

</div>
</div>

<span style="display:block; height:20px;"></span>

<style>
  #countdown_exercise_10{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_10.running {
    background-color: green;
  }
  #countdown_exercise_10.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_10"></button>

<script>
<!--
const countdown_exercise_10= document.getElementById("countdown_exercise_10");
const seconds_exercise_10= 60; // seconds_exercise_10
let timeLeft_exercise_10= seconds_exercise_10;
let timerInterval_exercise_10= null;

function formatTime_exercise_10(seconds_exercise_10) {
  const minutes = Math.floor(seconds_exercise_10/ 60);
  const remainingseconds_exercise_10= seconds_exercise_10% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_10).padStart(2, '0')}`;
}

function updateButton_exercise_10() {
  countdown_exercise_10.textContent = formatTime_exercise_10(timeLeft_exercise_10);
}

function startTimer_exercise_10() {
  if (timerInterval_exercise_10=== null) {
    countdown_exercise_10.classList.add('running');
    countdown_exercise_10.classList.remove('finished');
    timerInterval_exercise_10= setInterval(() => {
      if (timeLeft_exercise_10> 0) {
        timeLeft_exercise_10--;
        updateButton_exercise_10();
      } else {
        clearInterval(timerInterval_exercise_10);
        timerInterval_exercise_10= null;
        countdown_exercise_10.classList.remove('running');
        countdown_exercise_10.classList.add('finished');
        countdown_exercise_10.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_10();
  }
}

function pauseTimer_exercise_10() {
  clearInterval(timerInterval_exercise_10);
  timerInterval_exercise_10= null;
  countdown_exercise_10.classList.remove('running');
}

function resetTimer_exercise_10() {
  timeLeft_exercise_10= seconds_exercise_10;
  updateButton_exercise_10();
  countdown_exercise_10.classList.remove('finished');
  countdown_exercise_10.classList.remove('running');
  timerInterval_exercise_10= null;
}

countdown_exercise_10.addEventListener("click", () => {
  if (countdown_exercise_10.classList.contains('finished')) {
    resetTimer_exercise_10();
  } else {
    startTimer_exercise_10();
  }
});

updateButton_exercise_10();
-->
</script>

---
### Exercise #10 -- Solution

<span style="display:block; height:30px;"></span>

<center>
<img src="./img/confidence_intervals/small_large_CI_precision.png" img height="400px" border="4px"/>
</center>

---
### Exercise #10 -- Solution

<div class="columns">
<div>

<span style="display:block; height:30px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; If the CI is large we are...

<span style="display:block; height:10px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) more precise 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) less precise :white_check_mark:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) there is no difference

</div>
</div>
<div>

<center>
<img src="./img/confidence_intervals/unannotated_CI.png" img height="400px" border="4px"/>
</center>

</div>
</div>


---
## The Central Limit Theorem

<div style="font-size: 90%">

- There is variability in the estimate of a parameter that depends on the sample (the sampling distribution).

- We would like to have a range of plausible ("common") values for the population parameter

- The shape of the sampling distribution does not depend on the shape of the empirical distribution and, **<u>for large samples</u>**, can be approximated by a Normal distribution


<div align="right">
How large is “large”? &nbsp;&nbsp;&nbsp;&nbsp;
</div>

</div>

---
## The Central Limit Theorem

<div style="font-size: 90%">

- There is variability in the estimate of a parameter that depends on the sample (the sampling distribution).

- We would like to have a range of plausible ("common") values for the population parameter

- The shape of the sampling distribution does not depend on the shape of the empirical distribution and, **<u>for large samples</u>**, can be approximated by a Normal distribution


<div align="right">
What if our sample is "small"?
</div>

</div>

---
## What if our sample is "small"?

<img src="./img/confidence_intervals/tdist_df_empty.png" img height="440px" border="0px" align="right"/>


<span style="display:block; height:10px;"></span>

<div style="font-size: 85%" >

- Cannot approximated with a Normal distribution
- One should use the Student’s $\mathcal{t}$ distribution
  
</div>

<!-- Quando la dimensione campionaria e' grande la nostra fiducia nell'approssimare sigma con la varianza campionaria e' ben riposta  e possiamo usare la normale per il calcolo dei CI, ma cosa succede quando i campioni soo piccoli? Usiamo la distribuzione  di Student
 -->

---
## The Student's $\mathcal{t}$ distribution 

<img src="./img/confidence_intervals/tdist_df1.png" img height="440px" border="0px" align="right"/>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%" >

- It takes into account the degrees of freedom (df)

</div>

<!-- 
- &egrave; una famiglia di distribuzioni, 1 per ogni valore campionario n-1

Come la normale:
- ha media 0
- &egrave; simmetrica
- ha varianza >1 che si avvicina a 1 al crescere di N


Meno appuntita al centro e code pi&ugrave; alte
 -->

---
## The Student's $\mathcal{t}$ distribution 

<img src="./img/confidence_intervals/tdist_df1.png" img height="440px" border="0px" align="right"/>


<span style="display:block; height:10px;"></span>

<div style="font-size: 85%" >

- It takes into account the degrees of freedom (df)
  - In a sample of size $n$  $\rightarrow \text{df} = n -1$
  - In two samples of size $n_1$ and $n_2$  $\rightarrow$ &nbsp; $\text{df} = n_1 + n_2 - 2$

</div>

 ---
## The Student's $\mathcal{t}$ distribution 

<img src="./img/confidence_intervals/tdist_df5.png" img height="440px" border="0px" align="right"/>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%" >

- It takes into account the degrees of freedom (df)
  - In a sample of size $n$  $\rightarrow \text{df} = n -1$
  - In two samples of size $n_1$ and $n_2$  $\rightarrow$ &nbsp; $\text{df} = n_1 + n_2 - 2$
  
</div>


<!-- 
- &egrave; una famiglia di distribuzioni, 1 per ogni valore campionario n-1

Come la normale:
- ha media 0
- &egrave; simmetrica
- ha varianza >1 che si avvicina a 1 al crescere di N


Meno appuntita al centro e code pi&ugrave; alte
 -->

 ---
## The Student's $\mathcal{t}$ distribution 

<img src="./img/confidence_intervals/tdist_df30.png" img height="440px" border="0px" align="right"/>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%" >

- It takes into account the degrees of freedom (df)
  - In a sample of size $n$  $\rightarrow \text{df} = n -1$
  - In two samples of size $n_1$ and $n_2$  $\rightarrow$ &nbsp; $\text{df} = n_1 + n_2 - 2$

</div>

<!-- 
- &egrave; una famiglia di distribuzioni, 1 per ogni valore campionario n-1

Come la normale:
- ha media 0
- &egrave; simmetrica
- ha varianza >1 che si avvicina a 1 al crescere di N


Meno appuntita al centro e code pi&ugrave; alte
 -->

---
## The Student's $\mathcal{t}$ distribution 

<img src="./img/confidence_intervals/tdist_table_zoom.png" img height="550px" border="4px" align="right"/>

<span style="display:block; height:10px;"></span>

<div style="font-size: 85%" >

- It takes into account the degrees of freedom (df)
  - In a sample of size $n$  $\rightarrow \text{df} = n -1$
  - In two samples of size $n_1$ and $n_2$  $\rightarrow$ &nbsp; $\text{df} = n_1 + n_2 - 2$


<span style="display:block; height:10px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\longrightarrow \text{95\% ME} = \mathcal{t} \times \hat{SE}$ 

</div>

---
### Exercise #11

<div class="columns">
<div>

<span style="display:block; height:1px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; $n=15$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{BMI}} = 25.0 \text{ kg}/\text{m}^2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $s_{\text{BMI}}  = 2.7 \text{ kg}/\text{m}^2$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}=s/\sqrt{n} = \text{ ?}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{df} = n-1 = \text{ ?}$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% CI} = \text{ ?}$ 


</div>

<span style="display:block; height:40px;"></span>

<style>
  #countdown_exercise_11{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
	float: right;
  }
  #countdown_exercise_11.running {
    background-color: green;
  }
  #countdown_exercise_11.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_11"></button>

<script>
<!--
const countdown_exercise_11= document.getElementById("countdown_exercise_11");
const seconds_exercise_11= 300; // seconds_exercise_11
let timeLeft_exercise_11= seconds_exercise_11;
let timerInterval_exercise_11= null;

function formatTime_exercise_11(seconds_exercise_11) {
  const minutes = Math.floor(seconds_exercise_11/ 60);
  const remainingseconds_exercise_11= seconds_exercise_11% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_11).padStart(2, '0')}`;
}

function updateButton_exercise_11() {
  countdown_exercise_11.textContent = formatTime_exercise_11(timeLeft_exercise_11);
}

function startTimer_exercise_11() {
  if (timerInterval_exercise_11=== null) {
    countdown_exercise_11.classList.add('running');
    countdown_exercise_11.classList.remove('finished');
    timerInterval_exercise_11= setInterval(() => {
      if (timeLeft_exercise_11> 0) {
        timeLeft_exercise_11--;
        updateButton_exercise_11();
      } else {
        clearInterval(timerInterval_exercise_11);
        timerInterval_exercise_11= null;
        countdown_exercise_11.classList.remove('running');
        countdown_exercise_11.classList.add('finished');
        countdown_exercise_11.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_11();
  }
}

function pauseTimer_exercise_11() {
  clearInterval(timerInterval_exercise_11);
  timerInterval_exercise_11= null;
  countdown_exercise_11.classList.remove('running');
}

function resetTimer_exercise_11() {
  timeLeft_exercise_11= seconds_exercise_11;
  updateButton_exercise_11();
  countdown_exercise_11.classList.remove('finished');
  countdown_exercise_11.classList.remove('running');
  timerInterval_exercise_11= null;
}

countdown_exercise_11.addEventListener("click", () => {
  if (countdown_exercise_11.classList.contains('finished')) {
    resetTimer_exercise_11();
  } else {
    startTimer_exercise_11();
  }
});

updateButton_exercise_11();
-->
</script>


</div>
<div>

<center>
<img src="./img/confidence_intervals/tdist_table_zoom.png" img height="550px" border="4px"/>
</center>

</div>
</div>

<!-- coefficiente di attendibilita' -->

---
### Exercise #11 -- Solution

<div class="columns">
<div>

<span style="display:block; height:1px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; $n=15$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{BMI}} = 25.0 \text{ kg}/\text{m}^2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $s_{\text{BMI}}  = 2.7 \text{ kg}/\text{m}^2$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}=s/\sqrt{n} = \frac{2.7}{\sqrt{15}}= 0.7$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{df} = n-1 = 15 - 1 = 14$

</div>
</div>
<div>

<center>
<img src="./img/confidence_intervals/tdist_table_zoom.png" img height="550px" border="4px"/>
</center>

</div>
</div>

---
### Exercise #11 -- Solution

<div class="columns">
<div>

<span style="display:block; height:1px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; $n=15$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{BMI}} = 25.0 \text{ kg}/\text{m}^2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $s_{\text{BMI}}  = 2.7 \text{ kg}/\text{m}^2$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}=s/\sqrt{n} = \frac{2.7}{\sqrt{15}}= 0.7$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{df} = n-1 = 15 - 1 = 14$

</div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = \mathcal{t} \times \hat{SE} =$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= 2.145 \times 0.7 = 1.5$

</div>
</div>
<div>

<center>
<img src="./img/confidence_intervals/tdist_table_zoom.png" img height="550px" border="4px"/>
</center>

</div>
</div>

<!-- Abbiamo un grado di confidenza del 95% che la media della popolazione p sia compresa tra 24.28 e 25.72 -->

---
### Exercise #11 -- Solution


<span style="display:block; height:1px;"></span>

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; $n=15$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{x}_{\text{BMI}} = 25.0 \text{ kg}/\text{m}^2$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $s_{\text{BMI}}  = 2.7 \text{ kg}/\text{m}^2$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}}=s/\sqrt{n} = \frac{2.7}{\sqrt{15}}= 0.7$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{df} = n-1 = 15 - 1 = 14$

</div>

<div style="font-size: 70%" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 1.5$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% CI} = (\bar{x} - \text{95\% ME} \text{ } ; \text{ } \bar{x} + \text{95\% ME}) =$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (25.0 - 1.5; \text{ } 25.0 + 1.5) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (23.5; 26.5)$

</div>

</div>


<!-- Abbiamo un grado di confidenza del 95% che la media della popolazione p sia compresa tra 24.28 e 25.72 -->

---
### Confidence intervals for differences of means

<div style="font-size: 90%">

<span style="display:block; height:40px;"></span>

<!-- :pushpin: &nbsp;&nbsp;&nbsp;  -->
<!-- Which is the *true* difference in mean between two groups? -->

<div class="columns">
<div>

<div style="font-size: 90%" >

:pushpin: &nbsp;&nbsp;&nbsp; $\mathcal{N} = (\mu_{\text{i}} - \mu_{\text{c}}, \sqrt{\frac{\sigma_\text{i}^2}{n_\text{i}} + \frac{\sigma_\text{c}^2}{n_\text{c}}})$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{s_\text{i}^2}{n_\text{i}} + \frac{s_\text{c}^2}{n_\text{c}}}$

</div>

</div>
<div>

</div>
</div>

</div>

<!-- 
Ci sono casi in cui vogliamo stimare la differenza tra medie di una popolazione (per esempio tra i pazienti che hanno ricevuto un nuovo trattamento e quelli che hanno avuto la cura standard o il placebo)

Non lo abbiamo vistp in dettaglio in precedenza, ma, per il CLT la differenza tra le medie campionarie e' una stima non distorta della differenza delle medie delle due popolazioni -->

---
### Exercise #12

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in mean between the two groups?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/jama_network.png" img height="180px" border="4px"/>
</center>

<div class="columns">
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= \text{ ?}, \text{ } \text{ } \text{ } \text{ } \bar{x}_{\text{i}}= \text{ ?}, \text{ } \text{ } \text{ }  s_\text{i} = 10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= \text{ ?}, \text{ } \text{ }  \text{ } \text{ }  \bar{x}_{\text{c}}= \text{ ?}, \text{ } \text{ }  s_\text{c} = 8.7$ 

</div>
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{s_\text{i}^2}{n_\text{i}} + \frac{s_\text{c}^2}{n_\text{c}}} = \text{ ?}$

</div>
</div>

</div>

<span style="display:block; height:1px;"></span>


<style>
  #countdown_exercise_12{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_12.running {
    background-color: green;
  }
  #countdown_exercise_12.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_12"></button>

<script>
<!--
const countdown_exercise_12= document.getElementById("countdown_exercise_12");
const seconds_exercise_12= 300; // seconds_exercise_12
let timeLeft_exercise_12= seconds_exercise_12;
let timerInterval_exercise_12= null;

function formatTime_exercise_12(seconds_exercise_12) {
  const minutes = Math.floor(seconds_exercise_12/ 60);
  const remainingseconds_exercise_12= seconds_exercise_12% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_12).padStart(2, '0')}`;
}

function updateButton_exercise_12() {
  countdown_exercise_12.textContent = formatTime_exercise_12(timeLeft_exercise_12);
}

function startTimer_exercise_12() {
  if (timerInterval_exercise_12=== null) {
    countdown_exercise_12.classList.add('running');
    countdown_exercise_12.classList.remove('finished');
    timerInterval_exercise_12= setInterval(() => {
      if (timeLeft_exercise_12> 0) {
        timeLeft_exercise_12--;
        updateButton_exercise_12();
      } else {
        clearInterval(timerInterval_exercise_12);
        timerInterval_exercise_12= null;
        countdown_exercise_12.classList.remove('running');
        countdown_exercise_12.classList.add('finished');
        countdown_exercise_12.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_12();
  }
}

function pauseTimer_exercise_12() {
  clearInterval(timerInterval_exercise_12);
  timerInterval_exercise_12= null;
  countdown_exercise_12.classList.remove('running');
}

function resetTimer_exercise_12() {
  timeLeft_exercise_12= seconds_exercise_12;
  updateButton_exercise_12();
  countdown_exercise_12.classList.remove('finished');
  countdown_exercise_12.classList.remove('running');
  timerInterval_exercise_12= null;
}

countdown_exercise_12.addEventListener("click", () => {
  if (countdown_exercise_12.classList.contains('finished')) {
    resetTimer_exercise_12();
  } else {
    startTimer_exercise_12();
  }
});

updateButton_exercise_12();
-->
</script>

<span style="display:block; height:1px;"></span>

<div style="font-size: 50%" align="left">

<br/> Tomazini B.M., *et al.*, *Effect of Dexamethasone on Days Alive and Ventilator-Free in Patients With Moderate or Severe Acute Respiratory Distress Syndrome and COVID-19*, JAMA, 2020

</div>


<!-- Abbiamo due gruppo di pazienti con COVID-19 e sindrome da distress respiratorio acuto moderato o grave (ARDS
uno con lo standard of care e uno a cui abbiamo somministrati desametasone endovenoso. 

Il numero di giorni di respirazione autonoma????

Qual e' il CI per la differenza delle medie dei due gruppi?
-->

---
### Exercise #12 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in mean between the two groups?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/jama_network.png" img height="180px" border="4px"/>
</center>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 151, \text{ } \text{ } \text{ } \text{ } \bar{x}_{\text{i}}= 6.6, \text{ } \text{ } \text{ }  s_\text{i} = 10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 148, \text{ } \text{ }  \text{ } \text{ }  \bar{x}_{\text{c}}= 4.0, \text{ } \text{ }  s_\text{c} = 8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{s_\text{i}^2}{n_\text{i}} + \frac{s_\text{c}^2}{n_\text{c}}} = \sqrt{\frac{10.0^2}{151} + \frac{8.7^2}{148}} = 1.08$

</div>


<!--  CTL differenza tra le medie campionarie e' la diffeenza tra le medie della popolazione
SE lo calcoliamo cosi' -->


---
### Exercise #12 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in mean between the two groups?

<span style="display:block; height:1px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 151, \text{ } \text{ } \text{ } \text{ } \bar{x}_{\text{i}}= 6.6, \text{ } \text{ } \text{ }  s_\text{i} = 10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 148, \text{ } \text{ }  \text{ } \text{ }  \bar{x}_{\text{c}}= 4.0, \text{ } \text{ }  s_\text{c} = 8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{s_\text{i}^2}{n_\text{i}} + \frac{s_\text{c}^2}{n_\text{c}}} = \sqrt{\frac{10.0^2}{151} + \frac{8.7^2}{148}} = 1.08$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 2 \times \hat{SE} = 2 \times 1.08 = 2.16$

</div>

---
### Exercise #12 -- Solution

<div style="font-size: 80%" >

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in mean between the two groups?

<span style="display:block; height:1px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 151, \text{ } \text{ } \text{ } \text{ } \bar{x}_{\text{i}}= 6.6, \text{ } \text{ } \text{ }  s_\text{i} = 10.0$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 148, \text{ } \text{ }  \text{ } \text{ }  \bar{x}_{\text{c}}= 4.0, \text{ } \text{ }  s_\text{c} = 8.7$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{s_\text{i}^2}{n_\text{i}} + \frac{s_\text{c}^2}{n_\text{c}}} = \sqrt{\frac{10.0^2}{151} + \frac{8.7^2}{148}} = 1.08$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 2 \times \hat{SE} = 2 \times 1.08 = 2.16$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% CI} = (\bar{x}_{\text{i}} - \bar{x}_{\text{c}}) - \text{95\% ME} \text{ } ; \text{ } (\bar{x}_{\text{i}} - \bar{x}_{\text{c}}) + \text{95\% ME} =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= ((6.6-4.0) - 2.16 \text{ } ; \text{ } (6.6-4.0) + 2.16) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (2.6 - 2.16 \text{ } ; \text{ } 2.6+2.16 ) = (0.44 \text{ } ; \text{ } 4.78)$


</div>

<!--  stima +/- prodotto tra il coefficiente di attendibilita' e l'errore standard 

Abbiamo un grado di confidenza del 95% che la differenza delle medie delle due popolazioni sia compresa tra questi valori -->


---
## Confidence intervals for proportions

<span style="display:block; height:40px;"></span>

<div style="font-size: 90%" >

<!-- :pushpin: &nbsp;&nbsp;&nbsp;  Which is the *true* proportion of individuals with a given    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; characteristic in a population? -->

:pushpin: &nbsp;&nbsp;&nbsp;  $\mathcal{N} = (\pi, \frac{\pi \times (1-\pi)}{n})$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{SE} = \sqrt{\frac{\bar{p}\times(1-\bar{p})}{n}}$, &nbsp; where $\bar{p} = \frac{m}{n}$

</div>

<!-- 
In campo medico ci sono molte questioni legate alla proporzione di pazienti con una certa caratteristica. Per esempio la proporzione di pazienti con una malattia, la proporzione di pazienti che necessita un ricovero, o quella che soffre di effetti collaterali dopo l'assunzione di un farmaco

Per il teorema del limite centrale, di nuovo, la proporzione campionaria e' una stima non distorta della proporzione della popolazione e la distribuzione campionaria si approssima ad una normale 

 -->

---
### Exercise #13

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* proportion of women with endometriosis in the population?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/endometriosis.png" img height="180px" border="4px"/>
</center>

<div class="columns">
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n= \text{ ?}, \text{ } \text{ } \text{ } \text{ } m = \text{ ?}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{p} = \frac{m}{n} = \text{ ?}$ 

</div>
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{SE} = \sqrt{\frac{\bar{p}\times(1-\bar{p})}{n}} = \text{ ?}$

</div>
</div>

</div>

<span style="display:block; height:1px;"></span>


<style>
  #countdown_exercise_13{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_13.running {
    background-color: green;
  }
  #countdown_exercise_13.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_13"></button>

<script>
<!--
const countdown_exercise_13= document.getElementById("countdown_exercise_13");
const seconds_exercise_13= 300; // seconds_exercise_13
let timeLeft_exercise_13= seconds_exercise_13;
let timerInterval_exercise_13= null;

function formatTime_exercise_13(seconds_exercise_13) {
  const minutes = Math.floor(seconds_exercise_13/ 60);
  const remainingseconds_exercise_13= seconds_exercise_13% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_13).padStart(2, '0')}`;
}

function updateButton_exercise_13() {
  countdown_exercise_13.textContent = formatTime_exercise_13(timeLeft_exercise_13);
}

function startTimer_exercise_13() {
  if (timerInterval_exercise_13=== null) {
    countdown_exercise_13.classList.add('running');
    countdown_exercise_13.classList.remove('finished');
    timerInterval_exercise_13= setInterval(() => {
      if (timeLeft_exercise_13> 0) {
        timeLeft_exercise_13--;
        updateButton_exercise_13();
      } else {
        clearInterval(timerInterval_exercise_13);
        timerInterval_exercise_13= null;
        countdown_exercise_13.classList.remove('running');
        countdown_exercise_13.classList.add('finished');
        countdown_exercise_13.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_13();
  }
}

function pauseTimer_exercise_13() {
  clearInterval(timerInterval_exercise_13);
  timerInterval_exercise_13= null;
  countdown_exercise_13.classList.remove('running');
}

function resetTimer_exercise_13() {
  timeLeft_exercise_13= seconds_exercise_13;
  updateButton_exercise_13();
  countdown_exercise_13.classList.remove('finished');
  countdown_exercise_13.classList.remove('running');
  timerInterval_exercise_13= null;
}

countdown_exercise_13.addEventListener("click", () => {
  if (countdown_exercise_13.classList.contains('finished')) {
    resetTimer_exercise_13();
  } else {
    startTimer_exercise_13();
  }
});

updateButton_exercise_13();
-->
</script>


<span style="display:block; height:1px;"></span>

<div style="font-size: 50%" align="left">

<br/> Ferrero S.., *et al.*, *Prevalence of newly diagnosed endometriosis in women attending the general practitioner*,  <br/> Int J Gynaecol Obstet, 2020

</div>

---
### Exercise #13 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* proportion of women with endometriosis in the population?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/endometriosis.png" img height="180px" border="4px"/>
</center>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n= 1291, \text{ } \text{ } \text{ } \text{ } m = 46$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{p} = \frac{m}{n} = \frac{46}{1291} = 0.036 = 3.6\%$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{SE} = \sqrt{\frac{\bar{p}\times(1-\bar{p})}{n}} = \sqrt{\frac{0.036\times(1-0.036)}{1291}} = 0.005$

</div>

---
### Exercise #13 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* proportion of women with endometriosis in the population?

<span style="display:block; height:1px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n= 1291, \text{ } \text{ } \text{ } \text{ } m = 46$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{p} = \frac{m}{n} = \frac{46}{1291} = 0.036 = 3.6\%$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{SE} = \sqrt{\frac{\bar{p}\times(1-\bar{p})}{n}} = \sqrt{\frac{0.036\times(1-0.036)}{1291}} = 0.005$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 2 \times \hat{SE} = 2 \times 0.005 = 0.01$

</div>

---
### Exercise #13 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* proportion of women with endometriosis in the population?

<span style="display:block; height:1px;"></span>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n= 1291, \text{ } \text{ } \text{ } \text{ } m = 46$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\bar{p} = \frac{m}{n} = \frac{46}{1291} = 0.036 = 3.6\%$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{SE} = \sqrt{\frac{\bar{p}\times(1-\bar{p})}{n}} = \sqrt{\frac{0.036\times(1-0.036)}{1291}} = 0.005$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 2 \times \hat{SE} = 2 \times 0.005 = 0.01$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% CI} = (\bar{p} - \text{95\% ME} \text{ } ; \text{ } \bar{p} + \text{95\% ME} =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (0.036 - 0.01 \text{ } ; \text{ } 0.036 + 0.01 ) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (0.026 \text{ } ; \text{ } 0.046 ) = (2.6\% \text{ } ; \text{ } 4.6\%)$


</div>


---
### Confidence intervals for differences of proportion

<div style="font-size: 90%" >

<!-- :pushpin: &nbsp;&nbsp;&nbsp; Which is the *true* difference in proportion between two groups? -->

<span style="display:block; height:40px;"></span>

:pushpin: &nbsp;&nbsp;&nbsp; $\mathcal{N} = (\pi_{\text{i}} - \pi_{\text{c}}, \frac{\pi_i \times (1-\pi_i)}{n_i}+\frac{\pi_c \times (1-\pi_c)}{n_c})$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{\bar{p}_i \times (1-\bar{p}_i)}{n_i}+\frac{\bar{p}_c \times (1-\bar{p}_c)}{n_c}}$

</div>


<!--
Spesso, nella clinica, siamo interessati a confrontare le proporzioni di pazienti con una certa caratteristica che provengono da due diverse popolazioi, come la proporzione di uomini e donne che soffrono di una qualche malattia, o due gruppi di persone che rispondono o meno ad un farmaco

 Per il teorema del limite centrale, di nuovo, la differenza tra le proporzioni campionarie e' una stima non distorta della differenza di proporzioni nella popolazione e la distribuzione campionaria si approssima ad una normale  -->

---
### Exercise #14

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in proportion between two groups?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/nejm.png" img height="160px" border="4px"/>
</center>

<div class="columns">
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= \text{ ?}, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= \text{ ?}, \text{ } \text{ } \text{ }  p_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \text{ ?}$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= \text{ ?}, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= \text{ ?}, \text{ } \text{ }  p_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \text{ ?}$ 

</div>
<div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{\bar{p}_\text{i} \times (1-\bar{p}_\text{i})}{n_\text{i}}+\frac{\bar{p}_\text{c} \times (1-\bar{p}_\text{c})}{n_\text{c}}} = \text{ ?}$

</div>
</div>

</div>

<span style="display:block; height:10px;"></span>

<style>
  #countdown_exercise_14{
    padding: 10px 20px;
    font-size: 20px;
    color: white;
    background-color: gray;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  #countdown_exercise_14.running {
    background-color: green;
  }
  #countdown_exercise_14.finished {
    background-color: red;
  }
</style>

<button id="countdown_exercise_14"></button>

<script>
<!--
const countdown_exercise_14= document.getElementById("countdown_exercise_14");
const seconds_exercise_14= 300; // seconds_exercise_14
let timeLeft_exercise_14= seconds_exercise_14;
let timerInterval_exercise_14= null;

function formatTime_exercise_14(seconds_exercise_14) {
  const minutes = Math.floor(seconds_exercise_14/ 60);
  const remainingseconds_exercise_14= seconds_exercise_14% 60;
  return `${String(minutes).padStart(2, '0')}:${String(remainingseconds_exercise_14).padStart(2, '0')}`;
}

function updateButton_exercise_14() {
  countdown_exercise_14.textContent = formatTime_exercise_14(timeLeft_exercise_14);
}

function startTimer_exercise_14() {
  if (timerInterval_exercise_14=== null) {
    countdown_exercise_14.classList.add('running');
    countdown_exercise_14.classList.remove('finished');
    timerInterval_exercise_14= setInterval(() => {
      if (timeLeft_exercise_14> 0) {
        timeLeft_exercise_14--;
        updateButton_exercise_14();
      } else {
        clearInterval(timerInterval_exercise_14);
        timerInterval_exercise_14= null;
        countdown_exercise_14.classList.remove('running');
        countdown_exercise_14.classList.add('finished');
        countdown_exercise_14.textContent = "Time's up!";
      }
    }, 1000);
  } else {
    pauseTimer_exercise_14();
  }
}

function pauseTimer_exercise_14() {
  clearInterval(timerInterval_exercise_14);
  timerInterval_exercise_14= null;
  countdown_exercise_14.classList.remove('running');
}

function resetTimer_exercise_14() {
  timeLeft_exercise_14= seconds_exercise_14;
  updateButton_exercise_14();
  countdown_exercise_14.classList.remove('finished');
  countdown_exercise_14.classList.remove('running');
  timerInterval_exercise_14= null;
}

countdown_exercise_14.addEventListener("click", () => {
  if (countdown_exercise_14.classList.contains('finished')) {
    resetTimer_exercise_14();
  } else {
    startTimer_exercise_14();
  }
});

updateButton_exercise_14();
-->
</script>


<span style="display:block; height:1px;"></span>

<div style="font-size: 50%" align="left">

<br/> Connor, E.M. *et al.*, *Reduction of Maternal-Infant Transmission of Human Immunodeficiency Virus Type 1 with Zidovudine Treatment*, NEJM, 1994

</div>


<!-- 
Randomized Trial on the efficacy of AZT in reducing the risk of maternal-infant HIV transmission
HIV positive pregnant women randomized to receive AZT or placebo -->

---
### Exercise #14 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in proportion between two groups?

<span style="display:block; height:1px;"></span>

<center>
<img src="./img/confidence_intervals/nejm.png" img height="160px" border="4px"/>
</center>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  p_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  p_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{\bar{p}_\text{i} \times (1-\bar{p}_\text{i})}{n_\text{i}}+\frac{\bar{p}_\text{c} \times (1-\bar{p}_\text{c})}{n_\text{c}}} = \sqrt{\frac{0.07 \times (1-0.07)}{180}+\frac{0.22 \times (1-0.22)}{183}} = 0.036$

</div>

<!--  differenza tra le proporzioni campionarie-->

---
### Exercise #14 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in proportion between two groups?

<span style="display:block; height:1px;"></span>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  p_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  p_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{\bar{p}_\text{i} \times (1-\bar{p}_\text{i})}{n_\text{i}}+\frac{\bar{p}_\text{c} \times (1-\bar{p}_\text{c})}{n_\text{c}}} = \sqrt{\frac{0.07 \times (1-0.07)}{180}+\frac{0.22 \times (1-0.22)}{183}} = 0.036$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 2 \times \hat{SE} = 2 \times 0.036 = 0.072$

</div>

---
### Exercise #14 -- Solution

<div style="font-size: 80%">

:question: &nbsp;&nbsp;&nbsp; Which is the *true* difference in proportion between two groups?

<span style="display:block; height:1px;"></span>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{i}}= 180, \text{ } \text{ } \text{ } \text{ } m_{\text{i}}= 13, \text{ } \text{ } \text{ }  p_\text{i} = \frac{m_\text{i}}{n_\text{i}} = \frac{13}{180} = 0.07$ 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $n_{\text{c}}= 183, \text{ } \text{ }  \text{ } \text{ }  m_{\text{c}}= 40, \text{ } \text{ }  p_\text{c} = \frac{m_\text{c}}{n_\text{c}} = \frac{40}{183} = 0.22$ 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{\text{SE}} = \sqrt{\frac{\bar{p}_\text{i} \times (1-\bar{p}_\text{i})}{n_\text{i}}+\frac{\bar{p}_\text{c} \times (1-\bar{p}_\text{c})}{n_\text{c}}} = \sqrt{\frac{0.07 \times (1-0.07)}{180}+\frac{0.22 \times (1-0.22)}{183}} = 0.036$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% ME} = 2 \times \hat{SE} = 2 \times 0.036 = 0.072$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\text{95\% CI} = ((\bar{p}_{\text{i}} - \bar{p}_{\text{c}}) - \text{95\% ME}  \text{ } ; \text{ } (\bar{p}_{\text{i}} - \bar{p}_{\text{c}}) + \text{95\% ME} ) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (-0.15 - 0.072 \text{ } ; \text{ }  -0.15 + 0.072) =$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $= (-0.222 ; -0.078)$ 

</div>

<!--  stima +/- prodotto tra il coefficiente di attendibilita' e l'errore standard  

Abbiamo un grado di confidenza del X% che la proporzione del della popolazione p sia compresa tra il x e x%
-->


---
![bg opacity](./img/backgrounds/confidence_intervals_bg.png)

## Summary

<div style="font-size: 80%" >

- We use statistics to estimate parameters (point estimates)
- Interval estimates (CI or ME) should be communicated along with the point estimates 
- Sample size influences the width of CIs
- The Central Limit Theorem states that sampling distributions tend toward a normal distribution for large samples, and it provides formulas for calculating confidence intervals
- A 95% confidence interval results from a procedure that, in 95% of cases, contains the true population value.
- For small samples, the sampling distribution is approximated by the Student’s t distribution

</div>

<!-- Abbiamo un grado di confidenza del X% che la proporzione del della popolazione p sia compresa tra il x e x% -->

---
![bg opacity](./img/backgrounds/wrappingup_bg.png)

<span style="display:block; height:190px;"></span>
# See you tomorrow
