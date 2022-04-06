Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C64F4AE5
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 02:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=b5KRso8MhwV280V1fUl2B62R1LM68jBjddvalFCT+vM=; b=32IUda4KUcZDl9BisiXYFSglC0
	M/qB47wNsSpa51TOPLAoR8RPBbKhhLZcORr/yOmAfrRxr3Ujk6k3jTJAhA77y7AMrrrtKzpUAK9VX
	ifCzPI2Is4ydrflWqv+RiXzDdEG6mctldn5ZFYXLmZXWVGqZtc3BepK6vwuLOwyTRjRj4Fqu/j5FV
	nRy7n4KWTnki77RqfwtP8w1/tumHE+yXUCePI5/3apACjCK2PJrjzxtQZlYhxRnPNGREWldGuriw+
	n2FqkOhefj+/CtIizat6gbD4CZSpC80i//7ggaP4qJzxzbB7DBO8Nz2LAWgPjGDgoJWjlARHsYGNb
	IkOpqeyA==;
Received: from ip6-localhost ([::1]:47458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbttt-00AHY7-Pd; Wed, 06 Apr 2022 00:51:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38182) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbtto-00AHXy-Tn
 for samba-technical@lists.samba.org; Wed, 06 Apr 2022 00:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=b5KRso8MhwV280V1fUl2B62R1LM68jBjddvalFCT+vM=; b=hSYmbhX67idKVXRI19q37K6wFU
 pzymExGjSXe/RDHZk08OYgbjyFErLIPlLPH3fAA6QHjqz5bu6iIW73invwlOluSdOzkokCEHFYmcs
 eIvCBemoVthxZWEwl3kt37TYSMfd6R6ml4+DnFsXHTJ2LNy9uEdSmkG5LdCytTDAWD7l+g6J7k5Lq
 rb/dFsX9GlUKxwiLLOoWYNLKyiks1CFbyNAGunSbVJS7+thAuGu2d/2kUtJ71luVNyM9YmbSji4Hc
 B6mbiIzqBIBwTXQAiEJ1PrSje8WoIC+fok23UsFXgolXAo40KcBZBOyXsHkz6+lKXHofUtO6mIAIf
 dZkZ28Y8siCwKmnOv81ByyMPoDdaUUWYVmt3YGthxMK0hZJ6cw5TRfHT8bw/qkTdW11R8E1wD/NQR
 cduzLUwtY6On6DA9Egf6eE1qS9Y7h/Dha5QD8vzGdE32GpXhyEv22lZgHYnyMBpdf0w7agEi/H5My
 IbxSFNDCKXAKWvqq3EDHPtoS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbttn-005X7h-5t; Wed, 06 Apr 2022 00:51:52 +0000
Message-ID: <064da5b8cf0224d9be6b98bfc953385555bc923a.camel@samba.org>
Subject: Re: What determines RUNPATH in installed libs?
To: Tim Rice <tim@multitalents.net>
Date: Wed, 06 Apr 2022 12:51:46 +1200
In-Reply-To: <alpine.UW2.2.11.2204051724270.10912@server01.int.multitalents.net>
References: <alpine.UW2.2.11.2204051626590.10912@server01.int.multitalents.net>
 <d001920183b92fb425c4d5f3fb79ccf869bc9fcd.camel@samba.org>
 <alpine.UW2.2.11.2204051724270.10912@server01.int.multitalents.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-04-05 at 17:41 -0700, Tim Rice via samba-technical wrote:
> Hi Andrew,
> 
> On Wed, 6 Apr 2022, Andrew Bartlett via samba-technical wrote:
> 
> > On Tue, 2022-04-05 at 16:43 -0700, Tim Rice via samba-technical
> wrote:
> > > If I configure samba-4.10.16 with these options,
> > 
> > I realise your question is generic, but before someone else says
> it,
> > please don't configure Samba 4.10, it is long out of support ;-)
> 
> Totally understood. Unfortunatly my 4.15.3 build stopped at
> [2378/4098]
> and I discovered XXat syscalls were required. Not on UnixWare yet.
> (and centos7 does have security patches)

To be clear, the things that made us require XXat syscalls are not in
those patches, because you can't patch for them without the XXat
syscalls.  This is the whole share escape mess. 

> > >         --libdir=/opt/lib/samba
> > >         --with-modulesdir=/opt/lib/samba
> > >         --with-privatelibdir=/opt/lib/samba/private
> > > most libs will get installed with the correct RUNPATH but these
> > >     bin/default/lib/util/libsamba-modules-samba4.inst.so
> > >     bin/default/libcli/registry/libutil-reg-samba4.inst.so
> > >     bin/default/libcli/util/python-ntstatus.inst.cpython-39.so
> > >     bin/default/libcli/util/python-werror.inst.cpython-39.so
> > >     bin/default/source3/libmessages-util-samba4.inst.so
> > >     bin/default/source3/libsmbldap.inst.so
> > >     bin/default/source4/lib/samba3/libsmbpasswdparser-
> samba4.inst.so
> > >     bin/default/nsswitch/stress-nss-libwbclient.inst
> > >     bin/default/source3/smbd/notifyd/notifyd-tests.inst
> > >     bin/default/source3/versiontest.inst
> > > will get installed with RUNPATH /opt/lib/samba and yet they all
> > > need libs from /opt/lib/samba/private.
> > 
> > Yes, this is expected.  Bits of samba require other bits of Samba
> that
> > are not public interfaces, but are built as shared libraries to
> avoid
> > duplication of compiled code (with all the problems that creates).
> 
> Expected to have a RUNPATH /opt/lib/samba when it needs
> RUNPATH /opt/lib/samba/private:/opt/lib/samba ?
> As I said, most of the samba libs have the correct RUNPATH

From my experiences with RPATH and RUNPATH for Google's oss-fuzz, I can
only warn:

You’re in a maze of twisty little passages, all alike.

> > > Are the dependencies listed somewhere in one of the files in the
> > > source tree?
> > 
> > The deps= lines in the wscript
> > 
> > > Are they calculated at configure time?
> > > Are they calculated at build time?
> > 
> > waf, our build system, calculates this.  
> 
> OK, thanks. I'll dig in and see what's missing.

You are likely to be eaten by a grue.

;-)

("git grep -i rpath" would be a start). 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


