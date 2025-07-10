Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9722B005E1
	for <lists+samba-technical@lfdr.de>; Thu, 10 Jul 2025 16:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iFYp9sXVDebNQoIv3CW9AI5VMrtEuh++pKQobgwv1aA=; b=CwiHXkoKynyFlpDQtiBEEw/58S
	As3A8h3SY3eKGAYvX/Gt28c459OH7cGEwVs/Z2UGKNiOb1JS/asrEHn3sqVE6d5fe1XuJZdl0R0u/
	sMJbXREtua/lCoayBTaEc1ojj8DnLWc6o1fmRxfQIjhbx+OtOXrPvWurhNtAPpp3Fty4aLbot75BT
	V6s5417FRHz5BTS+90oPgFirPtIMFgZJbhu0sPNp58fbKksZ1tlRqstvELHOLG9KmhWA1P6lxeaOF
	T8nYC4CyxLoe1PTphzgpfvPlpL4meJW05Kr8BAK6TpDs/Duahcz803L8xRuz7VMdhgVg4Vy9ggpgY
	aArOseZA==;
Received: from ip6-localhost ([::1]:55838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uZskW-00AwSE-W5; Thu, 10 Jul 2025 14:59:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65064) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZskS-00AwS7-Er
 for samba-technical@lists.samba.org; Thu, 10 Jul 2025 14:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iFYp9sXVDebNQoIv3CW9AI5VMrtEuh++pKQobgwv1aA=; b=EkG/E/S/CS/L4m7k71ReUMg/vX
 dQZTkqlRelYayTXbiLKlHzgLbeDqKqWiSnTExr2jquisy7fCSPGWBOla2n/e4EXV249msfuGCVKuO
 +A6nGlfzpvOCzVMWeztkqgTDHBIpsVcCIm6ByUVY3d4d9iVaFXBWy4og88fTgkCjGOa2yoT7OK+HV
 kM5tgss8wMa8ohGq8ymFVwNyxuzSm+0xnHI3GRw06h5nJEtdWDOJz2IP3dNq3rjv7l9475KC/xGVy
 D67qCzwgQlYS2uR0Iv6Pv7NxwaieRUwBYc1ceZ74nuS9gfzheBsJXUwa4MxpkZYFjc8h+oEqJR1Ue
 VutW/3Dydvm1HW4t6cCPjh++QArrnKbiVIgN/FJe5kYv9CEGKzX16HMA4Wd92CiGUlxXZfGp5+RAU
 7W7QEF1P5IDTVbnaDhZa+69IdWMiAw52j3GmuMURdHj2t8kh8KnXMnYNo54Pp52Gin3+X8axyxvpS
 WI8AyzBlQ/vyrUw+CYsLbAe/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZskR-00EofJ-1O; Thu, 10 Jul 2025 14:59:43 +0000
Date: Thu, 10 Jul 2025 17:59:40 +0300
To: Steve French <smfrench@gmail.com>
Subject: Re: out of date man pages
Message-ID: <aG/VXM1ajVk5dLRN@toolbx>
References: <CAH2r5ms7pSZaPEwTYUh17+be5xCrLfSuP1WNaADaxnfCBC8yTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5ms7pSZaPEwTYUh17+be5xCrLfSuP1WNaADaxnfCBC8yTw@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Jelmer Vernooij <jelmer@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Bharath SM <bharathsm.hsk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Чцв, 10 ліп 2025, Steve French via samba-technical wrote:
> How do we update the VERY out of date man page on samba.org
> (https://www.samba.org/~ab/output/htmldocs/manpages-3/mount.cifs.8.html)
> which looks like it is many years out of date?

This is not even a page you should be looking into. :)

https://www.samba.org/samba/docs/man/ is the link. It contains current
pages rendered from git master and each release.

We do not have mount.cifs(8) as a part of Samba man pages anymore, for
very long time. It is part of cifs-utils and cifs-utils is not published
on samba.org.


-- 
/ Alexander Bokovoy

