Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 403352C567D
	for <lists+samba-technical@lfdr.de>; Thu, 26 Nov 2020 14:56:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=z7hOERyTr9WSoZwpSqXGDa0ibCJ8UzsW9VAW2i4dY54=; b=aGwGoxghZOdluwP7URDw/qZs6X
	DfHLtXGwOHlDregabzIBaQTEh87cE+udpGQiDLHg4IC920K+/+J4YMHrwTzo3JQhIe4s6gyM1Si5C
	0tspiHTW7CQTPI4Qcvv2BW/eu/c8QFVHLY/cxCwnjvwHIGZncGpIJblc1FqZ1JoaoAuBsg3rkSLvO
	DQvs4oPNiDFUWsoIviwoQ6fcWJKAcAzFRAHVoz4WKYkz8GYv3C7MngNXDc1BSoW+jHAEnQhxpe7VC
	W8u9J6KMB98Op8/bFa9sayuOEp1Wh7YS5JdDmp1Gf6IZFDS9KLVx/JdJ5rhaaGjLpqdtEPClFqt9p
	p22zbYag==;
Received: from ip6-localhost ([::1]:38278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiHl3-002p1Q-2a; Thu, 26 Nov 2020 13:56:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54568) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiHky-002p1J-8h
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 13:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=z7hOERyTr9WSoZwpSqXGDa0ibCJ8UzsW9VAW2i4dY54=; b=iR017VTy07j8XYxCKEXxk4pQqM
 Ih2+GWM3PIXXZJ4hMurdMuW85ID574Ay8VWlYPFKVkJpzfziAx37aRQLh86H6G8VCHAf6C7dOwB5j
 yHdalCc+VJeidqCM6b0MlvQ66OxxPB5sauJyww7mR7ZaG+Enam9Q+QRC0i6bMESRbqQuqGgjQEL9H
 jg378wTZsOAdiJqhNpW8tyInk48JyoWODr4nc0F3rA2Sn4DijyRj/QgNWrB0lj34nBpNuJ3mXIDbg
 ikDZluatuku5nJvPKvjoZN4uMnvhy/dyJrepXfuNQ2D5iCbU/JE8VqcgBEhfkgiPxOXYUT+F1hqBG
 9O7VMZpuuZnsh7bzl0OP2iheQOKgDFqyNPKXgfAB+SYspz95J86x716qzUybT6HnE49JdLRSrBiU/
 0nISQyNvZQ5yp5d66YJCgfdqCaQjaM/9sixPsi3v7H7dnNPHB0lgIkeg13hsw0goeuyg1mK0fJhLk
 K3Kobq5z5Coc+1awGYIY2BOC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiHkx-0001oR-AE; Thu, 26 Nov 2020 13:56:19 +0000
Subject: Re: about "ea support" parameter
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
 <1429DB9B-9F4B-421F-AC67-6DA2C4B72945@vmware.com>
 <760bd41b-f907-6f60-2264-5b5ea9536a5f@samba.org>
Message-ID: <6c6ab928-70ec-e70a-3f1d-b7b03e37db61@samba.org>
Date: Thu, 26 Nov 2020 14:56:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <760bd41b-f907-6f60-2264-5b5ea9536a5f@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AfYK2DVZiZGGT8tDpjJ6PLXsSCSKJfwHD"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AfYK2DVZiZGGT8tDpjJ6PLXsSCSKJfwHD
Content-Type: multipart/mixed; boundary="x9514eOE4McXNNBvUclkSPp9PBUHnNQm2";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Message-ID: <6c6ab928-70ec-e70a-3f1d-b7b03e37db61@samba.org>
Subject: Re: about "ea support" parameter
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
 <1429DB9B-9F4B-421F-AC67-6DA2C4B72945@vmware.com>
 <760bd41b-f907-6f60-2264-5b5ea9536a5f@samba.org>
In-Reply-To: <760bd41b-f907-6f60-2264-5b5ea9536a5f@samba.org>

