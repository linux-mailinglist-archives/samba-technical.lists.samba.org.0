Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B06E0B3E
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 20:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zOJaRLJmIWZe8YAa4RR0CZ93w117R9C1SS5BelvP3Sw=; b=Be2F3sqKvKOYhahNiD3l0GxVxS
	fQmIrZD7ZNJgfR0m8oT52Gv4IzRzNC6RRn2pksTbW8gWiwPfOwD/UkHI+s5LzL+yWDzEL/G0bn2fM
	gZqLC+UagCGd1nQbQ6yclGTm1sHZz0lccGo99z/scUPPSawi/4Wg08Lhnhjllss2mTBdjOBHQrq2l
	DPYwmsBbLEhkfpinlLyJhpcGNUEOFvx4REYkS+PwHGlFXU8fSwEZI3ZgxTUEwh8oeP49mNR98xfZ8
	PyhQyrP5b/ylXoGaa6b8XgykvUj7LnnEWIw8zLxV2GYXqlPdvn51qXpKr+CLA2Hox4pbU3u4lc9H6
	21b+JVwg==;
Received: from localhost ([::1]:58208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMyfO-001W6W-Nw; Tue, 22 Oct 2019 18:13:58 +0000
Received: from [185.16.48.59] (port=60722 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iMyfK-001W6P-AA
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 18:13:56 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id B4AA740293;
 Tue, 22 Oct 2019 20:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1571768031; bh=zOJaRLJmIWZe8YAa4RR0CZ93w117R9C1SS5BelvP3Sw=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=nIXELrrl845m3ehx5G9Hy++xzOPvdu+3JWYNwANJENF00KryaTZXNOSM8NNfWwJ/+
 7hVa+HeT3jE9rXE4VWbHpM6R5r3VMC3fFwauAEJZeKjaBd3QP0Xpu4L75/y/r5AFZy
 j6pnp+qgUW/uK4R0lpKGbabbbLMLleA/84NOFyxg=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id D853B13;
 Tue, 22 Oct 2019 20:13:51 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WIQq86JW6JnO; Tue, 22 Oct 2019 20:13:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 3D1D116;
 Tue, 22 Oct 2019 20:13:51 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4r2FEniZgUte; Tue, 22 Oct 2019 20:13:51 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 21EAC13;
 Tue, 22 Oct 2019 20:13:51 +0200 (CEST)
Subject: Re: [Release Planning 4.11] Samba 4.11.2
To: Dario Lesca <d.lesca@solinos.it>, samba-technical@lists.samba.org
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
 <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
Message-ID: <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
Date: Tue, 22 Oct 2019 20:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
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

Le 10/22/2019 =C3=A0 12:17 PM, Dario Lesca via samba-technical a =C3=A9cr=
it :
> Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> samba-technical ha scritto:
>> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
>> andFedora setup at https://github.com/nkadel/samba4repo. This setup
>> usesHeimdal Kerberos, which eased the gnutls requirements and made
>> CentOS7 easier.
>
> Thanks Nico
> How can use your great work?
> I must rebuild all on my system (Centos8) or I can use a binary repo?

I just published RPMS and SRPMS at=20
https://samba.tranquil.it/centos7/samba-4.11.1/=20
https://samba.tranquil.it/centos7/samba-4.11.1-srcrpm (note : freshly=20
baked from the oven, not yet thoroughly tested). You may try to rebuild=20
the srcrpm on CentOS8. I've not yet had time to look at that new CentOS=20
release.

Cheers,

Denis

>
> Thank
>
>

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

