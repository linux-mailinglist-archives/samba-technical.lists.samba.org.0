Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E430599568
	for <lists+samba-technical@lfdr.de>; Fri, 19 Aug 2022 08:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rMH2Pm/j0xcNYoLCEcwNZp8Xx3Z6m7xxwz92rvcG/mo=; b=ZYalFw3zxba/mqqI5kLD6IkvUd
	P1624hosEFLP0yUpQTF9E5iPdREbTeWtDWQBz4Ol/oDLleGBWtQH5DNwUECPw9Bu9x+TVkjWbhlRH
	wsUvvTmK9ppvVEPZhmdNL7DYWeobQPJ8Y6vc3vo5kGk7Dvhm83+iKfz7Mq/OAL+yJV0M73Pjr0Bas
	oEBsdW8QXp0E3BMUada7jIjWKNqYWEIyPnDOi4LRusqkKFACsJkCs7Zdk8oefo9yta/KTXPM3LSXF
	eGilFZ1xqizlMhDR4+77E/zcjvVZRsh5nWNf/FipnTmzhMvr2f3XsQ967hyw8YfGHTEf1WvHGVysh
	LzwYnKTw==;
Received: from ip6-localhost ([::1]:34918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOvgv-001KrS-HK; Fri, 19 Aug 2022 06:41:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOvgf-001Kqy-Iz
 for samba-technical@lists.samba.org; Fri, 19 Aug 2022 06:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rMH2Pm/j0xcNYoLCEcwNZp8Xx3Z6m7xxwz92rvcG/mo=; b=3ROW1OwlSU8/ZssQ9N3iMfgGEN
 bKpackSrr7dOX61gcqt9ZGWZzsJeaK5lNE4ggEPDqeQTTgyLOrh1EoPyCU50Ze8YEPMivk/sojuY7
 3dlB9+HiGUdlvi88uhfJDKV/CIhM/wd7N59f41rVnwmGhhWS6dYlMWwCwB+2N54v8cOJHe1GWE9uX
 jLezd7x6gMq+B2EmEZ13MZJeLA1gsRYyRGgr+t/9/MZoKsThvdXSwpMrSd6YwSM3ynJbpH7p1MP4H
 t+atD7F8PlJPs8LklW6/ybJVYN31SbRYJodCJrki6riOaKr63jzneJ+gwF14GBdnSrynhppO/uS9z
 /XFZHzPsjdpxLPIOJ/b2V34v5bHFvCGzpHOJQJUZJKVtNTKPWVphg6oF63/fE3elQ635klZc0M/Oy
 pqea0inh78kWNJEmTH3Lz6cO06NsPzT+CPXtggSvqfkfJ1kBF4IrrSd2+y+fibZ+VqcEhHnVpVvVK
 h/44nrtD4HC3szkVbHazY1mt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oOvge-000oi7-Fz; Fri, 19 Aug 2022 06:40:56 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: running only selected tests in samba sources
Date: Fri, 19 Aug 2022 08:40:56 +0200
Message-ID: <5854748.lOV4Wx5bFT@magrathea>
In-Reply-To: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 1 August 2022 16:35:15 CEST Michael Tokarev via samba-technical 
wrote:
> Hi!

Hi Michael,
 
> Is there a way, after successful build of samba source, to run just selected
> tests without running whole testsuite, *and* without (re)building
> everything with the --enable-selftest option?

you can find documentation in our wiki here:

https://wiki.samba.org/index.php/Writing_Torture_Tests#Running_tests


Improvements are welcome :-)


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



