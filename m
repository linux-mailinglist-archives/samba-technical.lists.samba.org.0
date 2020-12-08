Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB952D2161
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 04:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pXwPcBgQbed3WdvRmWEZM7sisiI5t7BMo62xIkt24Rk=; b=gzVAUfO1PKAtC4BrgOmT5uQa1n
	VvoK+tsSqTwoCqJ7NE7oi1VI9zE2gYeCwUiytqDxJ292fGO9rFHXN/9908ZTNWwtxC9MZvN8YjJBR
	eMmffuU8XfkwOFscCE+/dTuct8KMBWMLibkKhP2Uf1/+TrpI1uWHfF+afSGY1HG6vvdFBXB8LSBJy
	12bADejigkWEh6qIh0xe7ck4aoSBNf11At41z00tQU1d6RNlgaPQ3pZ4NDAp9mJ3vxr2Edm+PfzC8
	ySTbdT63NQRnE2EeosOIYHZiannAlGMUfwiSDLW+ccSAZYBklytWbhW825TnuSulZh4tKO+MxxjEI
	ZgcdTtcg==;
Received: from ip6-localhost ([::1]:18896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmTWr-0009Tl-7e; Tue, 08 Dec 2020 03:19:05 +0000
Received: from mailout3.samsung.com ([203.254.224.33]:57881) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kmTWj-0009Te-78
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 03:19:02 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201208031844epoutp035d5e9a827434435cea781eb17df3b45c~On4hNSsgC1541715417epoutp03K
 for <samba-technical@lists.samba.org>; Tue,  8 Dec 2020 03:18:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201208031844epoutp035d5e9a827434435cea781eb17df3b45c~On4hNSsgC1541715417epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607397524;
 bh=pXwPcBgQbed3WdvRmWEZM7sisiI5t7BMo62xIkt24Rk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=IuMOnTf2hKbnoHkd0xfqZXfalfqlVjVCPhfP2ZtC4G3RrSXPNYGn4byVb36c6RPQ3
 VBT+7gLmocwsDli4Ncni2Hn3sqgHExP7Pv78gtuuLxViaWvgUfSXqPINbodI/rnsfV
 jcKoIPGj2lH6wYk3lMBKsLDRsHuRmtAejOLBhjUg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201208031844epcas1p4ea5152c61190b677cbd0b24047a67a5a~On4g8nw270802208022epcas1p4N;
 Tue,  8 Dec 2020 03:18:44 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.160]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Cqlkq4XHTzMqYkh; Tue,  8 Dec
 2020 03:18:43 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.66.10463.390FECF5; Tue,  8 Dec 2020 12:18:43 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201208031843epcas1p2dd608ff4ae8bfc5f9749662817168007~On4fzJUh_0651906519epcas1p2S;
 Tue,  8 Dec 2020 03:18:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201208031843epsmtrp21cc1def31c52ee3b1c0207883489996e~On4fylto30809908099epsmtrp2g;
 Tue,  8 Dec 2020 03:18:43 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-0f-5fcef0939c88
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 50.04.13470.390FECF5; Tue,  8 Dec 2020 12:18:43 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201208031843epsmtip19b5228f7bd618ca1ce852f6b06a49649~On4fpKE5W2671426714epsmtip17;
 Tue,  8 Dec 2020 03:18:43 +0000 (GMT)
To: "'Richard Sharpe'" <realrichardsharpe@gmail.com>
In-Reply-To: <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
Subject: RE: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Date: Tue, 8 Dec 2020 12:18:43 +0900
Message-ID: <008201d6cd10$d5187910$7f496b30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHu2cU0iZpo/P4bT7dFAuRD2Fuj0QLjvbKYAo2A0KYCs24UH6l7RSDA
Content-Language: ko
X-CMS-MailID: 20201208031843epcas1p2dd608ff4ae8bfc5f9749662817168007
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201208011550epcas1p26cebc8a4d2812fca862990739a059d43
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
 <008101d6cd05$0faa5500$2efeff00$@samsung.com>
 <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
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
Cc: 'Joseph' <j@gget.it>, 'samba-technical' <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> -----Original Message-----
> From: Richard Sharpe <realrichardsharpe=40gmail.com>
> Sent: Tuesday, December 8, 2020 11:21 AM
> To: Namjae Jeon <namjae.jeon=40samsung.com>
> Cc: Joseph <j=40gget.it>; samba-technical <samba-technical=40lists.samba.=
org>
> Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big=
 files?
>=20
> On Mon, Dec 7, 2020 at 6:12 PM Namjae Jeon via samba-technical <samba-tec=
hnical=40lists.samba.org> wrote:
> >
> > > Hello,
> > > When sending a big file (for example 2 GB) from a Windows computer
> > > to a Linux computer (with Samba server), then:
> > > * if the destination FS is ext4, NTFS, no problem
> > > * if the destination FS is exfat, then there is a strange delay (=7E3=
0
> > > seconds) during which the Windows Explorer waits, before actually
> > > copying the file It seems that the Samba server first =22preallocates=
=22 the 2GB, before accepting to
> start the copy from Samba client.
> > > Thus, 2GB (of probably null bytes?) are first written, and then, the =
actual file is written.
> > > How to avoid this effect that doubles the number of gigabytes written=
 and doubles the transfer
> time?
> > >
> > > I have already tried:
> > >
> > >     strict allocate =3D no
> > >
> > > without any success in the exfat case.
> > >
> > > Any idea?
> > Windows seems to send SMB_FILE_END_OF_FILE_INFORMATION smb2 setinfo
> > request to pre-allocate space as much as the file size before writing t=
he file.
>=20
> I believe that Windows does this because applications are actually writin=
g into the Windows equivalent
> of the page cache.
>=20
> To avoid problems where the server runs out of space when the cache flush=
es, they send a request to
> extend the file to the new EOF when a write to a larger offset occurs. Th=
at way, the ENOSPC error can
> be returned on the WRITE rather than on the CLOSE because no one checks t=
he error return from a close
> and anyway, how can you tell which write failed when you get an error on =
close?
I didn't want to remove ftruncate before writing in samba. I mean that ther=
e is
an improvement if exfat fallocate is implemented. One misunderstanding is t=
hat
the FileEndOfFileInformation request must change the size of the file.
Because of that, We may not use keep size flags of fallocate(). BTW, Why do
windows call FileEndOfFileInformation instead of FileAllocationInformation
of smb2 setinfo before writing?

Thanks=21
>=20
> > samba fallback to call ftruncate if fallocate is not support in local f=
ilesystem.
> > I personally think that it is possible to improve the problem if exFAT
> > support keep size flags of fallocate(). It doesn't support yet in
> > linux kernel exFAT, but I have a plan. exFAT can store the number of
> > allocated cluster size and the current file size in metadata of file.
> > Unlike FAT. so it seems that the fallocate can be implemented properly =
in exFAT.
> > >
> > > PS:
> > > * I've already tried exfat-fuse, but also exfat-nofuse, and also
> > > exfat (non
> > > fuse) included in Kernel 5.7, and it's the same.
> > > * There are many forums posts with the same problem, e.g.
> > > https://www.raspberrypi.org/forums/viewtopic.php?t=3D206866
>=20
> --
> Regards,
> Richard Sharpe
> (=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)=0D=0A=0D=0A

