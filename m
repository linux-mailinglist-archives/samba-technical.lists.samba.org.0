Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4791C9DE6
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 23:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8kI53KFOJogZx2yMAfFHBvqgVsOSB2A5I54d9aq/HhU=; b=Zv21tuIMIPr+cjP5NIKHnLcH24
	jUytvKPBUlsRfgT0a9SA7sIg5k2XiCW0/MW/01+uQiREDxqQ3EvWJsVQ1ja7rJHc7Ab8yhepEv76L
	0af3sdhEgR7dFVLMnrVHhagVRuSBhprctNyUqkSJJRq4pbamixU5tfL/9fqTPZC4D3cemXiA+3cun
	Q5+HExSTlvXTOAydngxmYwwsS1TrYi+01aiwSMZgM8bCbEvDIBE26JJSj5GG7n98wXVkJq/AE5YHe
	Z7VWyu82DKRgBz/HTiKVtPvkOLEVnOSA6v4py4KWsf14NP4er1fUj+2Xr40OPVB10x1d4TT/KTeDr
	MdLnmdWQ==;
Received: from localhost ([::1]:48478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWoOX-003BUx-4e; Thu, 07 May 2020 21:49:29 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44292) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWoOQ-003BUq-LZ
 for samba-technical@lists.samba.org; Thu, 07 May 2020 21:49:25 +0000
Received: by mail-io1-xd33.google.com with SMTP id z2so6008857iol.11
 for <samba-technical@lists.samba.org>; Thu, 07 May 2020 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8kI53KFOJogZx2yMAfFHBvqgVsOSB2A5I54d9aq/HhU=;
 b=WVA5WjA7EfIZyZC0ne9ax8CkHfiY3+Ltx+Qn/FAHs/vYsBVuyEsleE/kSQR5wVsIvu
 njXmHcVko5fb8G+5+RMD9jNa80zHhzILCdvrb69mj2oMVI5Ga7+oQ//UsgI/JQOsJ7g7
 of9sZfMAvVefExA5zGk8RDogpZ8uQgRu6MLosZ/ahSt2irAIjYPtNBwT705uAhdcxSXW
 Nz5QSRQ9CN3HoBDv6FkLY0NWYTV2F38LuDo1s5j8WtdeuGGDNCRHDFO2pjpczB/F1STH
 jDPVFjLFgFdl8Bva19Q6+wPC1H4fwDcdGJ/qRfIg2hnCXeF7hyjVxIXP89cb48oX6UGa
 OO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8kI53KFOJogZx2yMAfFHBvqgVsOSB2A5I54d9aq/HhU=;
 b=lIki1hb5lJWdxLH52IWsK81+e92tcosWb7UzhDtajTH3m8UkEOWxBrVLnGksFJYqbX
 wFGNmTObpz1fpdQ/4EhciASeNzHuJAKJiAZdIx7U93FUtUYfeVBGEieoAlzaFRc1O0fc
 +CmSWoY59hbdb97fBQ4NkQNMmMHHiowAE6ETkcv404o2d8eqcihQMOh4qDZQWshs9Vqm
 st6oJC+Vr9Y7Ja4/4DePRLSwQyvBbia5gT+BUPpUH1Ck4N7SNS9iCOUK/ja0sha0YhZk
 RBnBL69zxdGU2e16PKncqG/4kmmgeB+XYWf7sCeb7Adx14NRaoGmVy3cchQHBRiNEcHf
 Kdlw==
X-Gm-Message-State: AGi0PubNDXxqmSikQrG1rFh7DrTm/wZBHVHG0d9Stvfq1SY5wbE1uj1u
 dta1DxIyT2aJSLPxcu2X928/88gZ3jFdcQT75us=
X-Google-Smtp-Source: APiQypKQzfoxszVHhxaf4EIzRqTvA75tqtdfAqNDczarWibmJTFWfsUgfmeqjrPOhW+OoHcMxzx3e0fDZOmzcleR5PE=
X-Received: by 2002:a6b:9088:: with SMTP id
 s130mr15942371iod.122.1588888159823; 
 Thu, 07 May 2020 14:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer> <20200501180218.GD29166@jeremy-acer>
 <BN7PR07MB44024B8600FDF859C55E405FCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501190057.GF29166@jeremy-acer>
 <BN7PR07MB4402F1447DB39F38F1953B30CFA50@BN7PR07MB4402.namprd07.prod.outlook.com>
