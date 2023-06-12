Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EA72C3DC
	for <lists+samba-technical@lfdr.de>; Mon, 12 Jun 2023 14:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pr4Ct4nizXVLNuP9lV4fPNNu/7yYCdWL+y1OdNChHOo=; b=rSC+QYctqyB+66YhiflYWb56So
	NsVYoq/K4x8+YwIjIxgJhU20D1BR+OE1rCPqdMuRARs54k9V+Sd0UAW4pRlzgeI7VFSCK4GDwnsrL
	gKbYs2dPDBn0mVSoZTqZk6f9VeF9r1Ls8Mnv9/RpyEJuKTk+VoWLWFlI3duVHz2/psYFB7jeJJv4g
	9WEUIhpNV0hArnEQTcqWwF13g/q252kyJEOvFzSHvAaKnNegDItMzXVPBqQdPyzB1of7+aBI7G7OX
	mA0FQAnfyTLwdpv79rJuZFWv4JABPDYBOn4Zp5+/9S2F0iy9Fc81Qg2awvtfBJ8x20w06ps0/ONti
	JrXw5BvA==;
Received: from ip6-localhost ([::1]:28080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q8gW2-001QuM-05; Mon, 12 Jun 2023 12:19:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q8gVw-001QuD-Hr
 for samba-technical@lists.samba.org; Mon, 12 Jun 2023 12:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pr4Ct4nizXVLNuP9lV4fPNNu/7yYCdWL+y1OdNChHOo=; b=L/BaxF56ZXsIGiSMJFTh6I+dgA
 XWXxgSvXem/CW0Uryq6Y/TdXjVC/7vfNsEK2BNT+rrqLN+9bmxIUCa22DL8V044F8z3N3wRXHAZV0
 Xp5O+Nl2jA/z0xVEZqf0duPv9hpDgScFN5TasEDdWIvkmUuD5o6XpsVbZODBw4x2dCs/mjFNH+Grf
 O1k6QUSol5eOrqr98zf/AiuxeqCUYnjIFEnH1EbjufX7lEuBmLlYLtO6sh9il1DTYuOQiVE3AZx9I
 DqhfdHZcpE/EIdAx3uDpC6XXvISNdLyUJXkom9orkcYceQrsgqqQPnqDkxu0PKFc4lVJ/4PrY8TJa
 fYMX4l1zYv7v6nw4LPzmcwF1m4xYmL/NlJ/9x60X2By0noeQSwanCPbL+EbQ2ITGgrMmC9U4o0YZ5
 9dVyLC1f+CrY6yLxF3b2vC+QF8CcAl950pEBEIyGkfxOF2DSPbsFMuU7ixFfeu65QGgj1jRljUfK3
 IrFYxSPEdbuOvKy6i89Ym0dc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q8gVt-001R7B-1V; Mon, 12 Jun 2023 12:19:13 +0000
To: samba-technical@lists.samba.org
Subject: Re: change rpcclient dfsgetinfo path syntax ?
Date: Mon, 12 Jun 2023 14:19:12 +0200
Message-ID: <4492335.LvFx2qVVIh@magrathea>
In-Reply-To: <cc374358-3e49-eba0-2f69-6902f0fc156c@samba.org>
References: <cc374358-3e49-eba0-2f69-6902f0fc156c@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Pavel =?ISO-8859-1?Q?Filipensk=FD?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 9 June 2023 17:24:57 CEST Pavel Filipensk=FD via samba-technical=
=20
wrote:
> Hi,
>=20
> with samba 4.17.5 following syntax was fine (consider that all
> backslashes are escaped, so every backslash appears twice at the command
> line)
>=20
> $ rpcclient localhost -U% -c
> 'dfsgetinfo**\\\\localhost\\samba-share\\pointA localhost pointA'
>=20
> with samba 4.18.2 only this works:
>=20
> $ rpcclient localhost -U% -c 'dfsgetinfo \\localhost\samba-share\pointA
> localhost point'
>=20
> Looking into /var/log/samba/log.rpcd_classic shows that:
> - 4.17 is using parse_dfs_path() with trim_char(p, '/', '/')
> - 4.18 is using parse_dfs_path_strict() that does not trim anything and
> assumes single '\'

Looking at the commit message of 06750a96 Jeremy wrote:

  The paths sent in these calls are guaranteed to be of canonical form:=20

  \SERVER\share\pathname

This means in rpcclient you need to check if the path start with \\ and rem=
ove=20
one before handing it down to that function.

Obviously we need an rpcclient test for this ...


Best regards


	Andreas


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



