Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1F2201CB
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 10:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=235M8FldnZJbhT0jB0OywFFTBO5elwXSzElrN7V8cDI=; b=Gn8olrmXr5uEJJfq3XtpL/kuDV
	ST7HSkrXiXaEAnFjDV6cmihJajdnhYP/qBGRRmsO0lbDt7QdpyUH5CLn5Vlq9H/5ieGld8xmByX7P
	7/qC0JR8JlhljSUginIFDdiI/Rdl39xzEsIgFFdQVilTacf6US2emCc9G9wfXEBlfYFZvEWH5Arew
	wAkX/+26rwlGasAhKMJ7UKEe4KY94MDTjXbuX+iN0a+hAcQiOhsfrUrhGee1pGPUdxYvAf9WQCIRp
	HHoL4erDquaJa0XMiQ4+u3qER73r6k5mXASCa1B+z5JB8GTLKjRNYTw9j/zrTSrzQow6NT7vm+U4t
	vp+qRuMA==;
Received: from localhost ([::1]:43184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRCC2-0001f4-NJ; Thu, 16 May 2019 08:56:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:23542) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRCBy-0001ex-Vv
 for samba-technical@lists.samba.org; Thu, 16 May 2019 08:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=235M8FldnZJbhT0jB0OywFFTBO5elwXSzElrN7V8cDI=; b=EYldgHkGmmZAWAY/6pcxAuMiT1
 QrOuyr0+XanfrLyPg+e15kt8rwANdlS3Xxzd0ljtATzdjaEqKTmlXfI+3DiXeUvEcV3xmujaIjvpM
 Ep/5AeWS0H8JqWTmsgKJy1VQToNeEsTR6BRgjITbTpJFxmKKl7BChjGAndGUHJQYxJqo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hRCBw-0001AU-QM; Thu, 16 May 2019 08:56:44 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Date: Thu, 16 May 2019 10:56:43 +0200
Message-ID: <1685286.56Q1xU0MPY@magrathea.fritz.box>
In-Reply-To: <20190515205841.GD253468@jra4>
References: <B15C9E07-0E0B-49CD-BDD8-0CD236C4F777@nutanix.com>
 <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
 <20190515205841.GD253468@jra4>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Shyam Rathi <shyam.rathi@nutanix.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 ddiss@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, May 15, 2019 10:58:41 PM CEST Jeremy Allison wrote:
> On Tue, May 14, 2019 at 06:26:07PM +0000, Shyam Rathi via samba-technical=
=20
wrote:
> > https://bugzilla.samba.org/show_bug.cgi?id=3D13947
> >=20
> > To reproduce, create a share with a name where 32nd byte is not the fir=
st=20
byte of a mutlibyte character. Using CJK characters (3 bytes each) is a=20
possible approach. For example, creating a share with name =EC=97=90=EC=9D=
=B4=EC=97=90=ED=94=84=EC=97=90=EC=8A=A4=EC=82=BC=EC=A0=90=EC=98=A4=EC=83=9D=
=EC=84=B1 and=20
trying to open a txt file in Notepad gives the following error:
> >   Invalid character. For multibyte character sets, only the leading byte
> >   is
> >   included without the trailing byte. For Unicode character sets, inclu=
de
> >   the characters 0xFFFF and 0xFFFE.
> >=20
> > Looking at wireshark capture, the following is seen as source of this=20
issue:
> >   GetInfo Request FS_INFO/FileFsVolumeInformation File: Rathi9\????????=
???
> >   GetInfo Response, Error: STATUS_ILLEGAL_CHARACTER
> >=20
> > Proposed solution is to truncate the label name at the end of a multiby=
te
> > character before the 32nd byte.
> >=20
> > Please review and suggest changes, improvements and other approaches.
> >=20
> > Regards,
> > -Shyamsunder Rathi (mailto:shyam.rathi@nutanix.com)
>=20
> A few slight changes to make things clearer (to me at least :-).
> Changes attached and bug ID added to the commit message. Let me
> know if you're OK with it.
>=20
> RB+. Can I get a second Team reviewer ?

RB+ and pushed to autobuild.

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



