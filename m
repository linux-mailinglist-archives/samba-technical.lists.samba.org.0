Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC2F3085FE
	for <lists+samba-technical@lfdr.de>; Fri, 29 Jan 2021 07:47:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RXd25SRWfoY2nTbt+u1KDBqLf/DWCOJY1dsYxRcd2qo=; b=PljqhLLbR7Xq9X7MGIvr+Tvy8U
	z3+WC4zPMZVaoGKNrorBIWPD4ZbM8jVJf2XLYEMoKRNbxdveSy4ejp6W6LMMA63INJmuvsCAjZLRL
	l4FVMNHqA7kOCHisV+RDRfaVByp2fqtfP+cKrYGoATXU3VHjD+Lqe9cnn2iBnQS6/7rPjjwCaz3wS
	V8T6kpUGW8KCCNNJgQE0O41V0+dLcG3lpmIJeAR5mGxSNxleYKueQljRjjctyH/fquMUxEmDKdFq4
	jBTTM/LxLQlsY/85cOvTXE1Mo5fDp+cnJ/quQAwI7uLrUhH2zpv6nzVWDn+WPLwJoXPX2UWPsqRzm
	OJIiX98w==;
Received: from ip6-localhost ([::1]:43676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5NYT-007gnU-JH; Fri, 29 Jan 2021 06:46:53 +0000
Received: from mailout4.samsung.com ([203.254.224.34]:30018) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l5NY9-007gnL-Oj
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 06:46:41 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210129064624epoutp0440d286b25f5b9f1658cc7acc8fcc2005~eoQrGs28u0536905369epoutp04b
 for <samba-technical@lists.samba.org>; Fri, 29 Jan 2021 06:46:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210129064624epoutp0440d286b25f5b9f1658cc7acc8fcc2005~eoQrGs28u0536905369epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1611902784;
 bh=RXd25SRWfoY2nTbt+u1KDBqLf/DWCOJY1dsYxRcd2qo=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Z9psCGxOOX8SGYB8PgWUF/7sATRKeWblDBF/3S44o4Td7txn7BNYOtr9ByYKaynji
 eUphrB7zxDVDZzpXFLdkRgOIFn86Qa1ji4THH8E9oJLys1NIULdKttZxCcmZISF8mP
 zMPdlSlkj2KMsGGqgDyu5oU1aIR0ASZaK/bDlfn8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210129064623epcas1p381ded6577598a37b9b6eef076ac82ceb~eoQqoIyKm1789917899epcas1p3N;
 Fri, 29 Jan 2021 06:46:23 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.166]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4DRntQ5C3mz4x9Q0; Fri, 29 Jan
 2021 06:46:22 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 65.CF.10463.D3FA3106; Fri, 29 Jan 2021 15:46:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210129064621epcas1p4cdd0c443d35f6769eb27896c4023c68b~eoQoYgIQg0860108601epcas1p4F;
 Fri, 29 Jan 2021 06:46:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210129064621epsmtrp296c4537205e526252337eb05c4fef409~eoQoX2yZ11898818988epsmtrp2g;
 Fri, 29 Jan 2021 06:46:21 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-d6-6013af3d630e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7F.BE.13470.D3FA3106; Fri, 29 Jan 2021 15:46:21 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210129064621epsmtip26e7ef18149891bea2f4ccd3e0fd8ec41~eoQoJpBvc2371123711epsmtip2T;
 Fri, 29 Jan 2021 06:46:21 +0000 (GMT)
