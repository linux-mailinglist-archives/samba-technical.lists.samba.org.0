Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A12C51FD
	for <lists+samba-technical@lfdr.de>; Thu, 26 Nov 2020 11:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=u8CZXHkZNkHbskg3yDCRxA2rfVvaaEi72Hl8qaFBMcw=; b=iNS1NXQn9nWCZ6Jce4P/5oz+Lw
	djWirVhxbQKZ8dyzC4kaxjpa7rzv4C69B1cJ+qHrdPCCQQnrD6YlQbn+xYAzRZYYlQX4rFvkSYnqv
	NsGgdrwllC1q3v4Y3vnECoDkdvA5XpcWfw2+/FhtqTxQtyHQGf9+591+CxeXl6Q1ElyujpAKDsmnp
	k7T62FF4kz6+0tC+sThwHzS7cVNmw159PsavhJtg2Exb0uvCS8PQUb92TpApacRjvx6OCKnvWxwEk
	eZeFnDblgoVY9yAR9jUNcldo7VVaIyhWoa+r6uov+s+m5+i8cdd5uOtJBJrGCSx8wavrUdPDWTOKv
	Bv5XWLHA==;
Received: from ip6-localhost ([::1]:57352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiEWJ-002kWW-Dh; Thu, 26 Nov 2020 10:28:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiEWB-002kWP-CX
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 10:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=u8CZXHkZNkHbskg3yDCRxA2rfVvaaEi72Hl8qaFBMcw=; b=TUQ3F+SQXbvfdOHU1wuNSpMlhV
 lTw528BaCzW6crRDN+mIiiIhEEEG8jRzQxhNIGEOFL/GlxiWlBDISzxP+pN0cxBAQoaVr5X5zNU3u
 wm9IVS7egxZlAPhXG077qkffUsBm+zYXLUoa9DLyrYhiSvyMTabuH0USsRvEEY/3/SFdKNYE444Od
 hxNFVM85zjXccIhIh36ys+Kq6wEOKROHp5hntT9aFi3j42b3FjC0Ukjq0JxLBn6DRkLCBCFnm9bx/
 SnDpaNFIGOGS8jtMk0upCHDkFCmSSykaBy8ricKPnS4AjVP062pIU7gqnCIjzveurJlG1tdgQHKmy
 mIS/Qg0BDHYOhwRlKy02rGuqV5laszE1bGN40Xhd3BRTvxZKW8ElikA8yfxKRyxPp2IikL9zSfmcn
 HiFSH1mxZE+Ryq2dezvnLN10NJ4SKg1vH4QsV/MhCSY4eHowxlRHwe/xcDnU4yotQKIl2Us5cvOJr
 BlMXXNvtCbampbG1bpRLPzUD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiEWA-0008IH-14; Thu, 26 Nov 2020 10:28:50 +0000
To: Leo Fan <xfan@vmware.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
Subject: Re: about "ea support" parameter
Message-ID: <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
Date: Thu, 26 Nov 2020 11:28:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fNwmcEiMmBFk8UtIfwIkibBP9MsTYpEie"
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
Cc: Albert Guo <aguo@vmware.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fNwmcEiMmBFk8UtIfwIkibBP9MsTYpEie
Content-Type: multipart/mixed; boundary="MEhXnw8p1MaYzBS5husYoyPZZkYV7vsFp";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Leo Fan <xfan@vmware.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Albert Guo <aguo@vmware.com>
Message-ID: <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
Subject: Re: about "ea support" parameter
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
In-Reply-To: <01389598-12D7-4F10-9490-99441D905D34@vmware.com>

--MEhXnw8p1MaYzBS5husYoyPZZkYV7vsFp
Content-Type: multipart/mixed;
 boundary="------------BE2C7567460240159EEB0C29"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------BE2C7567460240159EEB0C29
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 11/26/20 um 10:57 AM schrieb Leo Fan via samba-technical:
> Hi samba experts,
>=20
> I need your help to understand the smb.conf parameter =E2=80=98ea suppo=
rt=E2=80=99.=20
> We are developing a customized samba service to serve Windows 10
> clients and MAC OS clients. And, we would like to set =E2=80=98EA suppo=
rt =3D
> no=E2=80=99 to gain more performance of =E2=80=98dir=E2=80=99 command e=
specially on the large
> directory, but as smb.conf doc says, EA support disablement will
> impact Windows file service compatibility.
>=20
> The default has changed to yes in Samba release 4.9.0 and above to
> allow better Windows fileserver compatibility in a default install.

To give you some background: that change untangled the previous mixture
of configuring both SMB level behaviour *and* backend storage behaviour.
Nowadays this parameter only configures the SMB level behaviour, ie if
we support EAs in the protocol. There are various ways a client get
list, get and set EAs over SMB, by setting "ea support =3D no" all of
those will fail with an error, probably NT_STATUS_NOT_SUPPORTED.

However, if when setting "ea support =3D no" Samba will still use xattrs
in the backend as storage for various bits and pieces like DOS
attributes, creation date, ACLs and so on.

> I am not quite clear about compatibility problem with EA support
> disablement, and have some questions:
>=20
>=20
> 1.  In which scenarios will there be windows file service
> compatibility?

As explained above, you disable something which a Windows server
supports. Hell may brake loose or you may never notice a difference in
client behaviour, you never know.

> 2.  How do we create and use EA?

There are various SMB info level to get and set them, cf MS-FSA/MS-FSCC.

> 3.  Does any well-known Windows/MAC application use EA?

I'm not aware of any. Both make heave use of streams, but not EAs. The
macOS client maps local xattrs to SMB streams and you typically enable
on of the streams modules on the server to support streams. With
streams_xattrs the streams then again end up being stored in xattrs on
the server.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------BE2C7567460240159EEB0C29
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

--------------BE2C7567460240159EEB0C29--

--MEhXnw8p1MaYzBS5husYoyPZZkYV7vsFp--

--fNwmcEiMmBFk8UtIfwIkibBP9MsTYpEie
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+/g2AFAwAAAAAACgkQqh6bcSY5nkY1
FQ//dj3AI2X+aEFyQjKWqv+fVDq4Nt3wAcf9tToTXS9uo17/9z8gtxmXa0aQasrSCZBb9dfRl1Sh
9BLg29iPoBu1cQM+6l0kf7TvTX11HlT/bK8aoBx23Qr9ACytWtbVc9Txk47ZRK4O5wk2xtTEKFun
M7vqg5/V0cK3Ts+77vX6NUoHHYM9eddeu1liJ4e+lyDGhWLLQn4RphJ47VDHKSSvcT/t5wuRLAiI
bs/9/z6gudRLjc4XNVy6xOUMGBwNKrsmIR65CuGjDp7d3DULLTVAn2iDFZfACRWJsdOCvB+8LJOq
g/tri7p3d5oKOXcTFm9ibGbJNq9i6hxRqviLt7Wc+ttnwHmXqJKNxb5RjGv4o8Nbwbh/g5AzacD0
/F6CnO3FjVPnTpKYiPBSYTZlcolhqyieZVQ8bmvfc9fb4ELKk/DM06lWHouodvZh3o2TVrdv/u1t
qz9q0JwtRSXycsqcYPQqSGOcEZzrbbszIfGIQyuarhV7eTQAxjS9C/ztLcS0ANb2wa2DBwUiWaXU
rlnUvbg39Gj+0wQ2EP1LtQqOgQuAyz4UiYEKJyYC31hzrUOpVQqFi4fZDtQ6qTDEzHNUf4YUUZkV
vv7T73pdPFyKQ4gjhgfQ0CkiUpT0B6MNx5YhJ55cdyl8n291ZC+mLj24n7e0PXHitZsFYz630Wo9
uSA=
=NeWX
-----END PGP SIGNATURE-----

--fNwmcEiMmBFk8UtIfwIkibBP9MsTYpEie--

