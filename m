Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 821CF7B064
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 19:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oTJynSQGjxY30MMkXRthTQ8EdX2I6XsjMYqKOT5Mm1I=; b=ur2gmOiXZxKH3w6CWBNr5voaud
	kv2SV1Pp26vDYTQVZkUyBrKD0o91YW6IUakp9/7Wqb7djHVxv5UbN5djg0ROKfir4az2PmcjZZ5zm
	iZzi9byLOjgewcIzDXB6P+kRJZTPW0EuofWwmRGGWqMm/2HPRC1cJGPP3AHx8+Qtma3hwEdD65yPn
	zO3YJBAA4W0RGAts0Vypm/XZlGNdqgO0YjzslkfUN4y5neaM53cmL8/W7+AsJRFLTnuWa1beaU64A
	vKAS2nqmeCXo1A/aD/bKRUevq3BuwUzLF6HN0V+nuyQCYsWfk9AAZdb6bYqK4+Ah/doZ83hQbXeFD
	cx3XMaHQ==;
Received: from localhost ([::1]:42068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsW9j-0013p7-T9; Tue, 30 Jul 2019 17:43:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46839) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsW9f-0013ox-6t
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 17:43:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z1so66679783wru.13
 for <samba-technical@lists.samba.org>; Tue, 30 Jul 2019 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oTJynSQGjxY30MMkXRthTQ8EdX2I6XsjMYqKOT5Mm1I=;
 b=Bi5VPT4EF81yuNJEe3TI/WAuByJkYCFGkftGDwMgrhUNb+kw3VnyMtPEIjlBDNYfA7
 ssjOHG407rTcBGU5CdZ7YTFMN4tTAii1hr01nb9jQO8cya01oJAyabsRxWQxfXh5ch8F
 HYplDvxgUhvYIbHur5fmZwzZdgEVMfcNeb4LdjY1fknP6dH3CxX1+RulbUJaIVUaAH6D
 5CMVjHXQUUh5Bi4fXWy//KIuCEu6mOUqCrcZ5GJvjUUBCM6hvkSueMOOC95rb1K/upuT
 6pHBqYvh3o1QOJL5ESeuRt0rCB29AcUSPF+TuX0cObzQTeyd6C0MDKlW0Qp5/iwAan4c
 DGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oTJynSQGjxY30MMkXRthTQ8EdX2I6XsjMYqKOT5Mm1I=;
 b=Ki+HqMN1PbfIzFSMtpZt/2PNB2p5kf+byGdv0S6hB4NR0MwfYW6Yaf6DIzSfDpWYIu
 3sip718SvDC76XXiVKTopv5oLfZYcqAyGkds032nNSgj9uMt6zktiTbTKZyX29a5Ku4L
 wNyWLS1mnXVRJAipgwbKRm3fNgKH/RrU5hqNGrnggPZpBukRdkqMePTj+1eZBsPDo7mL
 lh3r4EeaRI1h+oHlATf8tp4HO4fOsOFvqqaPDKeYplvwRvYfttMVirAXlN9f40O7QaPT
 /a8csS6KGANnZAP2dSSHszAZkDOeQue6bssKDkUluzc7ujZ1zWK4gaugAlFqhWiH2bS1
 LJgw==
X-Gm-Message-State: APjAAAXWL8JFZBAqw3T3yYtS0LPAbHaDPBvcvCf5fbsfyxwQH/c/BgxL
 lfBEmwWgT1AIs0nEhwlLfVBkl5XXfnsUypli0Si+Bg==
X-Google-Smtp-Source: APXvYqxp2HtbPHu7naTitC+EJBEWxMWmN78/jrApF5NJM9HdHn+nK3ol7KshEOKdUMrz/OdqY4ZuolZVRo3tIWejKgM=
X-Received: by 2002:a5d:5012:: with SMTP id e18mr8185194wrt.166.1564508598477; 
 Tue, 30 Jul 2019 10:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPxikKqDFpTF=z7u-xVwxpXSLEoo1wssnYRccYuUt3brfg@mail.gmail.com>
 <4f1ad8d7-3df3-c5d1-5b5f-f299b2235ed2@samba.org>
In-Reply-To: <4f1ad8d7-3df3-c5d1-5b5f-f299b2235ed2@samba.org>
Date: Tue, 30 Jul 2019 10:41:08 -0700
Message-ID: <CACyXjPy2hrx-K4G+uT2dMcooYzSdw=fTB44wRLuuxfEtrQcoKA@mail.gmail.com>
Subject: Re: Interesting issue with Macs accessing SMB shares ...
To: Ralph Boehme <slow@samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 30, 2019 at 10:40 AM Ralph Boehme <slow@samba.org> wrote:
>
> Hi Richard,
>
> On 7/30/19 7:14 PM, Richard Sharpe via samba-technical wrote:
> > UserA accesses/mounts an smb share on \\some-server\some-share and
> > when listing the files in a terminal with 'ls -a' they show up as
> > owned by UserA.
> >
> > If UserB also accesses/mounts the same smb share on
> > \\some-server\some-share and does an 'ls -a' they show up as owned
> > by UserB.
> >
> > 1. Is this normal?
> Not 100% sure. With AFP the macOS client has a notion of being in
> "domain mode" or not. In the latter mode all files are being shown as
> owner by the mounting user. Only in "domain mode" the client will
> actually show the real server side ownership.
>
> To be honest, I have no idea if similar rules apply to SMB. :)
>
> Is your client part of the same domain as the server? Or is the server
> running in standalone mode?


The server is in a domain. The Mac has not joined any domain and I was
unaware you could join a Mac to an AD Domain.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

