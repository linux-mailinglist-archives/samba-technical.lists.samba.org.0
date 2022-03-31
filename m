Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F24ED4BD
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 09:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oLbxBGMr3xraTyZX+GTJ9toAFvr077bDIZ2bUaHGBLI=; b=CXkiiTNQLUvcMwulZgm7fkwXbl
	/+nV5F8jgKU5h7IpAMRylXRf/H/HccfdTRAyO4NxeSdHCR0kdPKMfdWC1IXORUGL/fWpJcEncmcuh
	0YXn+CMxZElVCnTRHrz47a2tguW1RS82gFGowomN1KX30Y0xncOeLUI7IbOybBAdCgQ6Q0L4MuYnH
	t7PeJycM+1e1s5JPz0q5mtqBpg7QatjEBCMVqWg99osdL+yZoQAT/8fxeSF1HOZEu5boe6wUrTmvb
	jo1a5BKYS0bCexa2SM1TjgNiKLkJO9GQ0+2SzZcI26fnVCog3zBWqS+SGqFBA2z2ttpZGJBeWibvA
	V38rGUBQ==;
Received: from ip6-localhost ([::1]:24430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZp7A-0070Yb-0a; Thu, 31 Mar 2022 07:21:04 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:39405) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZp6p-0070YR-1h
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 07:20:45 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E97A0405CA;
 Thu, 31 Mar 2022 10:20:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3EEE22A;
 Thu, 31 Mar 2022 10:16:54 +0300 (MSK)
Message-ID: <0b722396-825a-f219-efb5-c40c22b8c6a0@msgid.tls.msk.ru>
Date: Thu, 31 Mar 2022 10:20:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf install recompiles another 4k files after waf build built its
 own 4k?
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
 <9c5e5f7d-7f5c-3401-85aa-dbfee917b807@msgid.tls.msk.ru>
 <e5e12efd-24d3-203b-d5fe-576c90fa5ddf@samba.org>
In-Reply-To: <e5e12efd-24d3-203b-d5fe-576c90fa5ddf@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

31.03.2022 02:47, Stefan Metzmacher wrote:
[..]
> Please stop using waf directly!

I don't.  At least not without setting PYTHONHASHSEED :)
(which I learned the hard way).

> Just use './configure' and 'make -j install'.

This fails. Because compile_et and asn1_compile
dependencies are not listed for all the install-related
targets (but are properly listed for build-related).
I ended up with:

         $(WAF) --targets=compile_et,asn1_compile
         $(WAF) install

This works. And this is where the usage of the
Makefile wrapper becomes quite ugly at least.

For an automated build procedure this is enough, tho
it would be better if the missing deps were in place.

Unfortunately I weren't able to figure out how to
fix the dependency prob.

Thanks,

/mjt

