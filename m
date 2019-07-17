Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCBC6B99F
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2019 11:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=q0LBdRJYdihC16bbq4mXjDmH/cLnotrfxHPqqIrKmI4=; b=NYFcpIFGhEzgYMScjy8tHtbqBW
	z0hKy5lsshC99VAlOJ0Csn0Uq3SEY3MKyHewlavHEqgb19scha3qoRtGlP/La0lzXqL7F0v8todKK
	9a8/OJK8+OGHXtw1We0Uk1UdF9xdaz38/1JOKrVyy14MtAQCGXvfomAqWeqQOGVkpWr/sn0HxSqaR
	SpP8wOMGBD2IQkDlR0I7ZgCGtWaGnCXNLserM2ZFJvJSUhGS3WrDqlZJCCesd/PTiWpWMYNvCQVje
	PNyE4kjcE3EDNyiincBcyjtreuF49+FkCxAfCfTXtRSdqDgD3DBrNVIuffZfFVz0HWg9EPcGOLph8
	7jvhDErg==;
Received: from localhost ([::1]:34062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hnggl-000R9K-7O; Wed, 17 Jul 2019 09:57:31 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:60846) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hnggh-000R8r-BT
 for samba-technical@lists.samba.org; Wed, 17 Jul 2019 09:57:29 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1563962244.03572@l27Ggy6bIMNEPr4vGbyPYA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 9060211EFA2.A7BA3
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 9060211EFA2
 for <samba-technical@lists.samba.org>; Wed, 17 Jul 2019 11:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1563357442;
 bh=JM5w3OQfSl4aoeysFnX/YxZdLIur7pHV26sGqdsZmVw=;
 h=Subject:From:To:Date:From;
 b=N6+otLB3S9+3l8pNHgXB+Lk7gAlprxqI82IxglwUga53iQpn+tP/G0idHu+GOPdII
 tqsO1AmhVP33jJQ+7ISWW/+3H9HAQpitnIdvpdRfGENiq/BH7DbfW8z/CiVS3Zbk9m
 A9jsAqJOn2NGZmWZA0CPuUGCiSbF4/XaP7S0xLaTz5rB/KUtMPfNc/ey9UyRZ4NL1z
 eyP9Cc5LdsiE4kgy4fQQtrXri2z4KXqwcxBfl01Mzzpc56ukc0PcSRKGSD4HW1zkvb
 RceV1xUhVjxiuoQvvdOJyAhJDcBK297uyWfbu5YVL8iRlCpDqqjomdxF3WmS6cveDO
 KUvAHnAojsz6g==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 83C193AF8C
 for <samba-technical@lists.samba.org>; Wed, 17 Jul 2019 11:57:20 +0200 (CEST)
Subject: Samba 4.11rc1 and tdb packaging.
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Wed, 17 Jul 2019 11:57:20 +0200
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdU8hgW9sZcSVGURR2+QRdbOLFBCOA==
Message-Id: <vmime.5d2ef100.310f.4ee297007e278100@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Hai,=20=0D=0A=A0=0D=0AIm having a quick look for a test build on samba 4.=
11 rc1=20=0D=0A=A0=0D=0Aim stopped at:=A0=20=0D=0AChecking for system tdb=
 (>=3D1.4.1)=A0=A0=0D=0ALatest here:=A0=A0 https://ftp.samba.org/pub/tdb/=
=3FC=3DM;O=3DD=A0=20=0D=0AShows only 1.4.0.tar.gz=20=0D=0A=A0=0D=0ACan so=
meone update this to 1.4.1 is available also.=20=0D=0A=A0=0D=0AThanks!=20=
=0D=0A=A0=0D=0AGreetz,=0D=0A=A0=0D=0ALouis=0D=0A=A0=0D=0A=A0=0D=0A=A0=0D=0A=
