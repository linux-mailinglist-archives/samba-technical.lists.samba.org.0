Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A41775D5
	for <lists+samba-technical@lfdr.de>; Tue,  3 Mar 2020 13:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9/htpKz0LjoCZKoDIt8xAK/EkQTe9ymJmvvzc0ZPeZ8=; b=tv3K2mykwT3ZhN9flgzeCQajrm
	WAK5pfnfuOG7xbwcDCgASv6FDq8D7/JHSxSF1PG8QuEYVJA9f3KOqnkbZK/RM4QO2ECmr/yHE+qkK
	jP74k8rn6xEt6LROzh80ZqevxxWFoiCnBAGRjcb2mKFvDStJi+0M4gbIG4Y0GvRIrwsqM9CrPmSQe
	axy+okzSoIU+H9wSWWco2NjBFGDBHZeb7VMXKMmWep91CsNLUup/lPzMUaiBd531dJTte+oeZg2dO
	3k5szONC/IaIiKZ6eoeFS4pOkk5hbmAnvH1Rknk5SqcoZowF/kUu8PzN7IiiVdUORKtpSPtUn/+2w
	yy3/vOwg==;
Received: from localhost ([::1]:23790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j96c8-00ElCr-8w; Tue, 03 Mar 2020 12:25:32 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:41310) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j96c3-00ElCk-DH
 for samba-technical@lists.samba.org; Tue, 03 Mar 2020 12:25:29 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1583842147.8212@JGhGzOFm+zMYlRFytDPsow
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: E1F6111F09A.A75D9
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id E1F6111F09A;
 Tue,  3 Mar 2020 13:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1583237346;
 bh=DWm4FKKOtdZX0EUBdE+me7OYDeWraWMOfKbZBaNoRRg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=IeUj5al/4KvXUDNc/Ey3yp7Fs56FxOYu30wpiLQUKmuU2LoTilVQKS1MqFdvpNK+D
 fYIz8c+lKV6pk8nJfa/F3g4NaZSxdQgFHJ0UxjnNDnmerVGH6VJVzWxvpa3Xt8lNvq
 stC/nDXK/ijKkXkkvgUUktcgvxofrDjhq9ghN8yPIJmvqtPDXx37QP4E5vZ4wc4t63
 YO/ZPnXKGtyI3DcPJsrr5GneSsJDvTSvgNgCtbe7jBTRbOQfXTfeDdA2opDKY6YLEY
 RT69Ks4vZ99xg8Td5VqWHhWh+1OfJcYsVY9QZt/5IKP11u55ZH2e4Y1nEK+VkXWVLk
 0CQG1m8ICizfA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 362A83AF8C;
 Tue,  3 Mar 2020 13:09:02 +0100 (CET)
Subject: RE: Question with compiling 4.12rc2 and ceph.
To: =?windows-1252?Q?Andrew_Bartlett?= <abartlet@samba.org>
Date: Tue, 3 Mar 2020 13:09:02 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7ce9976d10ab6c13580bd3713f3c537fc842c091.camel@samba.org>
References: <FA363CC88056472198851E19496FC799@rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdXxVIapUEnjPp5eQI66b5Ljfz9zyw==
Message-Id: <vmime.5e5e48de.4e44.62d64a126298e3be@ms249-lin-003.rotterdam.bazuin.nl>
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

Hai Andrew,=20

Thank you, so simpel but so unclear to me ..=20
I had to much focus on setting the compiler flags.=20

Well, at least some .deb's are produced now, can i finaly go to fix that other parts found with lintian.

Thank you very much.=20

Greetz,=20

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Andrew Bartlett via samba-technical
> Verzonden: maandag 2 maart 2020 18:43
> Aan: belle@samba.org; samba-technical@lists.samba.org
> Onderwerp: Re: Question with compiling 4.12rc2 and ceph.
>=20
> On Wed, 2020-02-05 at 17:06 +0100, L. van Belle via samba-technical
> wrote:
> > hai,=20
> > =20
> > I have a question,=20
> > Im working on the 4.12.0rc2  packages for debian buster.
> > im having a few problems with these parts in=20
> source3/wscript mainly the ceph
> > part.=20
> >=20
> >=20
> > I was thinking base on :=20
> >   --with-libcephfs no longer supported, please use compiler
> >   flags instead, e.g. GCC LIBRARY_PATH and C_INCLUDE_PATH''')=20
> >=20
> > That this would be correct :=20
> >   --with-libcephfs=3D/usr/lib/$(DEB_HOST_MULTIARCH) \ =20
>=20
> I think you want --enable-cephfs.
>=20
> You are building for packages installed in the normal paths on your
> host OS, so you shouldn't need to set any other paths.


