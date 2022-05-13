Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DF526277
	for <lists+samba-technical@lfdr.de>; Fri, 13 May 2022 14:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=03dLR5wZC7Jyc3oKjPzzViWz+8yC/jqhMEvmwwuhGfg=; b=H6TS2+uJ8lN9RLMXcilGisCq9+
	xUbfHVTBJwd1Nd+Xo0DIvsa5CrGp2T4aa6SOSz0aJTq0nqxPnPzvv+Sv+6yHtcWlHpmv31WzY1SEP
	H+VZQiJjF8TbfTNcJpYeALiy8gvdGEQR1tvb5DhzVdq7NhPst2yqAqAWjZfw6R8/prBQ18YO0Y1qp
	jQ2V7biQPjvIM5l+yBTB7yfrn5IAuAGn/A+Q8DkGrprS+9priFrUm4TYYSW+yWEr9CgkzJ63LFBZo
	ZCIDzPydQ4wl/2CgKg3H8ESN6EYeWDn2v0PiuriKDHLFABeP0yIud2ZueuoNkZDJJHo1qmUehXYHJ
	icAnRCrQ==;
Received: from ip6-localhost ([::1]:55808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1npUrM-001F7H-0b; Fri, 13 May 2022 12:57:32 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49703) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1npUrH-001F78-3y
 for samba-technical@lists.samba.org; Fri, 13 May 2022 12:57:29 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9DB11409E2
 for <samba-technical@lists.samba.org>; Fri, 13 May 2022 15:57:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B639612D
 for <samba-technical@lists.samba.org>; Fri, 13 May 2022 15:57:23 +0300 (MSK)
Message-ID: <0838052e-1c59-d360-dbe7-47420d197731@msgid.tls.msk.ru>
Date: Fri, 13 May 2022 15:57:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
In-Reply-To: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

13.05.2022 12:35, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> In debian we've got a bugreport about one of the samba libraries missing RUNPATH
> to the private library directory (where libreplace-sambae.so libsmbd-shim-samba4.so
> etc are located.  This one is libsmbldap.so.2.1.0. And indeed, unlike all other
> libs and executables, this one lacks RUNPATH section, while all other binaries
> does have it.

When building and installing, it looks like all other binaries are linked twice:
once with regular names, like bin/default/source3/libnetapi.so*, and also with .inst,
like bin/default/source3/libnetapi.inst.so*.

But libsmbldap.so* is linked only once, - there's no .inst suffix for it.

But I don't see a difference between the two declarations in wscript.build, both
seems to be using similar bld.SAMBA3_LIBRARY() constructs.

There are a few other files like this, with missing RUNPATH and without .inst
link, but these are private:

  /usr/lib/x86_64-linux-gnu/samba/libads-samba4.so.0
  /usr/lib/x86_64-linux-gnu/samba/libnet-keytab-samba4.so.0
  /usr/lib/x86_64-linux-gnu/samba/libsamba-modules-samba4.so.0
  /usr/lib/x86_64-linux-gnu/samba/libsmbldaphelper-samba4.so.0

I still can't figure out how it all is being built...

For me, a "fix" would be to manually add the missing RUNPATH with patchelf
or chrpath, but this is.. a very hackish temporary bandaid.

Thanks,

/mjt

