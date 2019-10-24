Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2481E3E3E
	for <lists+samba-technical@lfdr.de>; Thu, 24 Oct 2019 23:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=oh5PdYBXOj4qEoerDRaR5xwt4Vo9oV9pnMoE6mxYL4o=; b=4Xd34GT+dlMazznL5oxyjgf/rJ
	o86Spb6bVue4n2UNeixUcwpBslnS8ZfhDNFnDfTlGwbfCGr0mzdPnI0L6oy1p/Ov+Wgp1Psyfhgwa
	PrSdoNweywfDfX7olWSAZHQokXPfeCfPqoOxz061QuTHdLjQayXpk4hCTzOnQptndM8T4zbdIWzvg
	12STXWpkzZv0pa/yluqNO5W+8365S5GJmIeXh5SR8PoDh/+AmNWP1dbi2MBbhZ5bBCVa2VNOACDFa
	j/TK5Z/KYpaUR+o+yaznSUi/k/Y8PaZxmNR1d+ThTeBvHhH7GwQayR3L3JxyOIqYgJ2d4+GwP4ejd
	eG8in7WQ==;
Received: from localhost ([::1]:54932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNkjj-001yOO-SB; Thu, 24 Oct 2019 21:33:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNkjf-001yOH-GZ
 for samba-technical@lists.samba.org; Thu, 24 Oct 2019 21:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=oh5PdYBXOj4qEoerDRaR5xwt4Vo9oV9pnMoE6mxYL4o=; b=3ahdL13IjnmqC8QIQEytoW/lJW
 1Nw/bamNEENj8+/i/6O18wrf3/g1/j08HqUCVHPosiLeEpl7KoJPfLOcXsHx8WO9avRtCG73bxlT0
 LLdpsxGZkI0dV/atu/XKX9qOm4NHNXWPD+l4eOtAe09BFN//Vr5us+uY07+k46jDObdH5ZmhkTBvS
 7a0lqDayAYwQGeKldBQDYh+M/RmxiwH9n+OSKuwvna4O0eS/QUeddXFruLGaeMuWC4tozmlc++4HA
 3s1Sk5koIEN/qKhqsgj125oYXXx/xnqbidvsS6SJCJ3V3E4iJssRwUCvRN5lwvlc8CfSPaQYqI/y5
 WSUe0zOENc0wAlyBV9dasYwn+0ubdWihECFBzpOb5p/sE4LMyI40ESfGVYFX4F8Uumlh0dBT3CCxO
 DR9ZBcuJVIRUBWM5031d+GvpUuMSC/zLL9/R81R4o+6s9mWptr77HINqxE2WIDaHiCHJZIya9I7WI
 txW6UNTGqBMtGcOsK78WW2KP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNkje-0003Qs-U9
 for samba-technical@lists.samba.org; Thu, 24 Oct 2019 21:33:35 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Q: how to build with system Heimdal
Message-ID: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
Date: Fri, 25 Oct 2019 00:33:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

How should I build Samba with system heimdal? Should this do the trick:
./configure --with-system-heimdalkrb5 --without-ad-dc
make

(assuming I have Heimdal installed, of course)

I tried this one on master, configure succeeds and the build fails like 
so (kind of surprising that it tries building system heimdal):

waf: Entering directory `/home/vagrant/samba/bin/default'
         Selected system Heimdal build
[190/192] Compiling source4/heimdal/lib/vers/print_version.c
21:26:51 runner ['/usr/bin/gcc', '-D_SAMBA_BUILD_=4', 
'-DHAVE_CONFIG_H=1', '-MMD', '-D_GNU_SOURCE=1', 
'-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-fPIC', 
'-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT', 
'-fstack-protector-strong', '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL', 
'-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void 
__HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)', 
'-Isource4/heimdal_build', '-I../../source4/heimdal_build', 
'-Iinclude/public', '-I../../include/public', '-Isource4', 
'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib', 
'-I../../source4/lib', '-Isource4/include', '-I../../source4/include', 
'-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace', 
'-I.', '-I../..', '../../source4/heimdal/lib/vers/print_version.c', 
'-c', 
'-o/home/vagrant/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
In file included from ../../source4/heimdal_build/roken.h:156:0,
                  from ../../source4/heimdal/lib/vers/print_version.c:39:
../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: 
roken-common.h: No such file or directory
  #include <roken-common.h>
           ^~~~~~~~~~~~~~~~
compilation terminated.

Thanks,
Uri.

