Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B33EE6F3
	for <lists+samba-technical@lfdr.de>; Tue, 17 Aug 2021 09:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=e8dnk9/IqzkIU1wmvBlT4B7H5gszl7P9cxZrBFF/S80=; b=NRLJDlBcIdoru0U9cUfnsWfzc1
	a4bAITujAJrCvY+MNeUhymhFqnvi9IfGmDqp3XlWtyiFHKVbSIR/1KblofZIgK4NHsPnjb/+dhZHY
	2oiu++iXxKk6YTjxDXen+7m+mr5yGtBlfCLhS/lUsh95CuYBSI8iLo61h1chhiF+/oqYZnMeGfLFV
	jdyAxcXOxOmOnhd0OCF5A6ccxiV7BUGDh1uZd9kgwQiIdvtB9PY3tp9Mv78BFOv4WiPnlh7PuDFSI
	SCsqZFVbCesAuX+8MKUHwI4zOC+0udYzJtV5XIKNoOuu1XqAVuiWAtvZHYVihDQo4Kh6JOwtN7BBK
	IOzkrbFg==;
Received: from ip6-localhost ([::1]:57324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFt8j-006mp0-5U; Tue, 17 Aug 2021 07:04:01 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:32974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mFt8N-006mor-TI
 for samba-technical@lists.samba.org; Tue, 17 Aug 2021 07:03:45 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1629788603.72509@2+cFCnG+xcTFVItULpqvjw
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: AD31B11EF14.A8F78
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id AD31B11EF14;
 Tue, 17 Aug 2021 09:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1629183802;
 bh=82P+fBjISid3HbrKVoY7eXiJ+5oy7XKpNvNVAXITca8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=F9xy9VXNSDIsPpwtOvWJOVRPdyzzXbl/AUnKrKlBrXn1eepBJqIZZ8ytJz+cz2/sl
 cLUblSddFDXWWAZOSm85qHXUpJagdya9JZ59u/5fmT8Ahn/HF4fkiC7RbtabzYLMkb
 k5Jt2Er8gl/vq8zkr4SdmGg+0nNgh5yaiCP4UJ3ajhMs86LHf8xJgb0p4tlFw7GCtU
 S1I2Th2O3C7q9xsSmADk8J2JLXOqQniMB0rfzgi8ZOBYsuI11Zxy5racgDrzNxwe/d
 uhxf9EvxnwyljKpsdaNkqJQzRIO75IQ/jJAtwFKXDyKfhPJd5mVz1Cdo/tilCokkU7
 hGefohCbSFSGw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 6B64B18C2323;
 Tue, 17 Aug 2021 09:03:29 +0200 (CEST)
Subject: RE: [Samba] wiki returns ERR_HTTP2_PROTOCOL_ERROR
To: =?windows-1252?Q?Andrew_Bartlett?= <abartlet@samba.org>
Date: Tue, 17 Aug 2021 09:03:29 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2c25a430e58843346158c4a3f809dc197df62316.camel@samba.org>
References: <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAALDNuoTUz2BEvIzum5zYFuMBAAAAAA==@sapo.pt>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdeTNfslOrYLDmeCQ6Oz5C5dQg5Gng==
Message-Id: <vmime.611b5f41.4750.487454c74d69d4d1@ms249-lin-003.rotterdam.bazuin.nl>
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


I dont know how handles this, but Its something that happend after the renew of the certificicate.=20
Thats where the misconfiguration is. Missing HPKP.=20

Certificate #1: EC 256 bits (SHA256withRSA)=20
Serial Number=090337747cc4c9caf0ca7b0eca0f4c32a44b72
Valid from=09Sat, 29 May 2021 05:25:24 UTC
Valid until=09Fri, 27 Aug 2021 05:25:24 UTC (expires in 9 days, 22 hours)
This one  PIN:  DT/SApt3dPXAcaf9rnVmi2YbmxUy4gHvn50WiMLNXJA=3D    Is not published.=20


Certificate #2: RSA 3072 bits (SHA256withRSA)
Serial Number=09041aae8a416f93319ff53f29bd2eb6b41d84
Valid from=09Sat, 31 Jul 2021 05:25:22 UTC
Valid until=09Fri, 29 Oct 2021 05:25:20 UTC (expires in 2 months and 11 days)
Pin :  jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=3D is published.=20

And with pinning HSTS used and DNS CAA, this is what i would look at first.

Published PIN's
pin-sha256: YLh1dUR9y6Kja30RrAn7JKnbQG/uEtLMkBgFF2Fuihg=3D
pin-sha256: jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=3D
pin-sha256: J2/oqMTsdhFWW/n85tys6b4yDBtb6idZayIEBx7QTxA=3D


So why we have errors in "some" browers, these browsers enforce/follow the best settings,
Just, these have errors, so we see these.=20



Greetz,=20

Louis

=20

> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Andrew Bartlett via samba
> Verzonden: dinsdag 17 augustus 2021 1:14
> Aan: miguel medalha; samba@lists.samba.org
> Onderwerp: Re: [Samba] wiki returns ERR_HTTP2_PROTOCOL_ERROR
>=20
> On Mon, 2021-08-16 at 23:03 +0100, miguel medalha via samba wrote:
> > > I went to access the wiki and it is returning
> > > the error ERR_HTTP2_PROTOCOL_ERROR.
> >=20
> > It works here with curl 7.29.0 and 7.19.7
> >=20
> > Works with Firefox 91.0
> >=20
> > Doesn't work with any browser based on Chrome:
> > -- Chrome  92.0.4515.131
> > -- Edge 92.0.902.73
> > -- Brave 1.28.105 Chromium: 92.0.4515.131
>=20
> Thanks everyone for the report.  I'll mention this thread to our
> sysadmin team.  Our sysadmins operate on EU time so hopefully they can
> deal with it in the next EU day.
>=20
> Andrew,
>=20
> --=20
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>=20
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>=20
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


