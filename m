Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A4DFDE6
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 08:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OiW7T5WYoKtlEQgXiMBJWQbqsHc80lON5kLUUh7h6/s=; b=AudEabUD4K5PMgSYcSzkyw+AOr
	eCNzKB3XgY6U7IT0OlJSAFZpAZx2oV1ANS9E99HUWoHQKbwCBXvvQJUW7squIdFsIohOVRHSOMvCP
	1YRMpPU8TgJfSGU9PMxfoZ8zOhqC8Ph0G4Eo0+vXjm0U31znEVvO0QgeZNuSeKbXuIhdcqjTqSf5h
	o1TrKXtMw7gLtucefojzi9fYKvEZdCBwhKlK0o/VMrGHP8Ywgg8iD11cUNHH7ew+mXlbQqzYIm3DX
	v3aNH+Tf0+rGSvs575byZqvahQ2BLlVwkAzbcSd5aem35ZZwkFrDQIfwmv79AuLlaGVJoL1YufCZg
	TdV4Tflg==;
Received: from localhost ([::1]:30840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMo7E-001JAW-L4; Tue, 22 Oct 2019 06:58:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16758) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMo6z-001JAP-I2
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 06:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=OiW7T5WYoKtlEQgXiMBJWQbqsHc80lON5kLUUh7h6/s=; b=Zuo3HYmYxxsNZOowwxzmsuOnN2
 65VUCwQNwCFSeyL6QJF7vuMmKhxN1FBULxmO62vQqAND4WxhHTNTnOsyyQaAl3arwctcssWw9/QAP
 OlX71pSnqqqIqnRNtZoFYwsIcf5HPiys82lhDBI6VsdXRDsgVA+P6V+c+VE+EZ0D0seeTqjbcq0DN
 15ayzzb+VJQvQCUdQ7UskUxFMJquRXP0hQrlhuRCJS18IzCL0ekiA7pVe4vmvde60FAFZb43Dxo1J
 QOTmNTTne8b34WvKZVbrD1YKYW21dJ0E3NFiUDJ3m7WlMeBpq2IAUflpJOx5UO9hFaUizriWynRpT
 fiTlKQpG/FI0F1eyxLHqAJ1FA+RV58SyTtCTUjZ9Ly1R/ttQPsZT4T73F/c2fYpQcaJWCZsIu5+++
 joUwxkSZbVl9JxSwZMAigsVwsPNB3dzUBL7Kf9W5bUfpUNWsFqNP16HFJd0Z2Ii+7YNuxf/KOJWkF
 loOxv1MXhpsIoFiI3nPxlfBX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMo6y-0000ws-2e; Tue, 22 Oct 2019 06:57:44 +0000
To: samba-technical@lists.samba.org, Ralph Boehme <slow@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Date: Tue, 22 Oct 2019 08:57:42 +0200
Message-ID: <8323638.P3YhLeQRCy@magrathea>
In-Reply-To: <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
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
Cc: David Mulder <david.mulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 18 October 2019 14:00:53 CEST Ralph Boehme via samba-technical 
wrote:
> Hi Noel,

Hey Ralph and Noel,

> I don't think the additional work of letting the tests use a different
> testenv really helps. We'll just have to go through the knownfail list
> and look at each failing test to see what's needed to fix it.

Well SMB2 tests should not be run in the nt4_dc environment. That will go away 
at some point. It should either use fileserver or ad_dc (if krb5 is needed).


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



