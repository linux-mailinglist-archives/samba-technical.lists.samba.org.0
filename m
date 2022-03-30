Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB04ED063
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 01:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mD5DVoBzb+dYhziLJoYcWSMLrusH9gqI3bXsx/T/gJU=; b=X7+qKRBLwJl/oIKq83DV8T+06G
	Vb6cVgB0K7kmAdPdxk52oUGrfsrLqycAspLY2veSCT3aJ3HRhIB3enMf4xcuNDe8dkKbwjGGpdjLb
	OzWKr3WytpMcZ1J19/2xpNEHjCEgPY0zI7Geh1cwSAjL0JfsTuW0eeKA8mYgIOjS6vojG4JLf9lqC
	G2RZv1x7KH9sEL/PVl/djcOCz9uzkvifhmRrSnZS+oraQrVwgVkdXjFgZAoDzKAF6SgSlTIuHGtGd
	WgBwP0Q+LWh4UxVWL1nWMHuIuVOXkZSE1rnkMzZvBhJoWhvMfRIjNko4miqMhD2SpzRXa8JUaNbIK
	rhCqp6TA==;
Received: from ip6-localhost ([::1]:23310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZi2b-006y3R-Qu; Wed, 30 Mar 2022 23:47:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38050) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZi2X-006y3I-SE
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 23:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mD5DVoBzb+dYhziLJoYcWSMLrusH9gqI3bXsx/T/gJU=; b=YQf44xjSmAf1axNRYZKjxYbpFF
 fgdt+SCUqMHvXm59vJY/LGk5qnit1wrHGsEjvNlQ7fKadr6lPO7BIhWQPEKKPmw5GTsZJRnzOlHn4
 c4t8vIZuosKmGMGd1ORnKa2M+R8O2+Q1aRSUyB0MMTy/qyscZMbiNE+M59HWQnHBBVNuruLppgfW/
 xIfT8XacONAaN01KeooiJtYNyojge6Pifs7mYoI3l/F8WwAZTeJy2RQrF8L3m1WAvRnxvwpYpRtQQ
 jZ/k4AzF0YLylN/OUi76ar753Z4eEEBMEYr7NokQ9NOz33GIDOVZyrPSL8OShEd2ompyz40hLG6IX
 9QGfU2GBfmeLEWr8kZTxo1fSirAuWIl5bt/5oFyNiF0dZsJxy0C4qCFzGz/2NgBShdniBVSW2o1I8
 n8Y4yNHxe/Lce9XSQqarO5CiGY7NU5y/8R0Yz3oroUh7KSqau/OtSvCnGtNO4RS3nw9fQXSyqhfsf
 doe+JNwa7sjOr5vpvz5uIKy+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZi2W-004UQS-Rm; Wed, 30 Mar 2022 23:47:48 +0000
Message-ID: <e5e12efd-24d3-203b-d5fe-576c90fa5ddf@samba.org>
Date: Thu, 31 Mar 2022 01:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf install recompiles another 4k files after waf build built its
 own 4k?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
 <9c5e5f7d-7f5c-3401-85aa-dbfee917b807@msgid.tls.msk.ru>
In-Reply-To: <9c5e5f7d-7f5c-3401-85aa-dbfee917b807@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 30.03.22 um 22:28 schrieb Michael Tokarev via samba-technical:
> 30.03.2022 21:22, Michael Tokarev via samba-technical wrote:
>> Hi!
>>
>> Here's one more issue with the build process of 4.16.
>> The context is - I'm packaging 4.16 for Debian.
>> We fixed the missing PYTHONHASHSEED=1 for waf already,
>> but it didn't help with the recompilation.
>>
>> I noticed that `waf install' compiles a whole lot of files
>> after `waf build' finished already. Most of them are recompiled, -
>> for example, the dynconfig.c file (it is the first such
>> file), and many other files from all over the places.
>> I can't say they _all_ are recompiles or not, maybe some
>> of them are new.
> 
> As Andrew Barlett wrote, the build system is designed to
> build samba runnable from the build tree by default, and
> the install step makes it recompile quite some stuff and
> relink almost everything.  So this solves the recompilation
> mystery for me.
> 
> Ideally it'd be good to have some 'build-for-install'
> target which builds everything needed for install.
> No such target is mentioned in `waf --help', so I used
> `waf install' instead of `waf build' to perform just
> the production build step. It makes extra file copying
> but it is better than recompiling/relinking.

Please stop using waf directly!

Just use './configure' and 'make -j install'.

metze


