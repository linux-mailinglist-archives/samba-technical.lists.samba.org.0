Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6AF4F4A55
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 02:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ASPssZcFEcPAPl7ISsOkvbL590utlbdBzhrA3+j9OzM=; b=gfles7pfY28WKyFuJLbX82DcqD
	fqVqfuBnLQ9JttGFuElMTgtaC7rj3CEjOt1oeIGtOA+LsrhZDfOD9FYMPe8NVLLzaTBnohkcg2fgW
	576/0EDiYPRCXCmreDu93Agc8klGF1giYcSZX64mxm/xKEsbNqEglzqYJVOcwdSN0HtY+5qX+zxHF
	6cmN4ugYl9BQfJisW+zFeOHzZQk6ULApk5wrhZZq7CSP0sfuR0vIHRMDnF/DhREhoUYxlHgvn5ZZN
	VdLXA10LEHRvL/XHhH/FPIUnSZAhL2qQ6tKsPAL+V07IqaL8rOVgiA4Fof+zG5JCM2rMV17jGpXhC
	MJ4gDysg==;
Received: from ip6-localhost ([::1]:46774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbtk2-00AHEM-LZ; Wed, 06 Apr 2022 00:41:46 +0000
Received: from ext140.multitalents.net ([173.164.249.140]:61164
 helo=server01.int.multitalents.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nbtjy-00AHED-4f
 for samba-technical@lists.samba.org; Wed, 06 Apr 2022 00:41:44 +0000
Received: from server01.int.multitalents.net (localhost [127.0.0.1])
 by server01.int.multitalents.net (8.15.2/8.13.8) with ESMTP id 2360fbBX009252; 
 Tue, 5 Apr 2022 17:41:37 -0700 (PDT)
Received: from localhost (tim@localhost)
 by server01.int.multitalents.net (8.15.2/8.13.8/Submit) with ESMTP id
 2360faVm009211; Tue, 5 Apr 2022 17:41:36 -0700 (PDT)
X-Authentication-Warning: server01.int.multitalents.net: tim owned process
 doing -bs
Date: Tue, 5 Apr 2022 17:41:36 -0700 (PDT)
X-X-Sender: tim@server01.int.multitalents.net
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: What determines RUNPATH in installed libs?
In-Reply-To: <d001920183b92fb425c4d5f3fb79ccf869bc9fcd.camel@samba.org>
Message-ID: <alpine.UW2.2.11.2204051724270.10912@server01.int.multitalents.net>
References: <alpine.UW2.2.11.2204051626590.10912@server01.int.multitalents.net>
 <d001920183b92fb425c4d5f3fb79ccf869bc9fcd.camel@samba.org>
User-Agent: Alpine 2.11 (UW2 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
From: Tim Rice via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Rice <tim@multitalents.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Hi Andrew,

On Wed, 6 Apr 2022, Andrew Bartlett via samba-technical wrote:

> On Tue, 2022-04-05 at 16:43 -0700, Tim Rice via samba-technical wrote:
> > If I configure samba-4.10.16 with these options,
> 
> I realise your question is generic, but before someone else says it,
> please don't configure Samba 4.10, it is long out of support ;-)

Totally understood. Unfortunatly my 4.15.3 build stopped at [2378/4098]
and I discovered XXat syscalls were required. Not on UnixWare yet.
(and centos7 does have security patches)

> >         --libdir=/opt/lib/samba
> >         --with-modulesdir=/opt/lib/samba
> >         --with-privatelibdir=/opt/lib/samba/private
> > most libs will get installed with the correct RUNPATH but these
> >     bin/default/lib/util/libsamba-modules-samba4.inst.so
> >     bin/default/libcli/registry/libutil-reg-samba4.inst.so
> >     bin/default/libcli/util/python-ntstatus.inst.cpython-39.so
> >     bin/default/libcli/util/python-werror.inst.cpython-39.so
> >     bin/default/source3/libmessages-util-samba4.inst.so
> >     bin/default/source3/libsmbldap.inst.so
> >     bin/default/source4/lib/samba3/libsmbpasswdparser-samba4.inst.so
> >     bin/default/nsswitch/stress-nss-libwbclient.inst
> >     bin/default/source3/smbd/notifyd/notifyd-tests.inst
> >     bin/default/source3/versiontest.inst
> > will get installed with RUNPATH /opt/lib/samba and yet they all
> > need libs from /opt/lib/samba/private.
> 
> Yes, this is expected.  Bits of samba require other bits of Samba that
> are not public interfaces, but are built as shared libraries to avoid
> duplication of compiled code (with all the problems that creates).

Expected to have a RUNPATH /opt/lib/samba when it needs
RUNPATH /opt/lib/samba/private:/opt/lib/samba ?
As I said, most of the samba libs have the correct RUNPATH

> > Are the dependencies listed somewhere in one of the files in the
> > source tree?
> 
> The deps= lines in the wscript
> 
> > Are they calculated at configure time?
> > Are they calculated at build time?
> 
> waf, our build system, calculates this.  

OK, thanks. I'll dig in and see what's missing.

> 
> Andrew Bartlett
> 
> 

-- 
Tim Rice				Multitalents
tim@multitalents.net



