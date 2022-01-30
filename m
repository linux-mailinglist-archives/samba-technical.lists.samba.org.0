Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CE4A34FD
	for <lists+samba-technical@lfdr.de>; Sun, 30 Jan 2022 08:49:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=TYPjwsJmp+byF0M75BJwMZWS5SK0X9TAZcb3NNvCiQs=; b=LHkXfeyJYN58o681Wb2LnBzp1+
	RzWPis6egCzBfHlwq2qtzh3WwSN5Qc3DucVRXahv1msK9YKjjOQt3S9OJocYxBkFU0+Ftprj5dDGz
	UrI8/JQHc4wHpg4XCDKMfzzYU3Jkc6FGGQwXFGxamYrjt42QF2bM/DrWHRRFOfdBGxdVNot3R9k6b
	G9xiv9afKLNlkK0wawg2zXhAp2aFw6GwIm0tdco88FlaFIaAYDpsJ2SluyehzsZyj7jKFbmGTdWt+
	sxjPuQQDnHt4kHj9puc+bf5j7StEp3pe00cmIACZt6Q9X7+XdkFVZOsQwGF9db8efbMcU4XyclJ4q
	VbsfQdrg==;
Received: from ip6-localhost ([::1]:32256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nE4wS-002Sbg-Dj; Sun, 30 Jan 2022 07:48:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48494) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nE4wH-002SbX-4Q
 for samba-technical@lists.samba.org; Sun, 30 Jan 2022 07:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=TYPjwsJmp+byF0M75BJwMZWS5SK0X9TAZcb3NNvCiQs=; b=coyThHsjfQuMtOmpBfkAuy6ESM
 dkRhngt0wXRFwtAwYpeujirvsuAcZY8YZVNee6+8TWc6Go1aCl1YfC2Xyhba2z8eunWpOzIyK+2y/
 YhQuIGKEd5IIoEa2HxMZovscUSeRP4eH8fWIvxygPjz3Powl4iVvKf3xbj3IWf5q5YFunzmAOmg81
 iysCJL+842Um5jGZ49gHEFKxnrQRJJRihLv4g0OnAGkwPPoAYChLocUz5z/wrKu8v24pC3uw+qbkE
 UEz0dTqF4AX+A/jg+16qf2jr9vt/njVaThNSyHRNONPz7ioQPvvcohhG+GmXTeGbE6jDdqQFsleWt
 iaQMyWyUI/ZQnJDWajFNlcWfPhRZqpLwnDm0SsrpYYJFpbf432Up9huhauC/pE3m1AA7LMlXsOHRR
 1kUXx/hO7L3osWM0/7QHOFg+xV4uBZ5HF11tMOX91YUnaSlw9MjDaghkQMNJhI2ugAceNMUrInHLG
 0iAtbdSIPjkBSGSDal62r+JX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nE4wD-001Ltz-TX; Sun, 30 Jan 2022 07:47:54 +0000
Message-ID: <d235f497057f4188e9ea447477c32e6e0d66469e.camel@samba.org>
Subject: Re: Microsoft Enforcement Mode
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
Date: Sun, 30 Jan 2022 20:47:50 +1300
In-Reply-To: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
References: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
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
Cc: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-01-29 at 11:41 +0100, Stefan Kania via samba-technical
wrote:
> I just read, that Microsoft uses a new Enforcement Mode on all MS DCs to
> protect the DC against CVE-2021-42287 and CVE-2021-42278. The
> Enforcement Mode can be deactivated until June, then MS will force it on
> all DCs.
> But with this mode active it's no longer possible to join a Linux-Client
> to a MS-Domain. I could not find out if this will affect Samba or only
> SSSD. If it affect Samba will it affect all Samba-version?

This isn't something that I expected to fail/change based on the
intensive discussions I had with Microsoft during development, so I
think this is an unintentional regression. 

David Mulder is chasing this down via the protocols team.

Samba sets passwords via LDAP typically during the join, so isn't as
impacted compared with the tools around sssd (adcli), as I understand
it. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


