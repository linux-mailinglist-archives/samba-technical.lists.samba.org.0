Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEFCDE40
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 11:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lgBEhm9zEEOSt1zOTLRwkdmbc2zQ7DbyGlUafr/BmtA=; b=g1v1cchFnLz7w6iXfgCcs+4/BJ
	rZvHZhfYiBaLp41v7fgPkz3rLU6DFqm4SD9504j3cHsfOSfFlvkavMLfbi/WwNkLleRvOoICa27Mq
	kBSxKzsdO28P1hqwRUZX81VMFSTYfcJkTMAN5Y0A3k5aG9A+izHZhzXuUby47oNUWpQtseB7Mg6Zg
	IPQaK6ZRiISeleaXg5XCDjcHnhoAWMrMSyEoIPpd2sdkw3Wq/Zk7MWMc13hQmUX8xq+YkGLiSYOOq
	lWwgzZ/xHNNS/CdPy7SWF8WvaZyL4CDriIvJsMUInweDOsJ2VPl2ctLHYKLsnS5dVMkpZzpffpk5/
	CEXPz0hg==;
Received: from localhost ([::1]:44800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHPNQ-001nEY-R7; Mon, 07 Oct 2019 09:32:24 +0000
Received: from [185.16.48.59] (port=57194 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iHPNM-001nEC-TE
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 09:32:23 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 05D6040476;
 Mon,  7 Oct 2019 11:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1570440737; bh=lgBEhm9zEEOSt1zOTLRwkdmbc2zQ7DbyGlUafr/BmtA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=FE1zKqDHr2RqBPC7hZMlUXNf1st7W+BpcKDPbhdF4D1uRG0KUqs5+VHWf+zzZoUsf
 cNqbz838jDX+IL03CItAvI/4po4seHTcDN9z94brcyLBlerc/g97CfvjL4coZkfcxL
 ZEbCTX76KNdAyr33lYUCILadmVTcS6tSIEm75eT8=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 5CA08128;
 Mon,  7 Oct 2019 11:32:21 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OYU2Lfgue0GT; Mon,  7 Oct 2019 11:32:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id B656C15C;
 Mon,  7 Oct 2019 11:32:20 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qoBLccv_Zuie; Mon,  7 Oct 2019 11:32:20 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 9630C128;
 Mon,  7 Oct 2019 11:32:20 +0200 (CEST)
Subject: Re: samba 4.11 rpmbuild on CentOS7
To: Dario Lesca <d.lesca@solinos.it>, samba-technical@lists.samba.org
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
Message-ID: <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
Date: Mon, 7 Oct 2019 11:32:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Dario,

Le 10/07/2019 =C3=A0 11:03 AM, Dario Lesca via samba-technical a =C3=A9cr=
it :
> Il giorno dom, 06/10/2019 alle 23.59 +0200, Denis Cardon via samba-
> technical ha scritto:
>> I have given a look tonight at building rpm of Samba 4.11 for
>> CentOS7[1].
>
> Have you build it with MIT or Heimdal Kerberos?
>
> If you have build with MIT there is (yet) this problem
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1748860

It is built against Heimdal kerberos. The samba.spec is taken from=20
Fedora (thanks G=C3=BCnter and Andreas for doing all the hard work!) and=20
modified to switch from MIT to Heimdal. Actually the hard part for=20
building 4.11 on CentOS7 is the requirement gnutls>=3D3.4.7.

By the way, if you want to rebuild the srcrpm, for gnutls you'll have to=20
add --without guile --without dane --without cxx (otherwise there are=20
some conflicting filename with stock distro). And for rebuilding=20
samba.spec, you'll have to copy over=20
/usr/lib64/compat-gnutls34/pkgconfig/gnutls.pc and=20
/usr/lib64/compat-nettle32/pkgconfig/nettle.pc over to=20
/usr/lib64/pkgconfig/ as I was unable to get PKG_CONFIG_PATH being taken=20
by the build scripts...

Cheers,

Denis

PS : Note : those rpm are not yet field tested and not deemed production=20
ready, I just built a simple test domain to validate basic functionnality=
.

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

