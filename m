Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F5A120A04
	for <lists+samba-technical@lfdr.de>; Mon, 16 Dec 2019 16:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NFDkySN8L7CvnPh9A90x/OMP5Cw3OTRSIMrbPaIJJrk=; b=4ZMFjVJPposo3UOwbCw0Res0j8
	nn5VO3krW256Fcav9t+dW0CgmEvQEPY6edY/OPBk+wGOLpINr6nxoJrISisekQjlm6YO2uMG85BPZ
	rfYFXv26tk4QnJeQle01txXjirknKOl5t4Jwc+PY6LcPGVeX6GWVJomHFyYA8CUtFy8i3M9p/ILHc
	Aybvc3+XFq2v1tqI375y1LnNfAKkbUdZVaaRsFbxBZqGC4Ui8SccMGz7sq9qNdoOfzSv1hQoJJYZx
	ux2l/xCtM1qrQ13k/YWcUwz6eGEAItSFL6xV6zPycyjtH8leiGDjjEVYwAiJ3rHCr8alUWLXxjv5S
	HjoKMoGA==;
Received: from localhost ([::1]:25184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igsZi-007QSQ-NZ; Mon, 16 Dec 2019 15:46:22 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:46722) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsZe-007QSJ-9k
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 15:46:20 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1577115980.42108@y/+w3tv3QeUayTWHx5bzvQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 12BE911F07D.A72D7
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 12BE911F07D
 for <samba-technical@lists.samba.org>; Mon, 16 Dec 2019 16:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1576511177;
 bh=u9QLAboCnEVh/8pXBrx1fHXzWjy1cv248DYLWbQoBdQ=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Db/uQPmJ0lbHvLQcexGMVZ8bOI/th1vy+ceKRCYGtIbS5F04LCMRmafDixouQn+0v
 9QEtEEnYO7iRlUMVhAMuYHW17XP2HIP2ewUS9YhGAvENNjUEHVPMjKeVUTRlmoPfpN
 fNLfdMA5bkrp11aKeN9Hs+X3uEPTSwzrBGoJlpefqG05bcvLOEwB37nyTfRzSeoIcp
 Z+vRg4YcL0yhaComT76g/v5iDHwYrPKfMQ7JxiYAzplskDUgZB8bz1Nd5xiSwUlYrO
 O3risvfGNWadt0r5B5EwYURU5wtJGtotq218Y1ZkJzuXFdxwnSprqKfTg/L7CI8+So
 1DXzs/2KG3Hzg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 5362C3AF8C
 for <samba-technical@lists.samba.org>; Mon, 16 Dec 2019 16:46:09 +0100 (CET)
Subject: RE: Spelling/typos. /Fix multiple typos found by lintian on debian
 patch included.
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Mon, 16 Dec 2019 16:46:09 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <066f97b6-3e24-81f2-f91a-82e537436e44@samba.org>
References: <7ED1B3EB46AE40D3845A260EA8E4FBD2@rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdW0J+83mVjf+ZbsSXiOnyM0JLyAGA==
Message-Id: <vmime.5df7a6c1.763c.aad494776a5d451@ms249-lin-003.rotterdam.bazuin.nl>
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

Hai Rowland,=20

Well, that i missed a few that is possible. ;-)=20

Git is still hard for me, so i started with with it not, and i think safest is to try and fix typo's..=20
And yeah.. I know,, im full of typo's, but im trying .. ;-) i used the example corrections for lintian.=20

I also forgot everybody is buzy with 4.11.4.. Totaly forgot that release date.=20


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: maandag 16 december 2019 16:35
>
> >>
> >>
> >>
> >>
> Hi Louis, believe it or not, but 'wont' is a valid English word ;-)

Ah, i knew it.. But i wat thinking, i'll bet Rowland will have a look.=20
Best spell checker in english..  :-)=20

>=20
> You missed a few typos/mis-spellings:
>=20
> s/Crete/Create/
> s/behavies/behaves/
> s/Thep/The/

Yes, possible, i'll see what the next lintian output gives on 4.11.4.=20
And try to make a new one.=20

>=20
> One of your changes is this:
>=20
>  =A0 * Heimdal libhdb library provides the backend support for=20
> Heimdal kdc
> - * and kadmind. Its here where plugins for diffrent database engines
> + * and kadmind. Its here where plugins for different database engines
>  =A0 * can be pluged in and extend support for here Heimdal get the
>  =A0 * principal and policy data from.
>=20
> I think the the second to last line should be this:
>=20
>  =A0 * can be plugged in and extend support for where Heimdal gets the
>=20
> Finally, this:
>=20
> +The `check_boost` configuration function allows one to=20
> specify the used=20
> boost libraries.
>=20
> Should probably be this:
>=20
> +The `check_boost` configuration function allows one to specify the=20
> boost libraries to use.

Ah,, i see, i missed "enters" also, so fixing these with sed is tricky..=20
I'll add that on my check list, that i must read the lines and not only use sed on it.=20

I also still have a few git questions, but when im at that point i'll ask my question.=20
But thank very much for the reply Rowland.=20

Now, upto setting up for the 4.11.4 builds.=20

Greetz,=20

Louis