To: "'Steve French'" <smfrench@gmail.com>
In-Reply-To: <CAH2r5mtUEYDyFGesXGsK_rP2007EP3X58i9-NFUY=ZMZR-hU1g@mail.gmail.com>
Subject: RE: [smfrench/smb3-kernel] Cifsd fixes (#21)
Date: Fri, 29 Jan 2021 15:46:21 +0900
Message-ID: <065901d6f60a$74250f60$5c6f2e20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKO2sTUpITPh+sHKLzlg7jsYYbg1AIhnnAyAet98GaorfYJMA==
Content-Language: ko
X-CMS-MailID: 20210129064621epcas1p4cdd0c443d35f6769eb27896c4023c68b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210129062124epcas1p206df70947094d8b785d03038414a8fbf
References: <smfrench/smb3-kernel/pull/21@github.com>
 <CGME20210129062124epcas1p206df70947094d8b785d03038414a8fbf@epcas1p2.samsung.com>
 <CAH2r5mtUEYDyFGesXGsK_rP2007EP3X58i9-NFUY=ZMZR-hU1g@mail.gmail.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: 'CIFS' <linux-cifs@vger.kernel.org>,
 'samba-technical' <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

> Merged into smb3-kernel github tree, and rebased on 5.11-rc5 pending more=
 testing (will try to kick off more testing this weekend).
Okay=21 Let me know if there is any issue.

Thanks=21
---------- Forwarded message ---------
From: Namjae Jeon <mailto:notifications=40github.com>
Date: Wed, Jan 27, 2021 at 11:25 PM
Subject: =5Bsmfrench/smb3-kernel=5D Cifsd fixes (=2321)
To: smfrench/smb3-kernel <mailto:smb3-kernel=40noreply.github.com>
Cc: Subscribed <mailto:subscribed=40noreply.github.com>

Description for this pull request:
=E2=80=A2=20Avoid=20calling=20ksmbd_override_fsids=20recursively.=0D=0A=E2=
=80=A2=20Make=20xattr=20format=20of=20ksmbd=20compatible=20with=20samba's=
=20one.=0D=0A=E2=80=A2=20Use=20netdevice_notifier=20to=20configure=20TCP=20=
listeners.=0D=0A=E2=80=A2=20Fix=20a=20build=20break=20with=20linux-5.11=20k=
ernel.=0D=0A________________________________________=0D=0AYou=20can=20view,=
=20comment=20on,=20or=20merge=20this=20pull=20request=20online=20at:=0D=0A=
=20=20https://protect2.fireeye.com/v1/url?k=3D18f3920f-4768ab42-18f21940-0c=
c47aa8f5ba-ab8c74262ebe1a56&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&=
u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21=0D=0AComm=
it=20Summary=0D=0A=E2=80=A2=20cifsd:=20set=20supplementary=20groups=20when=
=20overriding=20credentials=0D=0A=E2=80=A2=20cifsd:=20avoid=20calling=20ksm=
bd_override_fsids=20recursively=0D=0A=E2=80=A2=20cifsd:=20Change=20alloc_if=
ace()=20return=20type=20in=20transport_tcp.c=0D=0A=E2=80=A2=20cifsd:=20Use=
=20netdevice_notifier=20to=20configure=20TCP=20listeners=0D=0A=E2=80=A2=20c=
ifsd:=20fix=20a=20memleak=20from=20netdevice_notifier=0D=0A=E2=80=A2=20cifs=
d:=20make=20xattr=20format=20of=20ksmbd=20compatible=20with=20samba's=20one=
=0D=0A=E2=80=A2=20cifsd:=20macros=20with=20complex=20values=20should=20be=
=20enclosed=20in=20parentheses=0D=0A=E2=80=A2=20cifsd:=20fix=20build=20brea=
k=20with=20linux-5.11=20kernel=0D=0AFile=20Changes=0D=0A=E2=80=A2=20M=20htt=
ps://protect2.fireeye.com/v1/url?k=3Dbf9741e7-e00c78aa-bf96caa8-0cc47aa8f5b=
a-9454fbda87bb8569&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps=
%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-13a=
1445bc5afcf91b3135cfc53c83b546ff6741cd17902937b4030162990820e=20(2)=20=0D=
=0A=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url?k=3D0c02a494-53999dd=
9-0c032fdb-0cc47aa8f5ba-d9e8ed4b3ee97c82&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-=
89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2=
F21%2Ffiles%23diff-381fb3a09da3451eeea4ae3029730c1c92bbed381327f311fd1e153a=
d96590aa=20(34)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url=
?k=3D43e265ba-1c795cf7-43e3eef5-0cc47aa8f5ba-4b5da940e32670cf&q=3D1&e=3D881=
cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2=
Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-9ee6f94aa7c97acc87330571f4974c284e3=
638682d8662419067ac7049bca740=20(2)=20=0D=0A=E2=80=A2=20M=20https://protect=
2.fireeye.com/v1/url?k=3D21bbebe9-7e20d2a4-21ba60a6-0cc47aa8f5ba-c4f159256e=
410848&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgit=
hub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-731c968a66f944d=
f8c362587d30f683400c61aa40b827b15837afcf329c27c32=20(8)=20=0D=0A=E2=80=A2=
=20M=20https://protect2.fireeye.com/v1/url?k=3Da3393309-fca20a44-a338b846-0=
cc47aa8f5ba-4608bd15a0e40d60&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a=
&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%=
23diff-44f4e94b5520200e7003e947b70571dec5d1f91b0fefe60cc24b84a56d192a5a=20(=
4)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url?k=3D015efcd7=
-5ec5c59a-015f7798-0cc47aa8f5ba-bd28bc3df7ba5881&q=3D1&e=3D881cbf7d-2565-4c=
41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%=
2Fpull%2F21%2Ffiles%23diff-d7a6189bb902920845f1b16b60b23dc6e5b79619426ce81f=
ec051cd575b2321b=20(2)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.com=
/v1/url?k=3D2b95d7fa-740eeeb7-2b945cb5-0cc47aa8f5ba-6b35b3097a525ba6&q=3D1&=
e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmf=
rench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-45cdbce20e00968980ab5b673840=
997b7db3ef1ceb01959136146eed28efd756=20(2)=20=0D=0A=E2=80=A2=20M=20https://=
protect2.fireeye.com/v1/url?k=3Da0fd3c65-ff660528-a0fcb72a-0cc47aa8f5ba-134=
6696391247558&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2=
F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-28da00cf=
886c7c49441c784bace3139cdacc95987b46216d81c512f676fcf54d=20(5)=20=0D=0A=E2=
=80=A2=20A=20https://protect2.fireeye.com/v1/url?k=3D5bc42f98-045f16d5-5bc5=
a4d7-0cc47aa8f5ba-c7331ba7875dd512&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0=
f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2F=
files%23diff-fef259d09b45f87954b831ea54e078f4518f5c4417515873344c0de23921de=
ea=20(337)=20=0D=0A=E2=80=A2=20A=20https://protect2.fireeye.com/v1/url?k=3D=
430dbace-1c968383-430c3181-0cc47aa8f5ba-a123a0a6aa5af5d8&q=3D1&e=3D881cbf7d=
-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3=
-kernel%2Fpull%2F21%2Ffiles%23diff-a96203b39f53284684579596723fe5b0035eb91c=
f9856de440a84d55bdea5f17=20(21)=20=0D=0A=E2=80=A2=20M=20https://protect2.fi=
reeye.com/v1/url?k=3D61d519f6-3e4e20bb-61d492b9-0cc47aa8f5ba-394558376d6247=
1b&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.=
com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-f7433629c8584faf417=
2019089efd7cde0f325939807b2b0a6120b2258f74715=20(294)=20=0D=0A=E2=80=A2=20M=
=20https://protect2.fireeye.com/v1/url?k=3D99cf53ee-c6546aa3-99ced8a1-0cc47=
aa8f5ba-e8999629106265e8&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=
=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23=
diff-441aeb0c7e6999addc85a93c33c950ea637323e8d3eb79f19919033308dbb05b=20(36=
)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url?k=3Db55ddc83-=
eac6e5ce-b55c57cc-0cc47aa8f5ba-a9d96673636133a5&q=3D1&e=3D881cbf7d-2565-4c4=
1-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2=
Fpull%2F21%2Ffiles%23diff-3d348fb0b8bd1408076e13cf84a5160305faa8af1d6a69d74=
0fd36036b5b914c=20(545)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.co=
m/v1/url?k=3D0f56e0bf-50cdd9f2-0f576bf0-0cc47aa8f5ba-53320ca4f3bc6123&q=3D1=
&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsm=
french%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-a1e66e03b569d8088f2c4266607=
a2b6c2589ab8813741e3c36210d6e4cd6bcb4=20(35)=20=0D=0A=E2=80=A2=20M=20https:=
//protect2.fireeye.com/v1/url?k=3Dc15889e8-9ec3b0a5-c15902a7-0cc47aa8f5ba-8=
5f00cc25e680ffd&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A=
%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-70b141=
042a80072dba68db2b1456a183505658908438038fffdc0266c64413cf=20(4)=20=0D=0A=
=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url?k=3D0bd71e7a-544c2737-0=
bd69535-0cc47aa8f5ba-a4841969ab90e53f&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b=
1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21=
%2Ffiles%23diff-db0aa3a6adeabfd54633c447b9beaf27fbb46f6b1ecd8c72aef4fb72581=
a04b1=20(126)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url?k=
=3D7e8ab03d-21118970-7e8b3b72-0cc47aa8f5ba-277d3188b8f549ae&q=3D1&e=3D881cb=
f7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fs=
mb3-kernel%2Fpull%2F21%2Ffiles%23diff-2bd5af44e29b547dd9fda5b3d24352adacbb8=
b8080e33241d6641a4f3df69ef0=20(2)=20=0D=0A=E2=80=A2=20M=20https://protect2.=
fireeye.com/v1/url?k=3Dc3701dd7-9ceb249a-c3719698-0cc47aa8f5ba-8a94e0c7b2dc=
bb14&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithu=
b.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%23diff-249654a638ec41b36=
4ee6977b6a0d3ad3f06e5a711f7f53d1d8e743acc276b8b=20(462)=20=0D=0A=E2=80=A2=
=20M=20https://protect2.fireeye.com/v1/url?k=3D56ce1c31-0955257c-56cf977e-0=
cc47aa8f5ba-985a80c4a4f48bf3&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a=
&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21%2Ffiles%=
23diff-ba6b2ac156d80a0d1650305ffe6147b0ab677fa20a5083df7bae9fc299822d35=20(=
100)=20=0D=0A=E2=80=A2=20M=20https://protect2.fireeye.com/v1/url?k=3Ddb5fb8=
9c-84c481d1-db5e33d3-0cc47aa8f5ba-1071fc074a7ad555&q=3D1&e=3D881cbf7d-2565-=
4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kerne=
l%2Fpull%2F21%2Ffiles%23diff-004686895854dcd4630e0991bb4eea14bf87d8056b6351=
516840ed6435112956=20(2)=20=0D=0APatch=20Links:=0D=0A=E2=80=A2=20https://pr=
otect2.fireeye.com/v1/url?k=3D4093e9b4-1f08d0f9-409262fb-0cc47aa8f5ba-d96b6=
f47d700bc08&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%=
2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21.patch=0D=0A=E2=80=A2=20ht=
tps://protect2.fireeye.com/v1/url?k=3Deb50f6a2-b4cbcfef-eb517ded-0cc47aa8f5=
ba-c7bf722bf139c09c&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttp=
s%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21.diff=0D=0A=E2=80=
=94=0D=0AYou=20are=20receiving=20this=20because=20you=20are=20subscribed=20=
to=20this=20thread.=0D=0AReply=20to=20this=20email=20directly,=20https://pr=
otect2.fireeye.com/v1/url?k=3D64cd01ff-3b5638b2-64cc8ab0-0cc47aa8f5ba-53ea2=
4818e736d7c&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%=
2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Fpull%2F21,=20or=20https://protect2.=
fireeye.com/v1/url?k=3D1f9e06a2-40053fef-1f9f8ded-0cc47aa8f5ba-2adf7ca05ae5=
6371&q=3D1&e=3D881cbf7d-2565-4c41-bb9f-89b1f0f8bc1a&u=3Dhttps%3A%2F%2Fgithu=
b.com%2Fnotifications%2Funsubscribe-auth%2FADSTN5QP7UMTO6WHMMIMZ5TS4DYMNANC=
NFSM4WWNZCFQ.=0D=0A=0D=0A=0D=0A=0D=0A--=20=0D=0AThanks,=0D=0A=0D=0ASteve=0D=
=0A=0D=0A

