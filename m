Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4E53034C
	for <lists+samba-technical@lfdr.de>; Sun, 22 May 2022 15:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1rY7uaJlJGkg2VBAlABH4xw3dc6Gx6m8qCd5wNVgQdY=; b=icAByJixpc8CIh6Rs3P0KcGTxA
	CR5yMpLkle8I1pueuz8OFB3HOR67tI7cwCGONrxfjJsOJvdHGRZ7/+JT5/rCro6qc5qlJ7G1yPY38
	Xm1E5Y9lLeFlxYdjhLv9a9bcJxxvVKnu3ntaB6VJPedEFc3iOCe0gv8pIutl0JO5GuSKfmi214wCr
	YoffpUgzdK6YrczdEXB+7PjH39jU2k5rQvn1aDH0sW1eGSOnoSjXoTPLMETxs7x9vRztgvQSS2wCH
	cJEaP5pl1DfdtjHpF7hj2nNgZQppZpwDOQOmEMdKg8Noi5WMaNmVUzx2ri/qjySg7X4k27ArGYFEo
	EUT2SIig==;
Received: from ip6-localhost ([::1]:41614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nslV8-002Q63-G3; Sun, 22 May 2022 13:20:06 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26]:50794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nslV1-002Q5t-Tu
 for samba-technical@lists.samba.org; Sun, 22 May 2022 13:20:04 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <tnagy@waf.io>)
 id 1nslUx-003XFB-GH; Sun, 22 May 2022 15:19:55 +0200
Received: from [10.9.9.127] (helo=rmmprod05.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <tnagy@waf.io>)
 id 1nslUw-00074j-On; Sun, 22 May 2022 15:19:54 +0200
Received: from mail by rmmprod05.runbox with local (Exim 4.86_2)
 (envelope-from <tnagy@waf.io>)
 id 1nslUw-0006po-KM; Sun, 22 May 2022 15:19:54 +0200
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received: from [Authenticated alias (664370)] by runbox.com with http
 (RMM6); for <samba-technical@lists.samba.org>; Sun, 22 May 2022 13:19:54
 GMT
To: "samba-technical" <samba-technical@lists.samba.org>
Subject: Re: tons of uselib_local warnings in waf
Date: Sun, 22 May 2022 15:19:54 +0200 (CEST)
X-RMM-Aliasid: 664370
X-Mailer: RMM6
In-Reply-To: <3519737.R56niFO833@magrathea>
Message-Id: <E1nslUw-0006po-KM@rmmprod05.runbox>
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
From: Thomas Nagy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas Nagy <tnagy@waf.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 19 May 2022 14:23:28 +0200, Andreas Schneider via samba-technical <=
samba-technical@lists.samba.org> wrote:

> On Sunday, April 3, 2022 6:52:29 AM CEST Michael Tokarev via samba-techni=
cal=20
> wrote:
> > I tried to dig there, but weren't able to figure out how
> > it all works.  The following change does eliminate the
> > warning, but I'm not sure the resulting thing actually
> > does what it is supposed to do.  For one, there's no
> > function like "apply_use()" in samba_waf18.py which does
> > something similar to "apply_uselib_local()", - I don't
> > see where this "use" attribute is processed.
> >=20
> > What would be the right fix for this?
> >=20
> > Also, where to look for some basic docs about waf
> > internals?
>=20
> Hi Michael,
>=20
> I wonder if someone really does. You can look for docs at https://waf.io =
for=20
> waf documentation, but there isn't any documentation for wafsamba at all.
>=20
> I would suggest to create a MR at gitlab, then we will see if anything br=
eaks=20
> or not :-)
>=20
> https://wiki.samba.org/index.php/Samba_on_GitLab
>=20
> Best regards
>=20
>=20
> 	Andreas


The purpose of uselib/uselib_local was to ensure that local libraries are a=
lways preferred over system ones. With the newer "use=3D" parameter, the pr=
evious schemes (uselib/uselib_local) can be discarded. Since the library or=
der seems to be scrambled and unspecified in Samba at this time (https://gi=
tlab.com/samba-team/samba/-/blob/master/buildtools/wafsamba/samba_deps.py#L=
270), I believe that the change suggested by Michael is fine.

Yet, if there is any concern that something might break silently, then the =
best approach is to simply remove the warnings on that line https://gitlab.=
com/samba-team/samba/-/blob/master/buildtools/wafsamba/samba_waf18.py#L319 =
(or build without the "verbose" option) and to focus the efforts on obtaini=
ng a consistent library order in buildtools/wafsamba/samba_deps.py.

Thomas

