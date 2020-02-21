Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C81DA1675FF
	for <lists+samba-technical@lfdr.de>; Fri, 21 Feb 2020 09:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UU03PSLf1uWzij637QjYFnWQ6BDZoP1n2AEZ0atUoEg=; b=QFDbXEJ2H/Cvij2VOxE5xwVeIH
	rCS81v+OzKecJKbkIGEOJ0RPFTxBpXerpuWBKDr4E0GzDSoHxqBHYTA45TrKUudhl488iQU/J72bi
	UNVP9zGty1G1D+jD2HOu8oNRz/k3Qz02mS7lZHqAkd+sRckvl0zx10PL/xJ/oklcSrZXnb1tQMgSM
	rX7nL+LQwYUaTeAZrM67fHVWANAiTuHGuegJYcczAVI3NZ4uVNmitD9CooiUQo2jvlYh6qmvsSXl1
	9PKgV4EGpVVUB3Qv4pn+IhKlX9P/Q2ClG3fiyah2j5oVUoRFPiaZLRu1DrfG2p+vzfaJYJb+AB7jm
	p0Klc38g==;
Received: from localhost ([::1]:52050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j53j8-00AsuZ-Pm; Fri, 21 Feb 2020 08:32:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36780) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j53j3-00AsuS-UW
 for samba-technical@lists.samba.org; Fri, 21 Feb 2020 08:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=UU03PSLf1uWzij637QjYFnWQ6BDZoP1n2AEZ0atUoEg=; b=pihcdMKocHKEtPOtPGGat+IF/h
 FDtUZr6mt94ESWOCq2wmWVNGaiEDpSUKk0p5nxuW/cC9UkirJwBdvsvuO0hJXRY/QbOT30EfIgEM1
 XrvHWw6f7ehc7wtc9XhZzu7HdmkqtxZVTAwaC//0hZnU5eEqK5RlZoVkJRw559BdZa01o+sDcdCY1
 oPv8Nh/C8rfzMA+aRLK+3M13P2S2gLgpo7PNN/jKV01cZthoDkRrkrVMDRsA35oYpAjL5VDrixG4m
 pKmy8ZjMpZUA6Uyj58rajGsVNwFZB0mnBQX2AuJXYfa7w6lyG3t6znLlI5aB5t/p3B8L0se13N8TE
 2Dt+T3moi9yaRR8o7AwzOdRAqVccMcdV7ivtmE1M7J9Mo1uZTMqxIcuklvaZJsEvgJhveGQXlTd99
 T54ET+5VXAJePgmo9BYOzxX1wlWWk2NsUG9tsLU9IGs9XzBzixFz1+zRWfAvBb4JjKnIOxe7xneoe
 JkOjWp8N51hIxIm+8HLLuy4P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j53j0-0004BN-Cr; Fri, 21 Feb 2020 08:31:54 +0000
Subject: Re: [PATCH] WHATSNEW: Spotlight backend for Elasticsearch
To: Ralph Boehme <slow@samba.org>
References: <70cf0568-9589-7bd0-ed36-cee40893b8e0@samba.org>
Organization: Samba Team
Message-ID: <6573948e-321f-488e-46fe-93d6dc5306d0@samba.org>
Date: Fri, 21 Feb 2020 09:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <70cf0568-9589-7bd0-ed36-cee40893b8e0@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

Am 20.02.20 um 14:22 schrieb Ralph Boehme:
> please add the following for the 4.12 release notes. Thanks!

done. Thanks!

Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

