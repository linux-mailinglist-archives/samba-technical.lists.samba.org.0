Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5CB2D0D5
	for <lists+samba-technical@lfdr.de>; Wed, 20 Aug 2025 02:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sV0Qvz7089D8YCsJkvD/r4pCIRuF1xYSUSzbjVOAfy8=; b=wHs9HuH6+FjGH5Ti+Hx6VQWlzT
	1jgs8+xsB+ZhUrSCdigJMO1Y6ly1z9z7+q4vnVk39YigbeZzw+HAWNrJDXC6Urrk3mKc/SyRgDpRs
	pmbfH2ebw/y7M8dUTOMVD5SEXJbJ8blcBnYkWtHZROvkkwSYY5PhkQtbZidQOIYJOJvEbaC5xYSf9
	sGS+xGEcJDp8nVbgv3mGGDUO/lg3rA/UYFYGXNpZlSUXdxbUsEOUDTNaAXTgyeY8vUaEvOif/4NBf
	MEW07oGvij8GAas0HcpNH4aBR2EJ40e5vShZU3Dk6aT48gt7keEOlS9/opoh+CpcFa7lXF2hJNloG
	k3jEU8hQ==;
Received: from ip6-localhost ([::1]:39788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uoX76-00FL67-DT; Wed, 20 Aug 2025 00:55:40 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:46782) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uoX70-00FL5z-Ih
 for samba-technical@lists.samba.org; Wed, 20 Aug 2025 00:55:38 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 2FACEDD;
 Wed, 20 Aug 2025 12:38:00 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1755650280;
 bh=Z54Mu8nlJYa1YxWCXyX5GdBO6sWghqjzJkb9WcAGwis=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=aiQ268b6zv8wCyDdbBmYeRnkDdmvzhLl/Q9Q/S2i+zgZ26hYUxZv2UURQIzwwYPfV
 o1O3HHQAYnvKoSMI9rD60EmNLFueoar9WMCRn8OAIplaOvy9aER/w3vHPcH0nED8vI
 /H1FVa7m5u745HLJTphSHYCigM253SX8RHGCZJdlpHsKeFqVPYofKYhw1233IvFzAE
 w4frzSJi+8xQJiAUoJXGrTtMdAkWNX4ikLyVaRgm4wl3IGXniSyUe4FCqFLL0eWgj/
 DsUD7VryN+BUnc9siW5eGr5aICbLz2cUB8d9BmYxJz9l8k/+P5sa5y28Gh8Pv73Cqs
 b4nUsju7tN/1g==
Message-ID: <35e5df4d-c0f2-48b4-9756-9c41546442eb@catalyst.net.nz>
Date: Wed, 20 Aug 2025 12:37:59 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 4.23.0 WHATSNEW entries missing
To: Jule Anger <janger@samba.org>, samba-technical@lists.samba.org
References: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
Content-Language: en-NZ
In-Reply-To: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 8/08/25 03:34, Jule Anger via samba-technical wrote:
> Hi,
> 
> the WHATSNEW for 4.23 looks pretty empty so far.
> If you have added or deleted a feature in the last six months, please 
> send me a description to be added to WHATSNEW.
> 

I think this is the only change to samba-tool that doesn't count as a 
bug-fix.

Douglas

 From 487030e411d003b57b169babdef4fc6afbe34e06 Mon Sep 17 00:00:00 2001
From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Date: Wed, 20 Aug 2025 12:18:53 +1200
Subject: [PATCH] WHATSNEW: samba-tool domain backup --no-secrets changes

Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
---
  WHATSNEW.txt | 13 ++++++++++---
  1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/WHATSNEW.txt b/WHATSNEW.txt
index 27fae5331d2..20a61604369 100644
--- a/WHATSNEW.txt
+++ b/WHATSNEW.txt
@@ -32,9 +32,16 @@ Initial version of smb_prometheus_endpoint
  ------------------------------------------
  todo

-samba-tool improvements
------------------------
-todo
+samba-tool domain backup --no-secrets avoids confidential attributes
+--------------------------------------------------------------------
+
+The --no-secrets option creates a back-up without secret attributes
+(e.g. passwords), suitable for use in a lab domain. Until now it could
+still contain confidential attributes, including BitLocker recovery
+data and KDS root keys. Objects in the classes msKds-ProvRootKey,
+msFVE-RecoveryInformation, and msTPM-InformationObject will now be
+entirely removed from the backup, as these objects are required by
+schema to have confidential attributes and are no use without them.

  CTDB changes
  ------------
-- 
2.43.0

