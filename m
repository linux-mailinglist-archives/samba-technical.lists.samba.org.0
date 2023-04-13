Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CE6E075D
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 09:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZMGYJ9sMIEVquIx2jfxgoMrn1JW2tjzzaYdSYyxHIwo=; b=2Uoi/Qc/P3rM8/pnNM+dCtysJs
	8eXkZep7Mm1EsUCHpX0OiLKrQilSEJj0mJ4xzGL3zazpWsnY95XmyUFSxPZkumCMCG7amu17YDbTY
	C9WpKX9kkGMIGFdf2EV6HFv/8UTOD4kSM9kBF/p7ZCCda26EIYI7HsABpDEukHt7c1Wxxv8E3gi4k
	KQ+Tj0a2AD6+bElw9+/sSsNs9Ok09ouGoSnyTj5BvA1yE5XoTPFy4RlNRcTv3YPCnbIU+onwyc89j
	oi5C8tBS5z0UZa72UNq3N1ibpDArhfU/JyfAJPOsJ/T6pBZhHb5nKPqTD2JQd0zyA3QPQ+VImqsFn
	3DsTYnrg==;
Received: from ip6-localhost ([::1]:32202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmr4c-0011jA-8M; Thu, 13 Apr 2023 07:08:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmr4L-0011j1-5Z
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 07:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZMGYJ9sMIEVquIx2jfxgoMrn1JW2tjzzaYdSYyxHIwo=; b=x9AB9B+CRJTMj+U6hV/vEvw9V2
 YHf02KtVW/DKFkB/rlal3dvLLENMx8eTGSQ26XR07rsfFK+Lw/x4M8eKWKKVZbKA50OjduWqPpwpS
 TM+mrDDPeHDkax0BoVwir6RR2oZgB7OEskHzluzxXCTM97HqT2y2MK6XIJ4wEMnYueGSBdg7yOQPk
 cZqxD9J8XOTJkOJ24Oz8KIKX3B2/qInF77QwrNFFYC5HlCezuF3M41tzwxoNYJ8D4iUidFbYV8IId
 dwZMLa69KCFz2D5hor3InUQlrRWHEyS9oZ0gZ0AxJG6qp0fROVyYBwOJjRq/3ki3WSBV0McoJG105
 aYH6PE4Ft2XD1rmQuIukNCva6FAdfEnc6Hb/ht24GUiw/3rHuQCaglO/NSgYMc5KGzEPRL4HUKMm2
 z/fSN/P8u4IFT7iB4b0lkmP0mkspGQH/h4E/kRHwa/JiQIfJjssmVVtWFBCRWFzi7CLe3p1fjRk+t
 183TFy1qsu/LbPkhbtGNjqQW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmr4J-000sve-1n; Thu, 13 Apr 2023 07:08:31 +0000
To: samba-technical@lists.samba.org
Subject: Re: Recent Samba (4.18.0+) winbind configuration ?
Date: Thu, 13 Apr 2023 09:08:30 +0200
Message-ID: <4478873.LvFx2qVVIh@magrathea>
In-Reply-To: <ebf9c5cb-eee5-6b15-586f-c4af0b2f01eb@samba.org>
References: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
 <ebf9c5cb-eee5-6b15-586f-c4af0b2f01eb@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 11 April 2023 15:49:15 CEST Rowland Penny via samba-technical=20
wrote:
> On 11/04/2023 13:32, Ji=C5=99=C3=AD =C5=A0a=C5=A1ek - Solaris Prague via =
samba-technical wrote:
> > Story begins when Samba 4.14.0 changed its VFS so we decided to skip
> > 4.14.x and also 4.15.x releases to bundle it on Solaris but various
> > problems were also with later releases and we were only fixing issues in
> > 4.13.0 . Currently (4.18.0) the situation can called be critical so I
> > focused on recent release.
> >=20
> > winbindd is giving up and I think the key could be in log message:
> >=20
> > [2023/04/11 11:28:53.090661,  5, pid=3D1525, effective(0, 0), real(0, 0=
),
> > class=3Dwinbind] ../../source3/winbindd/wb_lookupname.c:
> > 52(wb_lookupname_send)
> >=20
> >    WB command lookupname start.
> >    Search namespace 'smbsetup' and domain 'smbsetup' for name ''.
> >=20
> > ...where "smbsetup" is my domain  ...and I have added core-dump here to
> > freeze the stack:
> >=20
> > [2023/04/11 11:28:53.090780,  0, pid=3D1525, effective(0, 0), real(0, 0=
)]
> > ../../source3/lib/dumpcore.c:315(dump_core)
> >=20
> >    dumping core in /var/samba/log/cores/winbindd
> >=20
> > I went over such many frames of "tevent's" but I do not know where to
> > start evaluation. I only catch the (PIDL) generated code was
> > optimized-out by gcc (11.3.0) so I built the code with -O0 and now the
> > code is available.
> >=20
> > In the mood of total madness I also tried ChatGPT which suspects my
> > smb.conf but answer on my question:
> >=20
> >=20
> > Q:
> > what was changed in idmap configuration in smb.conf between 4.13 and 4.=
18
> > ?
> >=20
> > A:
> > There have been some changes to the idmap configuration in Samba between
> > version 4.13 and 4.18, although they may not necessarily be related to
> > the issue you're experiencing.
> >=20
> > One notable change is that in Samba 4.18, the idmap config parameter has
> > been deprecated in favor of the idmap_ldb parameter. This new parameter
> > uses an LDB backend for id mapping, which allows for better performance
> > and scalability than the previous tdb backend.
> >=20
> > Another change is that the idmap config parameter in Samba 4.18 now
> > accepts a backend option, which allows you to specify the backend to use
> > for id mapping. The options are rid, ad, autorid, and autorid_compat.
> >=20
> > The rid backend continues to be the default, which means that if you
> > don't specify a backend explicitly, Samba will use the RID algorithm to
> > generate UIDs and GIDs.
> >=20
> > In summary, if you're upgrading from Samba 4.13 to 4.18, you may need to
> > update your smb.conf to use the new idmap_ldb parameter and specify a
> > backend if you're not using the default rid backend.
> >=20
> > ....looks suspectably because I can not find "idmap_ldb" in man smb.conf
> > so I asked again:
> >=20
> > Q:
> > backend option of idmap config was available even in samba 4.0.0 smb.con
> > so what exactly has been changed in 4.18.0 ?
> > A:
> > Something went wrong. If this issue persists please contact us through
> > our help center at help.openai.com.
> >=20
> > ...I do not want to push here the way how to shot-down the f'g ChatGPT
> > but I would like to know if something was really changed. I went through
> > the RELEASE NOTES and there is nothing directly concerns to idmap config
> > AFAIK
> >=20
> > constraints:
> >   - net ads join works as usual include adding of "A" record to DNS
> >=20
> >   - despite of successful join it looks DC can not be located:
> > [2023/04/11 11:28:53.083220,  1, pid=3D1525, effective(0, 0), real(0, 0=
),
> > class=3Drpc_parse] ../../librpc/ndr/ndr.c:490(ndr_print_
> > function_debug)
> >=20
> >         wbint_PingDc: struct wbint_PingDc
> >            in: struct wbint_PingDc
> >=20
> > [2023/04/11 11:28:53.083291,  1, pid=3D1525, effective(0, 0), real(0, 0=
),
> > class=3Drpc_parse] ../../librpc/ndr/ndr.c:490(ndr_print_
> > function_debug)
> >=20
> >         wbint_InitConnection: struct wbint_InitConnection
> >            in: struct wbint_InitConnection
> >                dcname                   : *
> >                    dcname                   : ''
> >=20
> > ...so it really looks like a stupid mis-configuration issue of mine.
> >=20
> > Google is silent on all my attempts to ask "him".
> >=20
> > If someone have some good idea please share it with me.
> >=20
> > Many thanks,
> > Yura
>=20
> Yes, stop asking chatGTP, you have made my day by supplying me with
> proof that chatGPT is STUPID!!!

It isn't really stupid, it just learns patterns it finds in a data set and=
=20
then give you the results what it learned. This means that the data set is =
at=20
fault here and the data set is "the Internet" :-)
=20


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



