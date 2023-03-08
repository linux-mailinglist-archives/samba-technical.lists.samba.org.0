Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [144.76.82.147])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEE6B1072
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 18:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R/ikggO1es7Jr8k+qXJjv5zsH8SlXy5S1MIRbgOMcSA=; b=QIGHhX2kF2WnPo9F0PyXBrzFeU
	yMo+1L8xVsyDW00vjBSr1HRHuAYcLJaXmgwks+BKGvd1vNW36k8QbIUjxd46DJiAITZgOz6mWOWJW
	Rg1L9OvYsbk2ScMYh+TXFkdVaqp9DAX6MoN2cgqMDwEA9NBx974ruorIl9Kn941UyASlDQOWHTqt+
	rwanPPBAE/n7WO7+phkfZiqe2Yc9XJV4H4W5jiLV92rzxJVPP1EXzBTrwpHbXApWTTusugE6QQRrN
	M/sHaz/1wVE+s/A1j4TjtNpCqSLbKdZ4GEEzgHKoaxYj5SmbvephfoanlVpTmr9Mzxrmx6dMTogpW
	0IeP3qpw==;
Received: from ip6-localhost ([::1]:42414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZxro-000Ovl-3t; Wed, 08 Mar 2023 17:46:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48718) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZxrj-000Ovc-BR
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 17:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=R/ikggO1es7Jr8k+qXJjv5zsH8SlXy5S1MIRbgOMcSA=; b=3cyInyVLlacXaxzcYnuAjP+c8C
 DBc1+/M0t4wK3HnsNye+7xdfd6Og8IORSDoSFIRiO3Sxq8rYjpdB4E28LUzzk6FVaLeEOg4AQGfO1
 2ItaS4qGdOOyD0xvPaMrv08gQG/Yc0muZUsN7JbwqyQ2Cfhy37sfyGKRPmAcuvkHgsJDVYlRH7Xpi
 2GIE2SMIfCJ0o2vrjnOvI+DFKGeam7Y9ptAgg54/giJyDntrmcdqk18nDjsdcePCMFXM23D3AHtPl
 wDNy3Y3+4p7dmWNX0g0rBmIgfuS4xqqBxZOvAocowEaRDp2nPf4PGU2QpPHBtllgy2hwXAXIejYC/
 e2gL683XpGgwdQU3G+FivCwWp7o5np9TqVy+ajFhxpSAgsM35Z+Q+7CWIDakLFBi72Y5bc44zrZ0c
 cwHRc+51RFNkrb1SY56BQz6T0kCi25yVk62O0LadGvtRnTHPwNVhdVT2eq9mhrbweq4jyjKFogzEC
 FLMlFTUFsJSpfQgJPp+azdf3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZxrh-001WQt-Up; Wed, 08 Mar 2023 17:46:14 +0000
Date: Wed, 8 Mar 2023 18:47:41 +0100
To: Ralph Boehme <slow@samba.org>
Subject: Re: Ceph RADOS linearizable?
Message-ID: <20230308184741.4e9f2b2b@echidna.fritz.box>
In-Reply-To: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
References: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph!

This a question better suited to the Ceph development list, but I'll do
my best to try to answer...

On Wed, 8 Mar 2023 15:53:31 +0100, Ralph Boehme wrote:

> Hey David,
> 
> I'm currently doing some research into distributed databases. I'm 
> tracking candidates here:
> 
> https://wiki.samba.org/index.php/Samba_on_Scale
> 
> One of the tricky things is figuring out the consistency level [1] 
> provided by the database. There's no public RADOS documentation that 
> clearly describes the consistency provided in industry standard terms, 
> I'm pretty sure it's linearizabile, but the only real reference 
> mentioning linearizability I could find is from a RADOS related research 
> paper that talks about adding support for weaker consistency levels:
> 
> http://www.cs.nthu.edu.tw/~ychung/conference/2016_ICPADS.pdf
> 
> Can you confirm whether RADOS is indeed Linearizabile? I'm pretty sure 
> it is, but would like to be sure. :)

RADOS is a very broad interface when considering linearizability, but
if you choose to focus on key/value storage accessed via the Ceph omap
interface, then yes, my understanding is that OSD requests for a single
object are processed in a way that provides atomic consistency from a
RADOS client perspective. That guarantee goes out the window if multiple
objects are involved, or the I/O is split across multiple OSD requests;
a single OSD request can contain multiple (sequentially handled) I/O
operations.

Cheers, David

