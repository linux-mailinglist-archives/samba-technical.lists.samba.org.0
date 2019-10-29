Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D67E8DED
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 18:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5h9uyqoh2/TblTkNBHMcqqAqXRq/eeo+Z9UXA9PLVWs=; b=j11CX6nUqWd1koUJjmsMDvX4hd
	romtLWTmu3fstkEUQaFyfFuRnArGc6kBME+aNOQwlWYTW5GyapB+oxmsd58ukW4kWz0PS1l8CIgyE
	icnj73HVxQ/1qJ7sNo5ZY8/vxxpo3x4qFiOgZgaJWudepCvvPzTpiOX5H7Lxj6WQEJY9ytGnpLlRR
	CNsu74vmVUaHq0mv6hdkaTnTJG2c9ZBSLw/iGtoTUbDWHJGmE+BJ2yyv+BKGH4D5j5ynBlRknQD1F
	oLmLkAtc7H4Kob64hhMHUZ2U7YMLdkJ1+3DSzMPrTLtYd4AV1M2R/uocRWm2eSEGL5anQaGt0d6ie
	evtgL6ew==;
Received: from localhost ([::1]:28782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPV8l-003L4H-Dg; Tue, 29 Oct 2019 17:18:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58832) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPV8h-003L4A-5n
 for samba-technical@lists.samba.org; Tue, 29 Oct 2019 17:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5h9uyqoh2/TblTkNBHMcqqAqXRq/eeo+Z9UXA9PLVWs=; b=eZmCrI/+s+U14X9jgjUgCdZcLj
 r87DnWpvQWwVPpfGBAmDo6KEklP0RW0JLgbjzPMS0mLvE+xyysDnaO5uS0C6TahSo/JqkxfiYEuko
 tJ+tqOHRuSLEQwFhL6ZRKXUO6Sc9ax17WssQ98Fmawo9cTqIpfFo9Z8sK4yJBm4ZVvVtLWLzYKDFQ
 y2Q7fvOZqfIT5D4tWcCdeGGX0b6BGSwl3ukrZfiOfWobv+gEt6BXhmb+Oipm8G55dqgLnu7G1Kh4v
 jw1bCQlK1bhyJuy7SjmxOnq9gmgUlXYpvXoYGxRt1FrnyfNjGPFnLoKcfmJBhnDmuvCF1UYBsmbf/
 +VKHUQchDOj0osw2iIGXWXTiOS0QfKoTdBbG+GjuB1X22eNjjOwX/NRgtbj/yWzu+bR9CzxiRM6dp
 zhwgJj5HzsiquyCoSR2FHh1fsNkpPHpZYPuWQLkJJ6WRY1m34tdGMXbwB/FBOWhBUghdrCdovH5zp
 YJEElzODHEeQ61hEr7tZV+7o;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iPV8g-0000k2-AP; Tue, 29 Oct 2019 17:18:38 +0000
Date: Tue, 29 Oct 2019 10:18:34 -0700
To: Uri Simchoni <uri@samba.org>
Subject: Re: Q: how to build with system Heimdal
Message-ID: <20191029171833.GA13244@samba.org>
References: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 25, 2019 at 12:33:33AM +0300, Uri Simchoni via samba-technical wrote:
> Hi,
> 
> How should I build Samba with system heimdal? Should this do the trick:
> ./configure --with-system-heimdalkrb5 --without-ad-dc
> make
> 
> (assuming I have Heimdal installed, of course)
> 
> I tried this one on master, configure succeeds and the build fails
> like so (kind of surprising that it tries building system heimdal):
> 
> waf: Entering directory `/home/vagrant/samba/bin/default'
>         Selected system Heimdal build
> [190/192] Compiling source4/heimdal/lib/vers/print_version.c
> 21:26:51 runner ['/usr/bin/gcc', '-D_SAMBA_BUILD_=4',
> '-DHAVE_CONFIG_H=1', '-MMD', '-D_GNU_SOURCE=1',
> '-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-fPIC',
> '-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT',
> '-fstack-protector-strong',
> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL',
> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void
> __HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)',
> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',
> '-Iinclude/public', '-I../../include/public', '-Isource4',
> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
> '-I../../source4/lib', '-Isource4/include',
> '-I../../source4/include', '-Iinclude', '-I../../include',
> '-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..',
> '../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/vagrant/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
> In file included from ../../source4/heimdal_build/roken.h:156:0,
>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error:
> roken-common.h: No such file or directory
>  #include <roken-common.h>
>           ^~~~~~~~~~~~~~~~
> compilation terminated.

This should work, but it broke back with Samba 4.10. The build works
with Samba 4.9. I am trying to bisect and debug this problem now.

Christof

