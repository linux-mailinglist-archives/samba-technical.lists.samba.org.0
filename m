Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E59DC445165
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 11:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/3Pz6puDBrqzjwm/MucSdloYZ+IiiwFZNMODGfp2518=; b=NpIColtImyO6ZnfdlJwWKy1UU/
	X9Qy/711cuB5JFlNhQgaEJ47mMdxWK5YW49Br2m9zeQIri06Txg1gOTFtmWrd1oBZ3T2XUJPiQPhr
	ZTs4ZMO4F1lZqNPS1JhGBM6eg8cLVyxaoDH76IRJsraG/NGPM4y19vy/DlrT157XjnXnYMmPUq/CY
	IoFF2pJfb0WZAz+hf6QUKgTivsH5PpJS++4iywmeYp44SHEPZQ3e0KaC5tltXQAiIgF0aa0y8q+Bp
	CPw8XxUyisxsb9GwG+1dUlPqkZ+di9D12DKbbiPvePmtJ6vuGeluHbqr6Pl45bUCnGhfKP/Svf/V4
	5XIrDz4g==;
Received: from ip6-localhost ([::1]:58302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1miZaB-006xQ7-2S; Thu, 04 Nov 2021 10:02:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1miZa0-006xPY-A3; Thu, 04 Nov 2021 10:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=/3Pz6puDBrqzjwm/MucSdloYZ+IiiwFZNMODGfp2518=; b=f1ea33fqQWqYRaIzKY3WaKk+M1
 JKgoypumjCqRvQLE0PPTi7qDAId46jR1UFUXCHbVgUBFCGjsAGX+LoUxHKZP/KT4BVaeS75FfbPx/
 dF0VU3PTwf01lRFvMYx5LyZC/fR/Vq3YXWVhT212Hzk9knW83oINtsUUAFUIjJC9Mj9K3DTCnOXsr
 4S61K1c3L8xii20s4uLgvXJMzKiZm2uTcTSm01o2XmMboplq2UqG9Pg71+LuqSTSjhnmsf7M27yTj
 XSO6LtfMfHgLt7+xsJz08nJ2QUj9R794KCBBe1NirY0GF84vwVRqNgYVrQ077myo9XtDbudeZhD3K
 6ocxbctN5MpqJyYB+VZENrsdUYt2+44QzbSff4rs5czZri0wuqzKZy/c/ACbPyFKgcK1HwVaVbgf6
 xxQsAuW2AGDf4PQhuF93U+2/qEDoJlNJcOAW3EFJ4NkphngnoZaEG2v+J7+8EiSQ6FvB4eBNAW06m
 rNbf8y/crbFKwf52aphJCbQD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1miZZz-0057FP-Hu; Thu, 04 Nov 2021 10:02:43 +0000
Message-ID: <354ffafda30af28036a6cf4f16059086e3051b68.camel@samba.org>
Subject: Re: [Samba] Upcoming Samba security release
To: Andrew Bartlett <abartlet@samba.org>, samba-announce@lists.samba.org
Date: Thu, 04 Nov 2021 10:02:43 +0000
In-Reply-To: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
References: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-11-04 at 22:55 +1300, Andrew Bartlett via samba wrote:
> Hi,
> 
> this is a heads-up that there will be Samba security updates
> on Tuesday, November 9. Please make sure that your Samba servers
> will be updated immediately after the release!
> 
> Impacted components:
> 
> * AD DC (CVSS 8.8, high)
> * AD Domain member (CVSS 8.1, high)
> * File server (CVSS 4.8 medium)

Is an AD Domain member what I call a Unix domain member ? Which can be
used as a fileserver ? If so, what is a 'File server' ?

Rowland

> 
> Cheers,
> 
> Andrew Bartlett
> -- 
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
> 
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
> 
> 


