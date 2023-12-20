# Digital-Communication

## HW1

-1~1까지 유니폼 분포 5개 생성 후 히스토그램과 가우시안분포 관찰

<img src= https://github.com/lkasjhdf/Digital-Communication/assets/90087083/4d562462-210e-4d32-a502-1096afb3135e  width="40%" height="40%"/>


## Proj1

### 1.  Unipolar/Bipolar Signaling의 성능커브 비교

<img src= https://github.com/Seo-Jangwon/Digital-Communication/assets/90087083/6cd437fa-b095-492f-848e-c6e11195fae0  width="30%" height="30%"/>
 
 Bipolar signaling 기법이 Unipolar signaling 기법에 비해 3dB SNR 이득을 얻음.

 </br>


<img src= https://github.com/Seo-Jangwon/Digital-Communication/assets/90087083/92db5d1d-2d3f-402a-908d-550cbc83a48a  width="30%" height="30%"/>

<img src= https://github.com/Seo-Jangwon/Digital-Communication/assets/90087083/7edf8169-b45e-419c-a645-2b193147ee29  width="30%" height="30%"/>

 * Eb/N0 간격 1dB
 * BER를 측정하기 위해서는 200개의 bit error가 발생할 때까지 비트들을 송수신
 * BER이 0.00001보다 작게 되면 Eb/N0를 증가시키지 않는 조건으로 Unipolar/Bipolar Signaling의 성능커브 생성


## Proj2

<img src= https://github.com/Seo-Jangwon/Digital-Communication/assets/90087083/a0299156-93d1-4819-82d8-c195271a9faa  width="60%" height="60%"/>

   좌측 상단부터 시계 방향으로 성능커브, 3Tap, 7Tap, 5Tap

* Eb/N0가 5 이상인 지점부터 Tap number가 증가할수록 Pb가 감소함을 알 수 있었음. Eb/N0가 5 이상인 지점부터 3Tap의 경우 Eb/N0가 증가하여도 Pb는 10^-2 아래로 떨어지지 않았고 5Tap, 7Tap의 경우 Tap number가 증가할수록 동일한 Eb/N0에서 더 낮은 Pb를 보여주었음.

* Equalized Symbol의 분포의 경우 SNR=9dB로 설정하고 실험을 하였음. 3Tap에서의 경우 심볼들이 상당히 넓게 분포하여 경계가 뚜렷하지 않음을 알 수 있음. 반면 Tap number가 증가할수록 symbo들이 중심에 모임을 알 수 있음.  5Tap과 7Tap의 경우 육안으로 큰 차이를 못 느끼며 3tap의 경우 확연히 구분이 가능함. 마찬가지로 EBR성능에서도 Eb/N0=9인 지점에서 5Tap, 7Tap의 경우 둘 다 유사하게 성능이 개선되었으나 3Tap의 경우 Pb가  확연히 높음을 알 수 있고 이를 통해 symbol들의 경계가 모호할수록 동일한 Eb/N0에서 더 높은 오류확률을 가진다는 것을 알 수 있음. 


