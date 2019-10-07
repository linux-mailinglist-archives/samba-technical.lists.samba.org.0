Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C76CE18B
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 14:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=LXzdsrgNJu9tLPSW8IvsnVV56IvteVnQ1vafW2izm8s=; b=uMgocPPSbCR7FO152owJizcSv9
	ObO4ZhREVQ3baNrsAU8oS9FeD6y/m62i5+rA5qfnSW+DECLwwQwthuD1CH3KU03k2ZSe3YaQkC37L
	YhoqDEfOhm5UqraNoqTrzHLHPcLt1wgPmmcuwzOvS82UvwiwjliiD3sTnSRcJ/wnUIRHwVRmJHJfR
	OvesuJwO4ZW2rA8nUOmFAmiSNnQgp19sJ3gYwTeyQ2GAfjk1dBMSrwD4uu/AR6NiiZU1tzBKdIUpv
	yqr4H8dfaCYGMA1rQ5Jp5bh0bohoiuXN2QuIS987Dcaq9hYWdNURjjko2tP5i9NHdQyvGWvSj9YqU
	jUEwHZLA==;
Received: from localhost ([::1]:49380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHS3K-001pCO-EQ; Mon, 07 Oct 2019 12:23:50 +0000
Received: from [185.16.48.59] (port=57748 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iHS3G-001pCG-BI
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 12:23:48 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 8557140212;
 Mon,  7 Oct 2019 14:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1570451023; bh=w3sBXykJHyLMgGpbirnmAAqkbrxej5/dLO89RabF0go=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To;
 b=oft2Vka/oayH0XFi9Tl7Wkthx3JStMv1xzPJTkZgk+cGGNMZBZnrnrBWOSjzVtoNe
 K0dj/69oVDVgkVpc40IHmY0qhC1D5G8X2XdWUMyCzWtHlSup35YHTRmln5VyFZvaSM
 i7/qc3F8kZVsrSPlMETq4T9d9jKHGFdhGFdUjdwQ=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id E9115C8;
 Mon,  7 Oct 2019 14:23:47 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aA5iKVX1_pby; Mon,  7 Oct 2019 14:23:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 52CBB15C;
 Mon,  7 Oct 2019 14:23:47 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id f4XjBNUMqRyQ; Mon,  7 Oct 2019 14:23:47 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 31F9EC8;
 Mon,  7 Oct 2019 14:23:47 +0200 (CEST)
Subject: Re: samba 4.11 rpmbuild on CentOS7
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
 <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
 <5800371.XWyRSs5115@magrathea>
Message-ID: <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
Date: Mon, 7 Oct 2019 14:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5800371.XWyRSs5115@magrathea>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

Le 10/07/2019 =E0 12:56 PM, Andreas Schneider a =E9crit :
> On Monday, 7 October 2019 11:32:15 CEST Denis Cardon via samba-technica=
l
> wrote:
>> It is built against Heimdal kerberos. The samba.spec is taken from
>> Fedora (thanks G=FCnter and Andreas for doing all the hard work!) and
>> modified to switch from MIT to Heimdal. Actually the hard part for
>> building 4.11 on CentOS7 is the requirement gnutls>=3D3.4.7.
>
> Hi Denis!
>
>
> Samba 3.4.7 is only required for MIT Kerberos. If you build with Heimda=
l
> GnuTLS >=3D 3.2 is just fine. Just change the required version in the s=
pec file.
>
>
> With Samba 4.12, GnuTLS >=3D 3.4.7 will be required!
>
> https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/

Dear me! I misread the requirements and thought it was necessary from=20
4.11 onward, whatever Kerberos implementation was being used...

I should have taken more time reading thoroughly your blog post! The=20
good side is that I learned a few more things on rpm packaging...

I does make building 4.11 definitely much easier on CentOS7... And by=20
next year CentOS8, which ships gnutls 3.6.5, will get traction when the=20
new and shiny samba 4.12 will be released!

Thanks for the input!

Denis

>
>
> Best regards,
>
>
> 	Andreas
>

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=E9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

