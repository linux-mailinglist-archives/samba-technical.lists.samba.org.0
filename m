Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F8BFBBC
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 01:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vEmco+MKmFRd7ES89fGq6iZeHL2AEvUQAw4p7bRBnU0=; b=2SlNdCUzZCeN/omAoM4w8gXDis
	Nm5I46QN1ACI/vMfle6SqL2TwS3E4biDDHRqaMUtcbsMsAUkFfoa2f4xf1Cbpw5WCNZ3np2GWOvJm
	XYQEArWLDFm5zq78/zDjGeqLfezpGO2BpxCvv4OgKOm6upNVRZFUJEO5oJQOFpMUv+6bB1mABA+q8
	Y64AW3wgmoSi8ry6hrhhEJwP28d4Hvi2Xtr2qmQO1Raxry6AEpLdn+pv/WBcWZJhTAvguqpWKFGzh
	uswDNbVUYyZ/GxtfOolz/Cw9NDqdOR8iPvuIYEcVvWYc/NMnNect2jwiZ0llBwz+8oa19MKzmzZkQ
	oCUNQjFg==;
Received: from localhost ([::1]:22722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDd0E-008zcA-O0; Thu, 26 Sep 2019 23:16:50 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48693 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDd09-008zc2-Ca
 for samba-technical@lists.samba.org; Thu, 26 Sep 2019 23:16:48 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46fW5b3tHrz9sP3;
 Fri, 27 Sep 2019 09:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1569539795; bh=S5bmkLewFPv6o02AHYACuaoqthx/CQa128IhpIbqzRM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EqZWZEpu8EIpJtTL+jRtu+UQOGsfJCxDQzKwMSo4YRbQ+ZwveMLZ2M2NZpWYp7tD3
 0YACsWdVaWjdAMQkaUVJZi9rF9jSVJ7T5Gmrkj+a3EN4AOeQQdDSqXDSv2xpVzw4ho
 OGSauOgUell0NMP3kUvnFQVgtVydfH/Q12k/i3VJHntHFUFh1MMlq9Cxn1MNLjnP7I
 zegqu7imaxMp3wiOu+QW9UgPNteZNvIgkHWfBrNXrPcKmRRvr+Dtdh/6qtpUFGslQm
 ocbyZdl0B9W52c1jMx+dTetnb7A1eehD76Gphgdbo/fe1TGYsSVMrYmhJt7u5zP4vf
 JP8n0YYuX4OyQ==
Date: Fri, 27 Sep 2019 09:16:34 +1000
To: Max DiOrio <Max.DiOrio@ieeeglobalspec.com>
Subject: Re: CTDB Assigned IP not on an interface
Message-ID: <20190927091634.5adcce10@martins.ozlabs.org>
In-Reply-To: <F637268B-A385-4A24-92A4-7CAB5754CCC1@ieeeglobalspec.com>
References: <848DA573-7DDC-4B8B-BECE-A0C5B15E704F@ieeeglobalspec.com>
 <F637268B-A385-4A24-92A4-7CAB5754CCC1@ieeeglobalspec.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Max,

On Thu, 26 Sep 2019 19:04:31 +0000, Max DiOrio via samba-technical
<samba-technical@lists.samba.org> wrote:

> Additional info - when running an strace on the process:
>=20
> epoll_wait(11, [{EPOLLIN, {u32=3D2179214400, u64=3D94542999333952}}], 1, =
114) =3D 1
> ioctl(24, FIONREAD, [96])               =3D 0
> read(24, "`\0\0\0BDTC\1\0\0\0\352k\35w\7\0\0\0\0\0\0\0\2\0\0\0W\24\1\0"..=
., 96) =3D 96
> stat("/etc/localtime", {st_mode=3DS_IFREG|0644, st_size=3D3519, ...}) =3D=
 0
> write(5, "2019/09/26 14:59:36.055468 ctdbd"..., 130) =3D 130
> socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) =3D 25
> bind(25, {sa_family=3DAF_INET, sin_port=3Dhtons(0), sin_addr=3Dinet_addr(=
"10.85.136.108")}, 16) =3D -1 EADDRNOTAVAIL (Cannot assign requested addres=
s)
> close(25)                               =3D 0
> stat("/etc/localtime", {st_mode=3DS_IFREG|0644, st_size=3D3519, ...}) =3D=
 0
> write(5, "2019/09/26 14:59:36.055731 ctdbd"..., 118) =3D 118
> stat("/etc/localtime", {st_mode=3DS_IFREG|0644, st_size=3D3519, ...}) =3D=
 0
> write(5, "2019/09/26 14:59:36.055848 ctdbd"..., 153) =3D 153
> write(21, "0\0\0\0BDTC\1\0\0\0\352k\35w\10\0\0\0\2\0\0\0\0\0\0\0W\24\1\0"=
..., 48) =3D 48

Not sure what process you're running strace on here.  A higher
value for -s might have give enough context in the log messages
being written in that snippet.

However, I think I can guess the answer... see below...

> =EF=BB=BFOn 9/26/19, 1:00 PM, "samba-technical on behalf of Max DiOrio vi=
a samba-technical" <samba-technical-bounces@lists.samba.org on behalf of sa=
mba-technical@lists.samba.org> wrote:

>     CTDB has been working great for us the last few weeks.  Today, I
> did a yum update =E2=80=93 and now things aren=E2=80=99t working.  The pu=
blic IP
> assigned is not actually being added to the interface, but CTDB
> claims the nodes are healthy.

> [...]

>     Currently running ctdb.x86_64    4.9.1-6.el7. on Centos 7.7.1908

I'm guessing that this was an upgrade to 4.9 from a previous version.
In 4.9 CTDB's configuration changed a lot and so did the event script
handling.

Try running:

# ctdb event script list legacy

See if 10.interface is listed and has a '*' next to it to indicate
whether it is enabled.  If it is listed but it is not enabled then:

# ctdb event script enable legacy 10.interface

will enable it.

You may want to check that all the event scripts you use are enabled as
expected.

There is an example configuration migration script
(config_migrate.sh) with CTDB in version 4.9.  It is pretty good but we
left it as an example because we didn't want to drown in bugs that
might be present in the script.  I don't know if CentOS 7 ships it.  If
not, you can get it at:

  https://git.samba.org/?p=3Dsamba.git;a=3Dblob_plain;f=3Dctdb/doc/examples=
/config_migrate.sh;hb=3Drefs/heads/v4-9-stable

If I haven't guessed right then please post your config (ctdb.conf,
nodes file, public addresses file) and the output of:

# ctdb event script list legacy

If none of this works, since you seem to be awake now, you could jump
on the #ctdb IRC channel on Freenode and look for me there.  I'll be in
and out for the next couple of hours.

Thanks...

peace & happiness,
martin

p.s. As a user level question, this would have been more appropriate on
     the "samba" list, rather than samba-technical.   :-)