--x9514eOE4McXNNBvUclkSPp9PBUHnNQm2
Content-Type: multipart/mixed;
 boundary="------------7559A0FB38CB88D2499B4FC5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7559A0FB38CB88D2499B4FC5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 11/26/20 um 2:38 PM schrieb Rowland penny via samba-technical:
> On 26/11/2020 12:31, Leo Fan via samba-technical wrote:
>> Hi Ralph,
>>
>> Thanks for your quick response!
>>
>> Glad to know both Windows and MAC apps make heave use of streams but=20
>> not EAs, I am more confident that we can disable EA support.
>> Both Data streams and EAs are used to store extra (meta)data of=20
>> files/directories.
>> I am curious which kind of applications would use EA.
>>
> I am not confident you can disable EA support. Why do you think the=20
> default was set to 'yes' ? Could it have anything to do with an EA is=20
> where the Windows ACLs are stored by Samba ?

yes. But see my initial mail.

>=20
> If you set the permissions from Windows, the ACES etc are stored in an =

> EA, ergo, if you are using Windows, you really need EAs.

no. See my initial mail. :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------7559A0FB38CB88D2499B4FC5
Content-Type: application/pgp-keys;
 name="OpenPGP_0xAA1E9B7126399E46.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xAA1E9B7126399E46.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFRbb/sBEADGFqSo7Ya3S00RsDWC7O4esYxuo+J5PapFMKvFNiYvpNEAoHnoJkzT6bCGe=
