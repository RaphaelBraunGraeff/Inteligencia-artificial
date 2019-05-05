<p align="justify">
<h1>Implementação de um Sistema Especialista Fuzzy para calcular a probabilidade de uma pessoa acertar o gol. <h1>
</p>
<h3>Bruno Georg Harle e
Raphael Braun Graeff <h3>




**1.Introdução**
<p align="justify">

  Neste relatório será detalhada a implementação de um Sistema Especialista Fuzzy utilizando a ferramenta FuzzyClips. A finalidade do sistema calcular a probabilidade de uma pessoa acertar o gol, levando em conta as variáveis: Força de chute e precisão.

</p>

  As variáveis lingüísticas de entrada e saída são mostradas na Tabela 1:



|   |Precisão| | |  
|---|---|---|---|
| Força de chute|  **Baixa**|**Media**|**Alta**|
|**Pouca**|Muito baixa | Baixa  | Normal  |   
|**Media** | Baixa  | Normal  | Alta  |
|**Alta**|Normal |Alta   | Muito alta  |

Tabela 1. Variáveis lingüísticas de probabilidade de acerto ao gol.
<p align="justify">
  Na primeira coluna da tabela estão descritos os valores possíveis para força de chute, enquanto na primeira linha estão descritos os os níveis de precisão. As informações seguintes são referentes as chances de acerto ao gol que certa pessoa tem.

</p>



2.Implementação e Testes
<p align="justify">
  Para cada variável lingüística foi definido um template. No caso do template Força , utilizou-se duas funções pré-definidas (z e s) e uma trapezóide:

  </p>

