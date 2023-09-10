Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D4799F93
	for <lists+samba-technical@lfdr.de>; Sun, 10 Sep 2023 21:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dXIIO7XAdC0n9bAIh1JvM2S/NaPKaIqCDeiHgzCELHg=; b=QUz6cdTThh+X2NRZGF71GPxm3B
	Pf62R5ZWzPnDnWE1/taWwfZdIHEcec2A2yI1vVczI4/PYKBok1n0QbBhvkeWmt1IqPHHz2ZsNoS27
	pUOkRrXr+039clPOLULQ7bP2gNAs68h8T/BqYyuhalFdtLmQuL/M9L0x43xJeFcqNb1EM4VGZPjAN
	KG868ZBClBBf2isV6AS8OgBIhrfjPH2y/tGMDYGTRClNkMvzcs/rtdYGaQ1CqQS0cmE7JlEUWhXdu
	ejWFXtt/e2z7XE0zShQm4qm6TNx+Mt5luRApbqB37/n/fz08YKRwhlVEoTRJBaW+O4bQoyVz/HfHZ
	xWW8wHfQ==;
Received: from ip6-localhost ([::1]:38970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qfQPw-002gmI-Tb; Sun, 10 Sep 2023 19:48:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qfQPq-002gm9-KB
 for samba-technical@lists.samba.org; Sun, 10 Sep 2023 19:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=MXBz3v09uGvtnipeD8dTEkqbc5J5rLu8toyy0GhVjBQ=; b=ZhATS0zflIqVw9z2iHjsiEnlZt
 HdCeAc36IVuhpmMnvrkzwpyhEbE7U0+I6IsstA0egcNsiBxRSV8PK/H04jfL11IunKDGBSf94ILlR
 BFmP9HcsXB/UyYd5tv+co5kxT398jPt913FjXgNnB0x3k23OTo2iZegrwnPc9dpsPLAH1Z0gkCN0Z
 zX8ctbSWlgVETXM76l8UcwrPmM+RcQ3m2LrDwSX9KGOa/b3X1A3qmn9YDvBFsodhrxVNgIW1IwdiE
 6adPsOuEtZfx2WR8hTC+/tk52Kh5ImQAMIR+/frSMlvwFjB8iPHMNXpn+VX+3TSOe0A8ChO9huo7j
 jj0J+cNaAyROH7uY5lGlYtLMI7d5K0weDp1uu8cYhc0mR9H0q/hasm0pyozQK/PsWDRIKzEMWCH1Y
 ODtyZcoHlKm4aQ7HAe4RCA7okt11GMbYP6pJgxsrRTzHlI+76A5ZGgByiVhniDxba6t97S15WeLV5
 ABxGqdWITymxxHdy2qsjYGPD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qfQPp-00CnjD-1Z; Sun, 10 Sep 2023 19:48:18 +0000
Message-ID: <fc386fdb62da5e1ff9f42b3a0d346a2dcdd1756d.camel@samba.org>
Subject: Re: two kerberos impls are used by samba now
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 11 Sep 2023 07:48:13 +1200
In-Reply-To: <41985a01-8374-8f1a-5762-ededced82831@tls.msk.ru>
References: <41985a01-8374-8f1a-5762-ededced82831@tls.msk.ru>
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

On Fri, 2023-09-08 at 22:04 +0300, Michael Tokarev via samba-technical
wrote:
> FWIW.
> Just noticed that all samba executables on debian (built withinternal
> heimdal) are linked with *two* sets of kerberos libs.
> This is due to libtirpc, which is a replacement for the formerin-
> glibc RPC code, which uses libgssapi-krb5.
> This should not be specific to debian but rather specific toglibc.
> Wonder how common symbols from two krb5 don't clash...

This is related to your other post, due to the symbol versions, as I
understand it :-)
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
