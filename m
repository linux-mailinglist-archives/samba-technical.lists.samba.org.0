Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B4304736
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 19:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ShEthM8EBWVIu536C/SLcbHwm5hTe9rmESRlRFgY4eE=; b=eHTvkRN/ewcffBzfFYe++iNeav
	hnys/C1ZbKitBkHOL57IYh3InkXJzzElrlysAg0MTy5dODxPXPaND1Pph5KD/F8ppQPbKfKi/hGY9
	tvsmTaAN0DL3/tZQSclq7f8Uyh7hT/FiUWj5IdM/3ixDCJ7b0TDSLqTKPrPHS18nQwcrjZAU8ei67
	QEBsIPJwYgmgBqLU0bEVT5OQyaj3RjgYwoOPTqchJ1SkCC0wFhgERMf0gN29240y+Wa5a5oUv34AB
	2eu+H3r0lSDSPQK2QRNuSBldzmaqtPoxSSwyaLM+ZauHquZXxwacd+gg7Aunm5+TS2puoFOBijMAz
	gxUSQ5pg==;
Received: from ip6-localhost ([::1]:46364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4TVU-007HTQ-2O; Tue, 26 Jan 2021 18:56:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4TVO-007HRr-R1
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 18:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ShEthM8EBWVIu536C/SLcbHwm5hTe9rmESRlRFgY4eE=; b=ko0bQJmhL7qWnLbcS2xOOjU+Qc
 kJUeUcWwI2U2lZX9wTV8pnP4oPKQaSblv38poC0gc3zp7wL73InXY13nQ1SUCjva6F8AztRZ06NxV
 daXOzf0Xg9CMr5isivr94lAqQCd+cZGYEQoSYkHC+8yEhgz46sLNKCe/16UmNnhHZqA+62kYKM5rX
 eR74v5x1gPHkkftpezTINIHVPlDAJBw+aE/NWs3MYtj3oRGnEFPLonYB4zK8Ma80TBOYTj+lkl25p
 q6Pfi4in4rWiYKS+VwCNKgey9QfCNvE/VfkHyleOVgHpUWUTyd5sHCyeTMwHcjrzlh6O+lIsWJo+i
 gsTu7+CtCoqWXuhYF6ksCJqkbC48F4aCh0UoGkCLIEznjR+paroH+5HhBtY5peZtLqwthHICAzjH7
 W5+l8eEeoQzifwBUJoU4ULDAmz7ZS/1gght8+iGupxLqA+4fNPTefZaVBfSL4BmStXXLPadk8d+Wq
 1FVSEHlFOTMuV61lWAq9vP8c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4TVO-0006Vf-0d; Tue, 26 Jan 2021 18:55:58 +0000
Date: Tue, 26 Jan 2021 19:55:56 +0100
To: "Christopher O Cowan - Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>
Subject: Re: Not sure how this slipped through
Message-ID: <20210126195556.2def02cb@samba.org>
In-Reply-To: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>, Jim McDonough <jmcd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 26 Jan 2021 18:15:48 +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:

> My builds on AIX have been failing because of this obvious error.  Can someone please apply it?

Looks good, thanks for the patch.
Reviewed-by: David Disseldorp <ddiss@samba.org>

@Jim: looks like you wrote this module ~15 years ago :). Can you review
and push?

> 
> Just wondering, are AIX builds still part of the CI/CD system?

I'm not aware of any AIX CI jobs.

Cheers, David