In-Reply-To: <BN7PR07MB4402F1447DB39F38F1953B30CFA50@BN7PR07MB4402.namprd07.prod.outlook.com>
Date: Fri, 8 May 2020 07:49:07 +1000
Message-ID: <CAN05THRX3Zg04x2AHhxAFD6zBf1AbFvVSVjLnxHRXfudoCU-PA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 8, 2020 at 7:34 AM Ashok Ramakrishnan via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Thanks Jeremy, Roland and Ralph for your responses. Just wanted to loop b=
ack and update you all on the progress we made. It turned out to be that th=
e path length of the next file the client was going to open was > 256 chara=
cters, and the client (windows 10 -> file explorer -> right click on folder=
 -> properties) silently drops a path component when this happens... It was=
n't obvious to me since the client did not truncate the file at the end, in=
stead decided to drop a component from the path. In my attempt to model the=
 client behavior, I recreated the directory structure (by extracting the pa=
th and filenames from the pcap) and was able to reproduce it myself.
>

Wait. What?
You are saying that if the full path exceeds 256 characters then the
client tries to recover from this by just discarding random path
components until it is <256 bytes  and tries that instead?

>
>
> -----Original Message-----
> From: Jeremy Allison [mailto:jra@samba.org]
> Sent: Friday, May 1, 2020 3:01 PM
> To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
> Cc: samba-technical@lists.samba.org
> Subject: Re: [EXTERNAL] Re: Windows 10 client opens a folder as a file an=
d asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
>
> On Fri, May 01, 2020 at 06:30:48PM +0000, Ashok Ramakrishnan wrote:
> > Thanks Jeremy for the tip. Our customer is able to reproduce this readi=
ly. So, I can try potential patches. One interesting observation I have sin=
ce you pointed out the Reparse Point bit... The previous getinfo command wa=
s file network open info. And we (samba) responding with this for the folde=
r...
> >
> > SMB2_FILE_NETWORK_OPEN_INFO
> >     Created: Nov  6, 2015 20:22:26.658586900 Eastern Standard Time
> >     Last Access: Nov  6, 2015 20:22:26.659295100 Eastern Standard Time
> >     Last Write: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
> >     Change: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
> >     Allocation Size: 0
> >     End Of File: 0
> >     File Attributes: 0x00000010
> >         .... .... .... .... .... .... .... ...0 =3D Read Only: NOT read=
 only
> >         .... .... .... .... .... .... .... ..0. =3D Hidden: NOT hidden
> >         .... .... .... .... .... .... .... .0.. =3D System: NOT a syste=
m file/dir
> >         .... .... .... .... .... .... .... 0... =3D Volume ID: NOT a vo=
lume ID
> >         .... .... .... .... .... .... ...1 .... =3D Directory: DIRECTOR=
Y
> >         .... .... .... .... .... .... ..0. .... =3D Archive: Has NOT be=
en modified since last archive
> >         .... .... .... .... .... .... .0.. .... =3D Device: NOT a devic=
e
> >         .... .... .... .... .... .... 0... .... =3D Normal: Has some at=
tribute set
> >         .... .... .... .... .... ...0 .... .... =3D Temporary: NOT a te=
mporary file
> >         .... .... .... .... .... ..0. .... .... =3D Sparse: NOT a spars=
e file
> >         .... .... .... .... .... .0.. .... .... =3D Reparse Point: Does=
 NOT have an associated reparse point
> >         .... .... .... .... .... 0... .... .... =3D Compressed: Uncompr=
essed
> >         .... .... .... .... ...0 .... .... .... =3D Offline: Online
> >         .... .... .... .... ..0. .... .... .... =3D Content Indexed: NO=
T content indexed
> >         .... .... .... .... .0.. .... .... .... =3D Encrypted: This is =
NOT an encrypted file
> >     Reserved: 00000000
> >
> > We specifically said that it IS a Directory and NOT a reparse point. Bu=
t the client still decided to send us a 0x00200020 in the subsequent open o=
f the file. I can play with the response and see if I can get the client to=
 behave differently...
>
> Yeah, I just checked with test code against Windows10 and the server just=
 ignores a request to open a reparse point if the object is just a regular =
file/directory.
>
> So this may be a red herring. Would be interesting to see a trace of this=
 application at the same point against a Windows server.
> This e-mail message and all attachments transmitted with it may contain p=
rivileged and/or confidential information intended solely for the use of th=
e addressee(s). If the reader of this message is not the intended recipient=
, you are hereby notified that any reading, dissemination, distribution, co=
pying, forwarding or other use of this message or its attachments is strict=
ly prohibited. If you have received this message in error, please notify th=
e sender immediately and delete this message, all attachments and all copie=
s and backups thereof.
>

