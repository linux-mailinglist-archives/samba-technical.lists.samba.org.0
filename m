Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 026947EDB6F
	for <lists+samba-technical@lfdr.de>; Thu, 16 Nov 2023 07:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oyRN6diLZlJi2xG/iFEG0KEm093eCcxh+c0RTNZzsu8=; b=WVoMYTqM37edxL2inHn40ZgMSK
	uBXC/V7HamY/Y0iAL8DvzKuj1kZmHthoKwwvImM23+wvOUxmu7SYMWfZQ4pdbF22qZ+1oFMnWkOnM
	TQw/iPXJPxSnAd7R8wLRObwd6nTT8vOtnfgacEhsHDeJLrtKMuynjrc716H4GQ5+h4RLPUc66K/1C
	X3ESjZAyM7JBcg1KB1PmMYpwb+BNHfepPTBixuBWIpFXg6YkhqVzLPtN+bc3U/m0phXRonpvNVIn/
	KQ0gC2UlOJdsAWAcRwzym+7FDNMAGKdq1qojByU2ehq/NvrBrL205hvaaRzknNJZyBWiCm/2Ky0cu
	Y9T86tTg==;
Received: from ip6-localhost ([::1]:55056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r3VYs-008VI8-RR; Thu, 16 Nov 2023 06:09:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51210) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r3VYn-008VHz-J7
 for samba-technical@lists.samba.org; Thu, 16 Nov 2023 06:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=4Og9woP9EkpUJfNOmPdJktcoF++5ohy9wLG7DF2rOUU=; b=RHadNeoFIYzGMS2RLpzJahc3BH
 94B5DqfkYFlpcFu0WfixH9eqJ4+W4QpFEFvNd8321lJxFn8G5E6aeYL+H41z78Pd1/CuID3zLvmvh
 VCHo3tQtVSA1M30Wbei+h7q5e+AXBwJfI9fIvFyFNCQ6YVvxkmd1NamWZi9KmlKPzYELeBThw2doR
 dctkDr8rlBB2nDKhY6K0AuPTAMjG4Fq1sBqzCKUMizg+IUociMHGH87I39NOtg7atUjUTsweKaDSB
 /RodL8gARIXGL82qoAiJLv2KzWdhmN1tZlNK2AKM5biIktgpC0pumLdZFiPhWAUAqiRqLkz7aM/se
 SFRX2gb85DEyKXzmQ9+hN/Ady8msSu6khGZ6wViw3rYKSIJC2HoOJXJTnBRu6J1uaAFPwHY29OhEn
 P6BdlCGkZRFioPDyDg6+J68VynmZ1Wxqr+rLFLABT4QUm75YYiyYRlhD9QHNnTXrRJnAYjQGIOKid
 VNIIkGTZdO7WfrB/hgkugXsv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r3VYm-006TUH-0H for samba-technical@lists.samba.org;
 Thu, 16 Nov 2023 06:09:04 +0000
Message-ID: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
Subject: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 16 Nov 2023 19:08:59 +1300
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For Group Managed service accounts, which we are working on, for
reasons around RODCs and a few other things, Microsoft has decided to
internally use a key-agreement between a 'root key' and a 'service
key', both held in AD.

The password comes, as I understand it, from the key agreement derived
out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman exchanges.

This is all in MS-GKDI, referenced from 
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/9cd2fc5e-7305-4fb8-b233-2a60bc3eec68

I just wanted to check if there are particularly cryptographic
libraries we should consider for this work.  

In the past we have looked to libnettle when gnutls didn't provide the
functions we wanted, but that was backed out fairly fast as another
method was found (https://bugzilla.samba.org/show_bug.cgi?id=13276 0784
4a9a13506b4ca9181cfde05d9e4170208f88).  

Even so, for this case is libnettle still the best first place to look?

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



