Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFAE114C59
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 07:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aroiuiMTWXofDGdaGH4FpfJoZllSKPvhHHDkIME0lYs=; b=wyMw7i4EfKg+NHqavUrSFLvgPF
	aHJrzvZo5oT05jr7nszaL/4i57m9yAMvMeZ3fX/jBTlXX7gB9hJOWgmQke5tOr0U+yjkiSJwEivYc
	o16L+81T6c9hoigx3uQk1QYCD0unSaAuQFkNc27qpHkp9D72n8L4PWVSfuoNJct5IaSc3mZZmWg5h
	R26eBvh+/eX0LdTK9bVbbqVootYmFsroTB17W3SmZxYxWARQaa/DEjj3izErmB1IB7iGfFcNwgOcU
	TKa96duoUDtNFKgOFo90Q5NnaMl104qTJn7jB/D2qxPG3b+b625zr9S6RVUzlMq6q5QlhxbZRIRxj
	lCssHHvw==;
Received: from localhost ([::1]:57030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1id790-006Mp9-7X; Fri, 06 Dec 2019 06:31:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45266) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1id78k-006Mp2-3m
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 06:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=aroiuiMTWXofDGdaGH4FpfJoZllSKPvhHHDkIME0lYs=; b=eTZaffaFoWgQWjX+JS7/5p2JGH
 Wa/EAMOAvvf7DyNV2hX1Dg+s/aEjaCqkLXHKcFKn+XHcNrVvg9P14oEpPrmqlkDb4vJtA1ckaQucb
 HHjfALzZw6byYWPH4LFVtWfMxzk1HEZ6JcqnKMB0SGCKX1DRLp/KXAP8l+E4Nq7351DPz32B67wLD
 sGYrPtM+v8dsaL+VqI56/qx6xoEC8sni7+rcYWWa2igmBQLn+XAlvuKbsHsbuU+Fl+ko26v/lnSIk
 MiwTDY8rFjRH/uHTEn6ZdaIUoQ8dvnLYINqDHaXQA/8Yzkq1aV+OZ9CXJfN5RPaavQrTLU2kTOdxS
 zxf5ikWYCIxRHLMRABVblThYm2BsiVLK/kx6NxzXMG84IJvnVC9iJX/9A5GxHvSFag6/R90P7GOfd
 bBEMo2lcAMvOgutIxf/Bd2MZyh2aBZ7amtCB69eMQa6tdTXFc1Fuxy3J9u9RFIY7+FKavRr4sbBTJ
 imDJL+kerZWkT0S4o2UfJRoK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1id78i-0004g3-9a; Fri, 06 Dec 2019 06:30:56 +0000
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Fri, 06 Dec 2019 07:30:54 +0100
Message-ID: <3533791.v9fxMDVjKa@magrathea>
In-Reply-To: <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
 <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 5 December 2019 22:27:59 CET Mikhail Novosyolov wrote:
> 26.11.2019 19:20, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via samba-
> >=20
> >> I have tested those 4 patches (2 yours, Andreas, and 2 mine that I sent
> >> here previously). Behaviour of /usr/lib/cups/backend/smb symlinked to
> >> patched smbspool_krb5_wrapper seems to be correct: it passes printing
> >> tasks from printers without "AuthInfoRequired negotiate" directly to
> >> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
> >> "AuthInfoRequired negotiate", where UID is a local ID of a domain user.
> >> I clearly see this in /var/log/cups/error_log when it is "LogLevel
> >> debug2" in /etc/cups/cupsd.conf.
> >>=20
> >> So, these patches are ready to be merged, I think.
> >=20
> > I'm not able to apply your patches. Could you please send patches creat=
ed
> > with 'git format-patch' or point me to a git repo where I could pick
> > them?
> Hello Andreas,
> I have recently read how it is recommended to send patches to Linux kernel
> and it is recommended to send them as plain text, not as attachments, so
> I'm resending them as plain text emails in the following emails.

=46or samba we prefer one attachment as a patchset or a merge request.

I opened one here:

https://gitlab.com/samba-team/samba/merge_requests/961


	Andreas



=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



