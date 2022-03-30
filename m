Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FC4ECC4C
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 20:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DR78I6Sgy3sJ//oUol2GhAFRCaJWyrQM00EB1s5TMSU=; b=R3DO9j1DjylGdIxK5Q3JrPYEzP
	3MyJTQUjX5BIrU6gDLGwUboqF9gPrUOrR3TFaVA225KwYQwhhYr3eh2d+lZXXbumNCFLeV+aL70ut
	c96hwY+bi9nbbXfMNdvoNnMK6PCPhXBV7lTrwqzndjjgGSAOFEX0sXMChHAhRSmxpUCOFf1gB5BeF
	bPh9t1cni5HJwvMDPUZ+y+jj5m8JIhLQs22Gi12jStK8z9bA3AXm0h82768PpYlYy+5S1mhkunhbZ
	aqBNC92IWA9WmFCFismVPrVIes07Xq27UJ+GNEfYV4h8jw4xwVffQadv3rS3ytQP7+R52zc9F2TZP
	euuNh96A==;
Received: from ip6-localhost ([::1]:19980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZd52-006vOY-98; Wed, 30 Mar 2022 18:30:04 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:37599) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZd4x-006vOP-W1
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 18:30:02 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 11DE940A3F
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 21:29:58 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 461F42A
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 21:26:11 +0300 (MSK)
Message-ID: <870e5702-c601-cd9d-30f1-02c8e1bae3ea@msgid.tls.msk.ru>
Date: Wed, 30 Mar 2022 21:29:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf install recompiles another 4k files after waf build built its
 own 4k?
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
In-Reply-To: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
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

30.03.2022 21:22, Michael Tokarev via samba-technical пишет:
> Hi!
> 
> Here's one more issue with the build process of 4.16.
> The context is - I'm packaging 4.16 for Debian.
> We fixed the missing PYTHONHASHSEED=1 for waf already,
> but it didn't help with the recompilation.
> 
> I noticed that `waf install' compiles a whole lot of files
> after `waf build' finished already. Most of them are recompiled, -
> for example, the dynconfig.c file (it is the first such
> file), and many other files from all over the places.
> I can't say they _all_ are recompiles or not, maybe some
> of them are new.
> 
> Some of the linking calls definitely are new, for these 3:
> 
>   Linking bin/default/third_party/heimdal_build/compile_et.inst
>   Linking bin/default/third_party/heimdal_build/asn1_compile.inst
>   Linking bin/default/lib/replace/libreplace-samba4.inst.so
> 
> (these are linked at the install time _only_).
> 
> Why the build system might decide it needs to recompile right
> to everything during the install stage?
> 
> The 2 waf invocations (for build & install) are the same.

This is not true. `waf build' is run as a regular user, while
`waf install' is run as root, - that's the only notable difference.
The environment is the same.  Might this be the issue?

/mjt

