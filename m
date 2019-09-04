Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C363A8562
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 16:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=yDACrYP9dJYTh82JU6AqDwO0FvT1xnJqjU0KMaj3F1Y=; b=cJ3Rg6bIkbfN2a+suc8gBs9jBs
	RYrhyRfrUm5/qCnwO0ab4/jTk+LYv1AiALdh/VaZ9YS0eGMi6HUIPKl9F3XKNggt0KURUWrnlRdar
	ri8oSRIzfEAGRmahDfEe7kgJCLO3QqdWf1B72onSLVX0nKf/VQT4y7a03zcXjmF6WGi4x2AaSNIdv
	L8i+R+vZKegq1bnUz+Arzsrkm/vbOFSpN01Rbsj2WIAv/QY7dyl7D3TsIgq9yiN7qvjudGXFHBibG
	gh+fi8if3njoUjl3DKsg9fdBuWNA9gED3Xb2OKxjRqW/mqSJy12KvwbA3YyHaT/VVYZg1Ug8/iKuy
	LDo3kB+A==;
Received: from localhost ([::1]:32696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5W1j-003R8U-UO; Wed, 04 Sep 2019 14:12:52 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:57020) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5W1g-003R8L-9u; Wed, 04 Sep 2019 14:12:50 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1568211162.87975@Ta/gPTj30aQL9Ttgxxoztw
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: DB6C01207E7.A8294
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id DB6C01207E7;
 Wed,  4 Sep 2019 16:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1567606361;
 bh=UDVMBo4qvBkMWfalSPmCk+5zVsg3DApueKY5eSAMT7k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=gje/1aOQAwmkslgOCmwXgS2MK72WzUh2DIbXALCgTyJ02+NvNz5yg9uGPUBuVlzhx
 c5SJ3rAaVi+TQELbuRnGCh7Z8rvP/0O6iDJxRUPt01Ws/S5T8TJyvfOvIuI6WdyCJC
 HFxlbUQsewyh1Ml+uo09Dczl+tBeBQpj6seg/m4SOUdfZHMtaeIANUEfGZH4EZ87ja
 t/z6I6I2l5OeYv5kDamsNej5VAl5miNlOi/N2RXIYjafRx5f/5nO5FmRcQMqLuGUzC
 80aKa+M+cvKDGjIikHPhlwDDAf3txrjmBkWWC0re0WurHgb2UKTRpVRiO41BVmiCB3
 O2wiOaHIBbQsA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 1FBD03AF8C;
 Wed,  4 Sep 2019 16:12:38 +0200 (CEST)
Subject: RE: [Samba] Samba4 computers not on W10 Network
To: =?windows-1252?Q?samba=40lists.samba.org?= <samba@lists.samba.org>
Date: Wed, 4 Sep 2019 16:12:38 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <db8842ea-9227-dee8-d589-f1192d0f2565@samba.org>
References: <CAHcZi78RL0i5gi8p=sYYkD3vD0d69M7AjgTBmtk36UK4KSY2Cg@mail.gmail.com>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdVjKs4rUopYb++lQoyJRAWGn6MlPw==
Message-Id: <vmime.5d6fc656.4937.59bde85a42e16cb6@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Cc: "=?windows-1252?Q?samba-technical=40lists.samba.org?="
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20

There is some work done here, see:=20
https://bugzilla.samba.org/show_bug.cgi=3Fid=3D11473=20

Maybe an extra ping on it.=20
Would be nice to have it in 4.11. since its directly related to/with SMB1.


Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Rowland penny via samba
> Verzonden: woensdag 4 september 2019 15:48
> Aan: samba@lists.samba.org
> Onderwerp: Re: [Samba] Samba4 computers not on W10 Network
>=20
> On 04/09/2019 14:36, Robert Wooden via samba wrote:
> > My Samba4 computers (DC's & member server) are not shown=20
> within W10 File
> > Explorer Network. Only the other workstations appear.
> >
> > I believe this is due to smb1 being depreciated.
> >
> > All the folder redirection still works, gpo, etc. Domain=20
> users can log in.
> >
> > What do I need to adjust so these machines appear in smb2=3F
> >
> > (I know this has been talked about before sorry.)
> >
> Try this: https://github.com/christgau/wsdd
>=20
> Rowland
>=20
>=20
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