ZWl
ARe4Ihmry9XV67v/DUa3qXYihV62jmiTgCyEu1HFGhWGzkk99Vahq/2kVgN4vwz8zep1uvTAx=
4sg
ouL2Ri4HqeOdGveTQKQY4oOnWpEhXZ2qeCAc3fTHEB1FmRrZJp7A7y0C8/NEXnxTvfCZc7jsb=
anZ
AAUpQCGve+ilqn3px5Xo+1HZPnmfOrDODGo0qS/eJFnZ3aEy9y906I60fW27W+y++xX/8a1w7=
6mi
1nRGYQX7e8oAWshijPiM0X8hQNs91EW1TvUjvI7SiELEui0/OX/3cvR8kEEAmGlths99W+jig=
K15
KbeWOO3OJdyCfY/Rimse4rJfVe41BdEF3J0z6YzaFQoJORXm0M8yO5OxpAZFYuhywfx8eCf4C=
gzi
r7jFOKaDaRaFwlVRIOJwXlvidDuiKBfCcMzVafxn5wTyt/qygcmvaHH/2qerqhfMI09kus0Nf=
udY
nbSjtpNcskecwJNEpo8BG9HVgwF9H/hiI9oh2BGBng7fbcz9sx2tGtQJpxKoBN91zuH0fWj7H=
YBX
6FLnnD+m4ve2Avrg/H0Mk6pnvuTj5FxW5oqz9Dk11HDrco3/+4hFVaCJezv8THsyU7MLc8V2W=
mZG
YiaRanbEb2CoSQARAQABzR1SYWxwaCBCw7ZobWUgPHNsb3dAc2FtYmEub3JnPsLBlwQTAQgAQ=
QIb
AwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAIZARYhBPrixgiKJCUgUcVZ5Koem3EmOZ5GBQJee=
j64
BQkN4TW9AAoJEKoem3EmOZ5GAQUQAL+4vG/awKNawHm2DCIzDBWbbjSoC+0/0ipEyRDC07Hky=
kDk
UPGsPjCVhYyPEYWrhHZTwJtbB4zIJDI+k0bpoisc8WXmhsiLupW2DE8wb/OBdY3IeB+bO23AC=
mJ1
2LEegamOw4t0nfNjAKaKWYBOh1+3sN3cAOxukpR3wZIhc46AduX2ZYct+cPeXw8hA/ungww2u=
OcQ
HxdVtAbuhpyFpg7sTmTvzaLUJWboS5rK0uhPyWJDl50eVwjmtSLhon5XgBM2sekFbYJ4OXoa8=
lS9
6nJogFT1OEqcyamDVVUptyjDvKS8oNK+jngp0peAFPjOblJ3kKOcJjiKccSkSkvjB316dt9vQ=
/jl
mTSHo6Vl7Cx5CKSBHQlCTwWolvjaBNBN745hyc+Li9lIrmj7TS8aTgwqXQROo8uU+R+jSvfUg=
4Yg
VCp/je6B/gdbnsD0AdaA9AiE0n0ftFt+0B6ghKjaEHKGs1lfcMyQop0I9g0p0Rk9yC+Y4X/lC=
7gB
ZdTPra9pZN2EpHJ7dRsuW3Q5butboumEEtuJRlirTnyN22jIecM1XkSxrnqJyHSm+6CbCj9HJ=
d6m
ZjvaZ3q5TbGLRA5i7UPAVvfSgkDJbc0K8qyvm0JkHsdz/rEe7A+QKCke1XAkAH53q1kS8w3Gv=
a6v
OP5vBBcqD656VRRs+gIgYPCJKpiGwkoEEBECAAoFAlb85y8DBQF4AAoJEMlPSTgYT5A0upMAn=
0CE
R5pPjRKX5j47cvZnW7tLcwmfAKCLzHVzMHdqf9aqgqKCbN0s3EgA5sLBXAQQAQoABgUCVnijH=
QAK
CRD+AB1EyAIYZdqVEADB7sdIVjs59GKbvrmzk96ZE+SfsaW1CxrDd0E+3NAUJzHimedpOlLoR=
W4x
Oeu3KujbXD1B8oXXpsD4cKiRGyl1NwNotzd86G8/838lORI1qQLm0NTXuAZAXytWkJ2AmDEyj=
3mQ
j6VponoTUBDJPqN2xbZ3Qjz0cTzyG+BjDdSxokPT648bO/BxkY5dFglKWuB7qOvb2jNwNLQNp=
2MT
iDVH96UPNWRd2rodoV7NIgbzQ7jsCbxbz8Cf7mkgPqy2zTvdOvgs2hU4yKY/Re4eMAa/zR/2L=
891
D8qU6f0TEPqNg9nE/oLcByUeydEU4AUmHkyj2cotykDTtEKlqc2JwV/GO1T/M2/ZMgjoio2pN=
CEB
NEAVEE/3qm86nUd48CVeTf5lPLMOtoaYoSbDnDgSl9zUwE8wYK6mvF0h45hCVht+5CR99CQvn=
8eW
24vLMek6EIuJANzUSi+jxtgxDCtMpKnCQZiRLexOAvQFuDAQ33TY1SWe9NmqJ0obVF8v/pnsJ=
WPB
WMbcaNdQD2hPgBGDW36jTAPGqXKjJQGj7kNjTTKJNolkbIH5V3iP0uu08WdBquO/3SEAd1iay=
CXe
DSJPZ2Tq4LFBxFjM22gcnbFjeXz9nq9mJZ2FsAgyUo38gBePxFGXpjWes0mIj8RcvH+BqQxFl=
6X7
fBYWoULp/rmHcKNCU8LBfQQTAQoAJwUCVFtv+wIbAwUJB4YfgAULCQgHAwUVCgkICwUWAgMBA=
AIe
AQIXgAAKCRCqHptxJjmeRstED/0R/7IzS+Yzw6ig0OQge6nkgGdbjXBNCPoRT7hJ8kFkSRhO1=
BE2
ek060TSsgK5dTdAHW54ghN0GdHR3KOJpJrbC5pN7dpTVzb3UMnQl3I0xXKwLn83teJbcmXi7z=
eFY
mL/ev35eBSig3lCdSvPdMVusj93dAzx1LWgL5N0AISkLDmQULA3BEDkzQTHZJ+dNWnH9GKXy6=
bDA
JSGfv6mKab9dypnfl8gayTlekSpmLPlfgS9vJRfiNOyK1zc7go/gFPq98IJTxuxzwXkND6buv=
vSK
WVFottRqIG01Qq+V0p4B7DbC4ceSwo9AqU9p/uKroGT6W6yDDYO6eq8s3LVbobrLRRewChU50=
q3u
hce4OYbxi0N1SbgX/WKwl2qOcOZcbZ7tPffAEtgh929ujGXQnqXpdsmdHy6uHR3BY+JfKpTqQ=
ryu
/rUF9mpWotqTaVJYt56SzHnF06DPoyThE7+OsriS9pFrxMqYMUsmEHYzeSak0OAo+WfRXyA+k=
sRv
ei3KvHvSjvowYhCb6DUaZOTewCSEu7az+jrIbIweB8u6nPfBJLhCR1gJUNneUN9b67LJ9+w7L=
7Zg
x3y5kqDyi0vi5T/jG9i8WI41zqsr1MdMHgRcU3rkSrIdIJKfaUOPqfTovwjefS42XoMMKb+bi=
+p/
tTPmq04KHjEaIBuZixLErRCUjcLBgAQTAQoAKgIbAwUJB4YfgAULCQgHAwUVCgkICwUWAgMBA=
AIe
AQIXgAUCWna6IQIZAQAKCRCqHptxJjmeRgyiD/97lbt5Zg0/C22LnZGSrd1wVfYBu9uUeV7Wh=
VPl
FKpfpqI20w1rrYr/0R3bKwX7UW6vyI2/eXnEsjAIc7Xb+OTjWfMkGG4IPGBv6mRFBgsToMCdm=
iCi
ZWPsdfPG49Iu7MmRhlfP39D6Tr4mw0s7apuq364D+2srVsV0kS6h8vMjL7KiWamJkOv1lUA8v=
Tk3
7bDkCtWL8l7VfwdrnusT2KtaKQb5KpiJ4Hfdtp5yofExRwA4Nd4kElFyuExnab9++bb9FtRVw=
oA2
Y/JSrGX/i6nyWKiS1roT7wfzkeYI2eASaU6KeLZ52cSFbAAIdSBZJt0Oh8hxgaYyh9GELw5wM=
Hxn
7ZPyhWfFysNWwxZNv2sojYRngG+Hyac6mz3fZ/P5yzyS/g178xsYn4PMV68gt+eYx4bXuKGwe=
Dkh
hP8a9B1cjT7TLPtGCPhdz1b/qs4aGD9YWLgs6RuvCff52GT/RTeR2Wujy3J0wbbXyxZAlquCW=
AGo
A9byI6xvsHApJiux5DCDUz5Ar9lgnZyFCWIWxrlPEUCVof6LfaENPTmuZFrE5SfNjE6tpdRZ9=
vA6
HVEfG/PqrwwDUEj/Jfr4LJ+lKK1qeVtZn/ZwOOTzhvjbb2mU6hs7aNrYwi6iS/5vgnnVkYsCy=
c8r
9amvXo+KETTLsDliSgLLkZnBHR7F+fT9/ereS8LBgAQTAQoAKgIbAwULCQgHAwUVCgkICwUWA=
gMB
AAIeAQIXgAIZAQUCWna8JQUJCd2zFAAKCRCqHptxJjmeRvB1EACBU4PJZqECeuYOBYvQMr7GO=
cms
0RfdEjHMWRCIyr6NKLOQSnfdnbw/XnAb7KxJa9Tkky+Gse81+bj6B8EgVQ9RZjMlQ6N8mi9D5=
/TJ
ITi5f8k88i3J+tUhpTZ3ihaD5/UVZqx5MFzWRSYQVn4D1RCay2q/VOeFn4VQLKSsg0AP3vqBv=
xfQ
GZo7S3U3HQjPGQj64Ox4rdOdMmMeoTnSx8DwSUve/mCIPHYXYPcb0IsqSIU+DABVvgNb6VoJ/=
KBQ
X3QKah5YOT1L6C06xaWqlYAKdhSAPiZF5oqV4Rzk9RRfo7A/nI3Xo0Z3hPlzLoP77aYwX/e2H=
U96
jyUFdWKeKO5ZeqgiX7dIAtC6LjDAgdASyfCmase/13xHMAx3O+IKPewkcoXFCRJ5TgtdL4lkm=
iql
NHJaDKKbzplMvqvjYPUcNnkvfE1+plti38AHWTV/+KWeFY7KytFCBAOv5qH7MSo6otbfKzGUV=
SgV
14FMAt9aPJCnQPmVETvCC7Lu4332sK+g1lpAe1t/C/dhMj3mpCQsEWZx3di2ri/pxSFzZSvip=
m0t
o/Mf31no33WmZN72SVsalwtY2QQzv7sTx8dMQdATHbndiCcLf2hpovU1NPS2VZp0j2WL23Wqv=
+5h
6g1U6ISIQBuxzFSpo9dwyLeW+Ki0A7/FDnM9//uUDmpGuTJxhc0bUmFscGggQsO2aG1lIDxyY=
kBz
ZXJuZXQuZGU+wsGVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPrixgiKJ=
CUg
UcVZ5Koem3EmOZ5GBQJeej64BQkN4TW9AAoJEKoem3EmOZ5G6koP/izLZvliWa8R15XIHkO/a=
x3R
J67k7uQv3Rp1wYgEhXChwqVVlA9NTar/xZrG+E4fBgsfs26KrCLmFRaSOrOrFOsM7lNv+FGuP=
hAb
hSrFNww/7driKxekrSPsoyGBIW0cV8jdbj77CV0YTrqgz5+6z14OiEL7xeYcNNKB3AR58crUI=
ynr
ifundZIrPgwFM/d+i5jZg//EIOBo8HmU5i4y4xAERUJvBS68WCeZnqrasVXowcuwAHD2E1oLP=
Gcs
VaUWIZGeT4SaznXDla//bx2mXD3PcXhlVYvq1wNwHzoY+xykQGSXx+bKryAVDkW2hY+5O39qc=
h3+
Xwo5yGEfZLtonfJpdeVFBMFVQSlAldnt06Viq2JtGyEI/9bBs1wg/VvNCrd2ghrUsscs5Ye83=
yvR
glF9Aww5AgOuiW8yVSm4zmkETtoyrqoSscSxJXucRtUKRb0FrglFh+KGO5BgCBgwnQyAWZ/Xb=
u6I
ED+PfJXbNEJ0qmJC8Rglezm8sI4pJpi8oL/9BXNLSTlylZXkEm21d/p4aw61ci1mXsaStcLe4=
eF6
oslaaNJwI6WGj6n75Ij7WPJQegyWqwqCPTW4zvp6Ei4Ny3llprGgwSqsTa8QT8OEzE3g+Ts1u=
nJl
5++E81jhc/vQ+6IjYW5ZcKULy+H60QLDpFE87H6B+fYAfUh5LaIywsF+BBMBAgAoBQJXKGGBA=
hsD
BQkHhh+ABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCqHptxJjmeRqiMEACkmKzN0hOZr=
yMS
jFLmWWs+SS9ndVTvAf1rAt2N+nF+9y/YZBnC3alo0KDYrnsIT8/N7WHXzZuDMAq6E1+lxxmj/=
fti
foxRgjdsYmNjRbizcH7RGcCapbaiXAQ8Gd5Myjc6U0T2VK+azp/outVAToF2lDy961rODY07F=
929
LsR9BjTEVd5PnILD5K1tYVsAb3LTZodvEE5MNpymArfeO7pS3pcBJdgE+zgaR/x/GdF0u12A4=
66T
md4swgMAhTgyT+9fKnrP1UrPuPz6CVknM8vozMz+FUe2zC2IkkHcpqjg+SVgTqeETKgA9Vi/h=
ZHE
IA+mR/Dzf2pEAKbtvEeuQ7gv4mNdvkWod/aoPOas3UlhH+rzEnHkglTNMqEpAy3pr18ZkZgkk=
z7o
ZA0Nzwi/h8HURIbrxVrawl86TsseqEIKHAn5Yn5kQLcocaFTjDSacXaXsQEzqygBsnybGF2K7=
xVO
iDj7dVBoAflGa/iidnBDFTa2P+SwO/7+3b/rtCZ0ruJldyQpi0MN2ScLq2fgCsl1IvrK5urFW=
sF6
t6i7hq+NKXoYDtWkFUKtCxJCTWIgn9nMKKNt3vih3vSG3BPDY8incrRkVK/wQhC3RCSUezWDE=
t3E
J4jJgvVacEKFYVqHKyiznewBVQb3u+mPQvhJ9nvQ2SESrInwE+MUcJ6i/NP5DMLBfgQTAQIAK=
AIb
AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AFAlp2vCoFCQndsxQACgkQqh6bcSY5nkaqHhAAi=
HYi
uwsbP7tpUINGkj8ctdxJov5wyldVZt1oHDtlA4UBFy3DoH7tYLuNLTmLqGKnQyofeHZBX/Hcs=
VCc
sY9MDoO0wCL3Eh6LtfzROAznLoLhXuU3gxCLTaDsElYBIQwBEgKZ1VoiCHYB9s0z/vccQtHXk=
oMA
Y9zqZi9yIYFlehCdJpqBEx/ZjgE/1n94ID158EDLP3Oq3R7tL9J1EJXFwW8tEKY+BEQwEWtBO=
tOb
4xPVgTwAp8yhwWnnLFKl+/xiIFhyYTstl3g9sdX7Bw3o2+c5bSMfmf54TMSRtN+AmWDWjQzBR=
e6X
M9gRvZWf6RzWJFyBuceENw7Pv4AcpxybcNp47B66hpBOXBNUrR3Ega/B1k8GzKViUbB6GbdLC=
WV5
18MskAETrPMRjawv55dhLrMqqPzYEuGgWuYLMyzwUWxkDFUqAUfSwy+PBe9YjAF9+mGtsHCT7=
dcf
UPq6VXGb2ZVI9J47RbxL01ANK72SXQsiLWRI2JievokGiIKXX8I8ELgzncMdLEgKz6zhUEiTs=
qp0
EoF2M3RhfsbhUDnLXlPlzPtJSmAt1HPf+qN415f3fCoq8m4ZMyk42frMwDUHJmG49iHta/GWy=
1tG
FCyqR1AKR0JH2Kc91e9tJ+u4FnNw2GJmJtrVernKXvsoxdtrKkPLfL+hDrzPwknLRMqpVWHOw=
U0E
VFtv+wEQAMJKdSxBKEE9wA8lAf0MxA2cI7e1RnfabHfZL9YPnKSJWl4jGkRrZf9ClLx3lzw5S=
HkA
sHi5NSCtCpzNeFZTAYc8BXY9bSz9Lg1RewKz8x2vLYA02T+Z9Iy1AyvqPam2D8xvv0VkCpJ41=
tLz
Upx+xY/CEAuB4iZhTDcmjJiDUpaBE6W0b4sLfa+cMNOi1xTzJ6SDhspneV6RU4PGTR2hmXyYW=
8NM
CIcUr07ljVrN4lpIwWQ0T8E0ewj914PMaSJX0eFHCB7v97iXi4kjR0+0ukY0Qs+rt+3L3s6+P=
FRz
11F9AND0JQHOi+Deumum7FU1GS1KkoB1pnNtM8uPwhzIqgUtD4yp1ojuhqTZavl1MJeV1sHIH=
SLh
TB4TIWzfZY82QmgZarY/zMf1oqZzbATsIfPtHJHuET2bs14atTKo0oDxCkISGhcdm9onqSjZp=
pO7
V6PwoKzJHnFWy9GT3RjMqLL5ABAoyDkm4l73avv+6hE//FPzIcOuBct3ZwON415HlEtiLX8iu=
epe
4OJQ8Kz38TuJM3KHc/TCHjeNvLykkRQLkjfDbTQOjlx1DhUZp3td5AFzekRSYVzoWDAXtJVqQ=
llO
/GR4vkVwTU6fzasmorp5I4iRXjmnFMy8S43JfyCzTUDgG5F4XTqhuDjSjk/tui+WyiDo2pmgP=
4kM
lYzSR1hlABEBAAHCwXwEGAEIACYCGwwWIQT64sYIiiQlIFHFWeSqHptxJjmeRgUCXno+uQUJD=
eE1
vgAKCRCqHptxJjmeRq4zD/4kgm1bQMGA9clpYmV3DvuKhC1Bkq6nb5DnhGzvSDCRXY7O5LjLJ=
ah3
hYmN4VK7IjM47dNb5lnbQoAb5D25DHhln2Iv7pcWJgvw5oC4hfkU+TipR2Less8oIX+H+yf1e=
VZC
PYpVS0MrbUfuwLIwisEeYPQpbb2ryI3qiP0GBtPwdCqq2d8nQodS7lmbzJ6c9For3ED0EsMtR=
MLm
54BZvyAQZZlZ58iMr2sJHzjnjiL8Rd55TnMkvMbLZm9l+mDTU7aGmSlTtZZVp/hvFL5KRugSd=
iNZ
ZMhuRnMmcJA7UZkVJMaYAsqwQMcti7LHCdJhq2oIVUPsYi0Cwob59ZWWU3UNZhLMhOh43o3St=
pwI
uBoqEtPyqe8BiMI6l4Ztnll5gybFqjk1FtvHXsILh7CxzQUD5QJjW5bqJqidzmAOwu9IN6rFy=
+0+
KIym/YxDNLBvGO/2dBLTH6zV2HX+v6k/wXt2lHLw13NIM06MCkCPBmy3hLeAYOvOumKXN6SUq=
f7u
fPtfDUY2UCe3rns5DH7F4mriSYgUh4CEj9FMYtfoVXqYsfvSjG9bz/ZBOZas1UrU5qCmsBgcq=
fDz
QeQ9P77Rp1TQyw31xsmJcG+SjeCgyYgv4Y3rxzJB9Dmf0sAZqOwjo12lQ1hY2F50dpSW3TDlt=
UTc
KmoMIvZL9PHGkxlyQepy6Q=3D=3D
=3DDJz2
-----END PGP PUBLIC KEY BLOCK-----

