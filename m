Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44B1B70FA
	for <lists+samba-technical@lfdr.de>; Fri, 24 Apr 2020 11:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VwLZpusvTCEYfnf971GPdXDom7vJXRVwfIXDhJk6Ej0=; b=T9kO4kcQrRQ5NX7s2qYFn/nWyP
	XL0xWDL2wSCchVTiTPQefOaNZlRrR7rdEDoEOzKwuM/YUv6cEPtOrshhFKQHharn6qWdZuiMRzuqq
	tlcisbqYxqqSA7rOWulG9qh6NykxZ6XzBt2TssqDsTwhbLn5kwvK5klCWxD5lit/tYiMWzUpaTsHS
	KDS5MFhHLuz7vcaA9n4NLDAilAO2bAXWTEqUbM3+7zmD3+5F3wsRuDxyK2aC19FOUMPdsnOL9MSyL
	bF3GopA9cjph32pEsWPjCRgSgmfoFSIJF2ENdGAapA2pv3H3LeanUQEtDciC3c5TJL9yps0932Ww/
	/fBMkduQ==;
Received: from localhost ([::1]:42916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jRuhu-001qo9-8u; Fri, 24 Apr 2020 09:33:14 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:46234) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRuhn-001qo1-9B
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 09:33:10 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1588325581.78874@RSBqctybThzhvQHo2HgUQA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 3387B11F95A.A73C6
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 3387B11F95A
 for <samba-technical@lists.samba.org>; Fri, 24 Apr 2020 11:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1587720781;
 bh=VwLZpusvTCEYfnf971GPdXDom7vJXRVwfIXDhJk6Ej0=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=an/j/6b2MAYiWT/cvBn5gPHiKmyCNwvF2dH9MRtSJsC7Ing740TCdXCT3/pz8CGhx
 W1Bf1YQoGuyG4L8X41hMqeJHX18aUd4DOMeIXH3ejiu/pP89WZm8OQI0dft+AA5UHN
 aWO7JV12nb4RsqG1wRQ2/UgYU9b20O37U7h0TbXTXPcyos9oFOinN5nOGn1A2xdWRG
 FDtjvm8vCjNGCFi/UlgfA5Or0VlRNrX9ehECjLm4HdFbQIJMtAjNn54BUL0cRsmnBr
 q/sKj0hCK7f2k3RWxmXToxGBbGwUELlM8mFrGU2QwNNgG614bqU7Ykz0IylPYMCTd5
 Ne/NTkde+QHcw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 533D03AF8C
 for <samba-technical@lists.samba.org>; Fri, 24 Apr 2020 11:33:01 +0200 (CEST)
Subject: RE: build - ldb depends on missing system library/libraries
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Fri, 24 Apr 2020 11:33:01 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b5f8c464-3dc2-db53-2f5e-1cd4850decde@samba.org>
References: <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdYaG1igrGw7uBkSSOimCUl1tSSpvA==
Message-Id: <vmime.5ea2b24d.c07.7d78521b66566a9d@ms249-lin-003.rotterdam.bazuin.nl>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20

That only shows building and prepairing for a build from source=20
and not a setup for creating packages for samba.

You can see that because there are no [t-l]db packages or teven or cmocka in that list for example.
Source uses the supplied version with samba.tar.gz. =20

Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: vrijdag 24 april 2020 11:28
> Aan: lejeczek; samba-technical@lists.samba.org
> Onderwerp: Re: build - ldb depends on missing system library/libraries
>=20
> On 24/04/2020 10:04, lejeczek via samba-technical wrote:
> >
> > On 23/04/2020 19:31, lejeczek via samba-technical wrote:
> >> hi guys..
> >>
> >> I'm trying to rpm build Samba on Centos8 but process fails
> >> as below.
>=20
> Have you run this:
>=20
> https://git.samba.org/=3Fp=3Dsamba.git;a=3Dblob_plain;f=3Dbootstrap/ge
> nerated-dists/centos8/bootstrap.sh;hb=3Dv4-12-test
>=20
> Rowland
>=20
>=20
>=20
>=20


