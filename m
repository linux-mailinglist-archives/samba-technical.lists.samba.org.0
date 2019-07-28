Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351077E8E
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jul 2019 10:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=m1VyCfAGFgGp+Ci9miR8pa4uUOkyvwVj6HNUlHTrGe4=; b=kZF50XVojtkl2tz0Os5THwu6s4
	5RC4ozZ2Rt+jUNbGmjDwTLfbMjk7E7BZ0J36q9eUdIhNGAm7+C9hbeSPSMUVnENDQAamXm1MVg2k1
	+TDJotzABYlvI/7udhZ5zRdFUp/UXZHxoChoemnz7a1xrfSFihZHxNeSwEn56brZo25jrRQIZuNa4
	Mms/a5IMNrh4nFgOfedryaem0rh7VacXQf4vyeNb+Br7enq6pm0wiXuBwYAovit8fpVwtSZSfqdjb
	aKLD5p2AlVG6NjbpGS23L7QYz3TlfG/JvK/AGGlO2aBp3vI2fjuNhy3C7p/XEign0XmNklexzfAAx
	TWvY+GhQ==;
Received: from localhost ([::1]:60044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hrePb-000cFK-Fb; Sun, 28 Jul 2019 08:20:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hrePW-000cFD-7E
 for samba-technical@lists.samba.org; Sun, 28 Jul 2019 08:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=m1VyCfAGFgGp+Ci9miR8pa4uUOkyvwVj6HNUlHTrGe4=; b=rcvy2+a55oi6hS+x5U8nf7yFLW
 PnFXZQGFt3JAP7XaavJnIEtFVIUMvMQrPSVh0pmlCTfED0nhEGIaMOpEe6ty7uDZz6C0GOpoLC/na
 GTbRvFwysWPhxvamZCD0yvx1CDpVaG//q/LmiCgj6ca+t3lUe1ZZr53C+qmmCcMKHBYI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hrePU-0005sh-SK
 for samba-technical@lists.samba.org; Sun, 28 Jul 2019 08:20:05 +0000
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: samba-technical@lists.samba.org
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <cecb5641-2d82-b548-da2c-7f39979dff44@smedley.id.au>
Message-ID: <56834227-1234-b981-ab43-28da12c08039@samba.org>
Date: Sun, 28 Jul 2019 09:20:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cecb5641-2d82-b548-da2c-7f39979dff44@smedley.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 28/07/2019 00:21, Paul Smedley via samba-technical wrote:
> Hey Andrew,
>
> On 26/7/19 4:57 am, Andrew Bartlett via samba-technical wrote:
>> I'm more thinking about the DOS users, the OS/2 users and the Windows
>> 3.11 users.
>
> OS/2 users now have a Samba client based on the latest 4.x code - it's 
> included in ArcaOS (https://www.arcanoae.com/)
>
> Cheers,
>
> Paul
>
Well, that takes care of the only one of the three that could actually 
network correctly ;-)

DOS is a single user system and knew nothing of networking (well the PC 
XT system I had, didn't)

Windows 3.11 was plonked on top of DOS and was pretty much the same, it 
wasn't until Windows 3.11 for workgroups came out that you needed a 
network card.

Lets be honest, these operating systems are now historic and should be 
treated as such. Having to write new code whilst ensuring that you are 
not breaking the old systems must be difficult and will, undoubtedly, 
produce suboptimal code.

There is nothing stopping people running old operating systems from also 
using old versions of Samba, they presumably accept the risks involved 
in running old OSs, so will be willing to accept the risks involved in 
using old versions of Samba.

Rowland


