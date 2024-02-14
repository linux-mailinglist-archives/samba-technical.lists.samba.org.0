Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5D854BFC
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 15:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=N3h4b68zuDwSUCWpsgbYlESXyA4JuczVZ4Dk92U8BUY=; b=13Ljy8V8XxOTwxdSVOPpa0FGyT
	DbvBFZWDl2VSAjfqB1PKNroDjxb33/o8m9YHk84RZGldvnotxDuxWklVdjx0Va38AXqr77G9dribe
	2zaYXwyLtYp45zsg9+hpHWG+auv3G0EhCFufc8ZX1qSFU+8L5c7LizLP9UyuvANqUvN4RNC2I4Bx4
	M9Z6v9ojYCsMPvIZVMUN3tvNV6mqJMC13LVVP5VYi2UpymBd6HZ0QC2pQOsaVeUb7aRoooO52s7Gc
	dzMXOorPtF57zD6wJ7NiNwdN73WhabN5HM5gygblHGt6YPlEFrMciZIdySrf1QscDmrnAUzANulaa
	7FbSNk+A==;
Received: from ip6-localhost ([::1]:39974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raGiO-008TPO-UE; Wed, 14 Feb 2024 14:58:25 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42373) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raGiL-008TPH-NR
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 14:58:23 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 376E44D494;
 Wed, 14 Feb 2024 17:58:25 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id BE0267EF76;
 Wed, 14 Feb 2024 17:58:17 +0300 (MSK)
Message-ID: <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
Date: Wed, 14 Feb 2024 17:58:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking to once again re-bundle LDB
Content-Language: en-US
To: Alexander Bokovoy <ab@samba.org>,
 Michael Tokarev via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
In-Reply-To: <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
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

14.02.2024 17:46, Alexander Bokovoy wrote:
..
> We do rebuilds of the whole stack in Fedora if bots detect samba ABI had changed. So for us it is not a problem.

It's easy to do with "current" Fedora release.  It's entirely different
question when you want to provide current samba to a previous Fedora
release.  And that's where the problem is, - providing "backports" of
current samba to previous releases of distributions.

For RHEL for example, some previous but still supported stable version is
using, say, samba 4.13, and you want to run current samba 4.19 on it, -
you'll have to either provide current sssd (rebuilt against 4.19), or a
rebuild of whatever sssd was used on that older stable RHEL, together
with new samba.  That's what I'm talking about.

This is probably less of an issue for RHEL though. On the samba list
there are quite high demand on new samba for older releases of distributions.

> FreeIPA only supports MIT Kerberos for the server side and SSSD provides Kerberos pre-authentication modules to MIT Kerberos soi it is also best to be built against MIT version.

Yeah, it would be best to build samba against mit krb5, if it were a
supported way.

Thanks,

/mjt

