Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA225CEE0
	for <lists+samba-technical@lfdr.de>; Fri,  4 Sep 2020 02:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uE848B3mIfeFOQOLokAjxq0OFbwqWMcpcZIxGwRmnjw=; b=PK4TtcjKxl8TJnoHqV7AQHI0/g
	I+aGRqtHBveZCq0+AH+ItvppJugSYHtK7aUW/nUPMl5bISrlKMgnPHfWBD6e3cPzELYZCv1lut2fR
	dkDtU9pCZZnEvVWb7KmZ86GlDUEYCYncGPE0qeIPzG1I3+2I1vi1JgHT5IwAD6GA3kfFNF5PFCgxE
	I6o3A1bBYzYidyhL3ggGQ3XzYfVwgoeIB1impVKt7pLo1Av/L10FAUnSlxapqToAmqHtizzySj4IV
	0Ggvd5i9mweDxn1tCa/MoZoXgbVhr2LkzucOXl9J6+im1whaFZxAAxVUg4LrkTfiaqJJpmRc9NhP7
	pt4BoaBA==;
Received: from localhost ([::1]:55448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDzyk-003t9g-EW; Fri, 04 Sep 2020 00:53:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32050) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDzyf-003t9Z-OG
 for samba-technical@lists.samba.org; Fri, 04 Sep 2020 00:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uE848B3mIfeFOQOLokAjxq0OFbwqWMcpcZIxGwRmnjw=; b=yS7d0s1vNQnesyWfyZA8oNIM6O
 dUKohgGFUakCSMme0BVjj5dayfPcr+8DyA4rKwL1MyxyieuUDDPs4OF3fuBqGfBgS1kY3KSWl+5KF
 emjLR9xHwBU6UvfMV2REaq6jhhEPINccO7P9mSx0OV0fWdaacWx+5mdJ7BXY5FmZ+zFhiu/CoMIgP
 4kwYrwRIKnAEUR2aANjsB7ut7ZLq9R67dW9XaYejINrEuepAk2XGGNoStxadcngLg4zpgaN/mkDeJ
 SRostlbc4AoJtVqo2IPTotzzrokFwDHNiL+9VJ6/YglCyd0ikA2Oli0Bzgtg+EIAzLga5OzljdPwW
 Lvsm6Ip1a748AEQwPWFmG5Npj3UovL6rLj2BDsRvEDSVWTRg7NSP0pNwd0wjaSST/6KGc9ivEkqlj
 FMlvnHAdKaAdOkCB3tMWHMujefnmi6rqIcfiMBw3ZL2k9S7nJBaCwJXTORiputgj5Ord3i+mImyPR
 SWpXR+T5B+74j8mmMnzUSS7n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDzyc-00065q-Ky; Fri, 04 Sep 2020 00:53:15 +0000
Date: Thu, 3 Sep 2020 17:53:08 -0700
To: Krishna Harathi <krishna.harathi@storagecraft.com>
Subject: Re: Directory Leasing feature in Samba smbd
Message-ID: <20200904005308.GB214717@jeremy-acer>
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
 <20200826173216.GC16382@jeremy-acer>
 <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
 <20200902192054.GD26967@jeremy-acer>
 <52d72e81-a811-3297-2e35-0556e3ab3673@talpey.com>
 <20200902211644.GF26967@jeremy-acer>
 <002b1d57-a632-9fd7-e28b-f645d0993c55@talpey.com>
 <7E637A87-D647-4D4C-B03B-7CEE72EE9E91@storagecraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7E637A87-D647-4D4C-B03B-7CEE72EE9E91@storagecraft.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 04, 2020 at 12:36:05AM +0000, Krishna Harathi via samba-technical wrote:
> To make it clear, steps I listed are for the setup I wanted to test *before* adding test-cases to Samba. Our vested interest in this feature is purely due to the fact that the windows client seems to take advantage of this directory leasing by caching and thus improving the response time of a specific workload. So I need
> to setup this workload that first works with native windows SMB implementation . The same setup eventually should also works with Samba smbd for us once directly lease is implemented. 
> 
> On the matter of adding test cases to Samba torture set, I completely agree with what you and Jeremy pointed out. It will/should be based only on SMB2/3 protocol request/response interaction. There is no intent to make the client-caching  and other aspects of the above setup as part of samba directory leasing tests.

One more test I'd like to see (if we don't already have it)
run against a Windows server then encoded into smbtorture
code.

Open a directory handle with RWH lease, then add a file to
it from the client with the lease - see what the break
semantics are for your own lease.

Yes I'm sure this is well documented, but theory and
practice are sometimes different :-).