![Figura 1. Código deftemplate Força](https://lh6.googleusercontent.com/llPB1KljgPXs3W93eZ98HE74eKDw3wyFpklqLlb5Sy9kF-ofhWCPOiTexbi8_3tp-K6GhxtqRKkwhUvr8OLdufk62_Nz_Ob2WFddtqyKnySqyYz_-mTmacFCN4EIwY_5UCoC9Q1E)


<p align="justify">
  A Figura 2 ilustra os valores numéricos possíveis para a Força, considerando as variáveis linguísticas definidas na Tabela 1 e no template respectivo.
  </p>
  
![Figura 2. Plotagem dos Valores numéricos possíveis para a velocidade](https://lh5.googleusercontent.com/PqIlViIGDOg1IsiFkN4I5zIVm8wtJQks6_ccwYuW683m2ekjemcfphnN06TV3q8Yk02m1rl9eGKrJRDKAp01h4_ohbDRrl7o7DrvNYQrwxCygBXzUQ2YoQyCOLqWMLDtfaCsEKHt)

  
  No caso do template Precisão, utilizou-se duas funções pré-definidas (pi e s) e uma triangular:

![Figura 3. Código deftemplate Força](https://lh4.googleusercontent.com/NpQDZXISDA6gWsbHrJWYLvX8t8fywOJN1x9wkCaS_WC-Rwrm6wW9hLod61cM3xopLUcCKWh3qAOst59F4nit6e0BnkxibWu8YuPR3irp0wfJj8M-wznWYmNpBcTSRoed3spiGeZ3)

<p align="justify">
  A Figura 4 ilustra os valores numéricos possíveis para a Precisão, considerando as variáveis linguísticas definidas na Tabela 1 e no template respectivo.
  </p>
  
![Figura 4. Plotagem dos Valores numéricos possíveis para a Precisão](https://lh5.googleusercontent.com/YwLGgwtbj91aiL6whQ4LoetpN0uc8WSJDB9RZQ_sm-ctnCM1G26qTrYIRzykFrppl-Lj6dZ3YHjC0bszhUQZxJ8bZPBWgJnsu0HvgMdzGejVkHYqUJM-hec6SRl4QdRSZN8kJ2zH)

<p align="justify">
  As regras que definirão a Chance de Gol são colocadas em 5 regras distintas, uma para cada variável lingüística para a Chance de Gol. A utilização da declaração da salience foi a solução adotada para garantir que essas regras fossem executadas ANTES da regra de defuzzificação;
  </p>

![Figura 5. Código defrule muito_baixa](https://lh3.googleusercontent.com/Z2pzzWAnbbkG1b32sNx1yQEzBUqZID6NHnx_sLyBOvtmueEilyiWroANCoqWjSG_CCDWi5Gqi_C2658_rM5aarUR9jakPzZOU2vwS4VN9D35f8AlioCaoop1tS5HjVgeJQZ7Vc-P)



![Figura 6. Código defrule baixa, normal, alta e muito_alta](https://lh4.googleusercontent.com/WqwtQr9xAriwxuhH1EwBoiXlm6Inpz_sMj-MqOl2eyZD0r0dmhlPYAemw6eAMXtjpcrL9T5gb3WKCxpHvAm_mKREktWTmaVste00fAo_bkzzqEZinfInvBqinWuQFOME7VuIrlae)

<p align="justify">
  Para a defuzzificação, foi criada uma variável global e uma regra que também faz a plotagem do valor numérico encontrado. A regra defuzifica foi declarada com salience 0 de forma a ser executada posteriormente às demais regras do sistema.
  </p>

![Figura 7. Código defglobal](https://lh4.googleusercontent.com/XJO2eIQMnH7OFdWS0aXzprIz0qpHwqJPrsGmqz2d7JFon0CpV1rx_ZuqU_aR2oqQEb3II6YXFuWnAUzsbp-BTKqDQ6y5XgTsW20XdB9Ca-m1jyie6AwMOibShESru473QsP3-Va5)

![Figura 8. Código defuzifica](https://lh5.googleusercontent.com/kiz5JspeW-c40xJA8fj9oMuL-KwQfP5tsbiDk5vcIvhuidbnLmpIsD-6lmfWTDoS-bL9cj22UbL6dbl0NCG4iEbbO6kFrg2ua9xl7Lz-SpJywsGIqU8rGuZJIWm78ESA9gz85IZc)

<p align="justify">
  Foram gerados valores através do deffacts, no sentido de testar as regras e obter os valores numéricos relacionados aos resultados. O código-fonte abaixo ilustra a utilização de valores para a Força e Precisão.
  </p>
  
(assert (forca pouca)(precisao baixa))
  
<p align="justify">
  A Figura 9 ilustra os resultados obtidos para os valores acima.
  </p>

![Figura 9. Valor resultante de Força pouca e Precisão baixa.](https://lh3.googleusercontent.com/LfqhiEQgEIAmdhBpzSIDtB4UceiRmmHFtH5KWsfX4hizKspO9uKiXRdNbjOHA00pCG7zPP22mwYBHDFBbwZ0pSWMlERyzAUgTa1ZWWc4ynyBiLIY9pdPZOtx8k9fG5IxnfsvR5SQ)


(assert (forca media)(precisao baixa))


  A Figura 10 ilustra os resultados obtidos para os valores acima.

![Figura 10. Valor resultante de Força média e Precisão baixa.](https://lh5.googleusercontent.com/bnlKh8pe1G8yEhjpBOs9kGO90kH_FS-JaQSRckTHHUzowHiJMfk1kvPCrfpvKIAfL68w2e6G4TF-RomiLZ0bUtI999TkbSymfdNsO-XfcAOQd2OohEnbjT8XGfUVNpHU84-i25lE)


(assert (forca pouca)(precisao media))

  A Figura 11 ilustra os resultados obtidos para os valores acima.

![Figura 11. Valor resultante de Força pouca e Precisão média](https://lh6.googleusercontent.com/apz6yxuCk8Gxqa32XMTX8CXt11uJ1rlvpYUkAqKe55W5q2Z7TjlU5vYhxNfb36IzcOgvgUr2UmfcDDENcLqQdNOGylA55-EB-SFsy2pl-npEHr6i4Xh2sPpwUV3qaiXYKjmZCA02)


(assert (forca muita)(precisao baixa))

  A Figura 12 ilustra os resultados obtidos para os valores acima.

![Figura 12. Valor resultante de Força muita e Precisão baixa](https://lh4.googleusercontent.com/hQLVPZG3PpbwnozBqKsLqClRZgQCR0lx_LI1H1-DBzwLtLUxMpstouOWoNcSygPHBetJIs0HqCazKLgn45FjwOGmIuL8vaPgpqagJjVV8AWotbqrHBkD8gsDdNhUeNIAjy_NWS6Q)


(assert (forca media)(precisao media))

  A Figura 13 ilustra os resultados obtidos para os valores acima.

![Figura 13. Valor resultante de Força média e Precisão média](https://lh6.googleusercontent.com/VNSNuOw6SWc-eVNEG7AG6SoFIxZ6oPFEMD6Y6Oz9fvEhh5XgRtRk3-iE9p6fmo_4n0ZBhfRuCggwG2BDtSgZbRrJP2FrSSiZsoTkhE-ZVBhLea2E_bsuUhG63CP0aYGJpuQetIMV)


(assert (forca pouca)(precisao alta))

  A Figura 14 ilustra os resultados obtidos para os valores acima.

![Figura 14. Valor resultante de Força pouca e Precisão média](https://lh4.googleusercontent.com/0ykdelFn53-gDbLltY71_0TVpBQClSnbvFGndAqDv6xRS7eIAUWt5QW3pMrceCk3w5h2lzNeNS1_bE7ordQ2WhG3z72V7vyN1m4BNTfqXUzMdKnEKCKryYMe4VxYmMuLM2iVmREy)

(assert (forca muita)(precisao media))

  A Figura 15 ilustra os resultados obtidos para os valores acima.

![Figura 15. Valor resultante de Força pouca e Precisão média](https://lh5.googleusercontent.com/LFP1yRB35ZfUKFOOD7t25EvtvKG9OZaiqhP3FnpVsnKBeERaReZpwsPU2_kJ_ASUBE_hrCdi90sfHUSUWPr2bV6H283pLlVhhm1zG9TG7a6ilX90X2HTL2FhslJMcnktbypq5_nE)

(assert (forca media)(precisao alta))

  A Figura 16 ilustra os resultados obtidos para os valores acima.

![Figura 16. Valor resultante de Força pouca e Precisão média](https://lh4.googleusercontent.com/7xDE6OLwIMQl2OPU89C6tbqZLMstKSvm6PJ7DezUYPm07IjxhVZ_fHdnxYY84Bn7PdQR1jsz7JYr4Ru0yLGuTIQ2BkyH3n0C43pGN-SbGbsmPH6nT9cTEvoPzWcYN_tn9R4hl5Og)
 
(assert (forca muita)(precisao alta))
  A Figura 17 ilustra os resultados obtidos para os valores acima.

![Figura 17. Valor resultante de Força pouca e Precisão média](https://lh5.googleusercontent.com/nmEAzgRQDLI4RUe09Ls2vpQ8xsPlVaS3lFB-dy3hkv5A4zILSJ1suQ93eM2x9zInsdAXMROrgfUSodUZ2GihEKScpC4qZu-uBknehVZJQjecp827CYL-wdpAlflPWiIJceKUIRwe)

4. Conclusão
<p align="justify">
  Melo comenta que a lógica difusa objetiva fazer com que as decisões tomadas pela máquina se aproximem cada vez mais das decisões humanas. E isto é importante ao se trabalhar com informações vagas e incertas, que podem ser traduzidas por expressões do tipo: a maioria, mais ou menos, talvez, etc.
 </p>
 <p align="justify">
  Durante este trabalho, conseguimos observar a importância da lógica Fuzzy, pois, “essa lógica permite que variáveis não admitam valores necessariamente precisos, como 0 ou 1, possibilitando que elas tenham graus de pertinência entre os elementos, em relação ao seu conjunto” (Rignel, 2011).
 </p>
 <p align="justify">
  Concluímos então, que a probabilidade de uma pessoa acertar o gol decai, caso seu nível de precisão e força de chute ficam mais perto de baixa e pouca, respectivamente. A mesma relação existe para o oposto, quando a precisão e força de chute estão mais próximos de alta, a probabilidade de acerto ao gol é maior.
 </p>
