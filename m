Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D178E4B64C9
	for <lists+samba-technical@lfdr.de>; Tue, 15 Feb 2022 08:53:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VNRmeZadJI4YaQP/QjMgamvAiqmNe+RI2JQwA3JSSLw=; b=PqQlQcvei6tg0omw2nNURofXzx
	ZpcuvBhuYvAv6q5BoAyhd5068Qo3ZWF1Qdg8lKGT+p+5nWgSxqXDNMuZqIi2J/3q8TxCUxGi9mhkg
	gpna430h2TqqkdCm+cDBGwH/PWlAVtwBXH1t+J5m09lNsA1EuYxOou+s38tc0OHNFddbeAaxAfGH3
	Y+GCEYrQLYUN0DRJVPUX6KQpLI4gDIhOjrUyD09QwNr8bIRFdmFXN3JgIlepQR39SPcz425aCoUI2
	3YfDMxgAZoXjr/4yLSr4QoMQ1rsf54Vho/DOHbCMZ8CZIvtmOMkvx32yr+AXG/Wx9lLo9/oTWfuFY
	VGjuEG7g==;
Received: from ip6-localhost ([::1]:47006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nJse3-008YQz-11; Tue, 15 Feb 2022 07:53:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nJsdy-008YQq-6b
 for samba-technical@lists.samba.org; Tue, 15 Feb 2022 07:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=VNRmeZadJI4YaQP/QjMgamvAiqmNe+RI2JQwA3JSSLw=; b=PjZmHYwevFu/nAg9cIGmpI7wsy
 QAsdwXH8s2ry+RoEdkEsLn5T2pO6/Hwd+v0VRNSW9sQ6mNngaJj8cqp1aLJcCi7oHF5JCiVH3dkJx
 CTVJaDAGgCMISqSNPhOTH+wFq0LgpYpisTwOQb43+TnmbNFNSOyMjGna8/cGzcYasoWWJKSi8oDmo
 +lxrMIbV8aLV+gfp4HTNRiz9t9GqZUciBOiMvlrG4WfMrka27qG8U/VwrV8Rllrdg0hUXQ9XDTBnf
 tFLe4+kNlaN5n0Riaa0jrIASl4ApyRlySCWNhRTm5M1HAK7lkWlxoWdctIL4edPVMUFzxH//DNyC8
 z5Dl/1FE5kxbSdenDyCu+h/5/cRQ3BwFV0h15ohq8v/ZYUDnH+GHg3jPiLebZMLH6kEgzL/+02xJ4
 RC7KR3pR7N4Bl7uJJGxPSwMsrXuXt/9iUQAGEuGyu3NyMoomeGWgkdKtDfkqzPQK6UqJtS7kZ2msl
 hBzAa/N7RO2CTGoGEiew4yiN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nJsdv-003pFw-KL
 for samba-technical@lists.samba.org; Tue, 15 Feb 2022 07:53:00 +0000
Message-ID: <5dc4454e3ffdc7a0bd1b889c2d99e64d460cc655.camel@samba.org>
Subject: Heimdal upgrade: Re: [Announce] Samba 4.16.0rc3 Available for Download
To: samba-technical@lists.samba.org
Date: Tue, 15 Feb 2022 20:52:54 +1300
In-Reply-To: <3bed4df7-3f56-de41-e14a-1b5f989ba523@samba.org>
References: <3bed4df7-3f56-de41-e14a-1b5f989ba523@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-02-15 at 08:36 +0100, Jule Anger via samba-technical
wrote:
> Release Announcements
> =====================
> 
> This is the third release candidate of Samba 4.16.  This is *not*
> intended for production environments and is designed for testing
> purposes only.  Please report any defects via the Samba bug reporting
> system at https://bugzilla.samba.org/.
> 
> Samba 4.16 will be the next version of the Samba suite.
> 

This is a note to myself as much as anyone, but just so it is written
down somewhere:

We need to mention the Heimdal upgrade, the resulting FAST support and
the limitations (useful to Linux clients only really). 

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


