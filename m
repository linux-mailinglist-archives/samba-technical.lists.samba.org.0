Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F8315E2A
	for <lists+samba-technical@lfdr.de>; Wed, 10 Feb 2021 05:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=NrFww7kZ/Zn2QxfoE2AzluGWIFovAfUtWWavx+XHdWY=; b=KDUEqOpsPOVx/bT+VJjNSXx9vL
	ufFImoC83BMzZFMc+iFRweShJlvM86rZEVhxlVPqZgybvrUqNAaO7b6mUOujSmp8TbmhDv2V/ZsxB
	npRwpclxUDfiUb5bgkUf8PvpipNut76MHlDh2rqUFR4AnA4oD2ty/15XnXgQedB+W5DLR7yRiVBba
	k43Oo4fTFgkxrD8vN48kk3PZsgn7FjwCM5r/LHmfcm8l8+4ocdB7rZSgcBJ21Wudm30rBYg9vMBzr
	wsqc5gdtYs79QVBPq9y9MkIHkVXzm5iiuhk6vQqvJx228beCrlAWOk5mEuJQJCwWByEDAy1d1rTlS
	L6i1eivw==;
Received: from ip6-localhost ([::1]:63470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9h2p-00BwMM-T7; Wed, 10 Feb 2021 04:24:03 +0000
Received: from [130.34.150.3] (port=52768 helo=altair.ei.tohoku.ac.jp) 
 by hr1.samba.org with esmtp (Exim) id 1l9h2i-00BwMF-8W
 for samba-technical@lists.samba.org; Wed, 10 Feb 2021 04:24:00 +0000
Received: from lunchbox.ei.tohoku.ac.jp (lunchbox.ei.tohoku.ac.jp
 [130.34.150.50]) (Authenticated sender: kuri)
 by altair.ei.tohoku.ac.jp (Postfix) with ESMTPSA id 65592A00080
 for <samba-technical@lists.samba.org>; Wed, 10 Feb 2021 13:06:19 +0900 (JST)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Build error with C locale 4.14rc2
Message-Id: <8FA63D2B-626F-4717-858D-8DA81F2AB80E@ei.tohoku.ac.jp>
Date: Wed, 10 Feb 2021 13:06:19 +0900
To: samba-technical@lists.samba.org
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
From: OHKAWA Yuichi via samba-technical <samba-technical@lists.samba.org>
Reply-To: OHKAWA Yuichi <kuri@ei.tohoku.ac.jp>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

When I tried to build 4.14rc2 with LC_ALL=3DC locale, a build error have =
occurred.
If I used LC_ALL=3Den_us.utf8, I had no error.

I guessed that because python3.6 under C locale cannot treat  a latin =
character =C3=B6 of source4/heimdal/lib/asn1/lex.l.

---- error message ----
[368/418] Compiling source4/heimdal/lib/asn1/lex.l
Waf: Leaving directory =
`/builddir/build/BUILD/samba-4.14.0rc2/bin/default'
Build failed
Traceback (most recent call last):
  File =
"/builddir/build/BUILD/samba-4.14.0rc2/third_party/waf/waflib/Task.py", =
line 350, in process
    ret =3D self.run()
  File "./buildtools/wafsamba/samba_waf18.py", line 30, in flexfun
    tsk.outputs[0].write(txt.replace('\r\n', '\n').replace('\r', '\n')) =
# issue #1207
  File =
"/builddir/build/BUILD/samba-4.14.0rc2/third_party/waf/waflib/Node.py", =
line 201, in write
    Utils.writef(self.abspath(), data, flags, encoding)
  File =
"/builddir/build/BUILD/samba-4.14.0rc2/third_party/waf/waflib/Utils.py", =
line 268, in writef
    data =3D data.encode(encoding)
UnicodeEncodeError: 'latin-1' codec can't encode characters in position =
33323-33324: ordinal not in range(256)
---=20

--=20
OHKAWA Yuichi