--------------7559A0FB38CB88D2499B4FC5--

--x9514eOE4McXNNBvUclkSPp9PBUHnNQm2--

--AfYK2DVZiZGGT8tDpjJ6PLXsSCSKJfwHD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+/tAIFAwAAAAAACgkQqh6bcSY5nkYK
3RAAne8BT8uoVdLmllfEvX+S5e2J63jJbp0c3Z2mNLdjYf0BLTavu6M5nXLJF6xJ1urBqEPtKajF
/8Tea7UGdjqR6KWM9cq6HYYcxhdh9V1U/7/08Uh9BTnUdg3pVqgDCNa9vsfn4V5TBnbfMRaaPxv2
k/+yfu7j76oPEj7l8xsBS+dClmH1gRIUnaAovrQb3OX9+Eg+cS1VvlKM2aPT322+fndvY8JKz38Y
qKx7YVJMdtaeOZ+ODbLF4d1QtmS3hSxTqEmdUJqtKia11RlFVp4hcWF38l1ciH2+ycSuevHf93TQ
khUnaZngGqVnDRR+f+BP4KoywlhPRgNsPtZPTtHLD8HIAoMdZadVxR25mPWunXHFyt2jSWxY2/Th
VmbrtRaVDDgHSqw19ar3vVAbEaKrkUVOQxEKu1w7hNDKRo0W3hI/NHy0719AQ30FJLDbrvf+lgAT
+l7gXZ2T+fm9T8uJp4M+XHYCD09diwsPnn1zXezAy2lcvSnzDXog4vr07xjnEO5KO6DR4+is0Day
e6d1ZLVSinLqG9PYZ69ubqXGJ6QrYTcud7tWBRS9P7/qI1CSDt9TT+akeFxm0WJwJTy9vs8NR4S/
2nHAfUqvLq4iTWlT/Lx8jJ9lUVTobqinTJSJeatX7RWurWpgi6TG97OVkk5mPwjLyFGQZJbI8QgJ
inE=
=6yig
-----END PGP SIGNATURE-----

--AfYK2DVZiZGGT8tDpjJ6PLXsSCSKJfwHD--

