Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15943130
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 22:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VuQibCyucE79mfPwPk6IgC0XCXMVElMRnxpz30bqy0E=; b=xBsf9ffU5mv1CFYxfwSNddCJfC
	QM16fFhKg4UYkNGy6rIyCL/F5imN5pOcRBv5Rx3aVv4/sbJxZfWWF2B/3dNgzmvFsmO9ARm1AOrLA
	J4mKkH9lWcXD6gY5W05xx+yFGJvGWVoozrHh1t7sKJ8ax7Vr4ic6JM4u7nxT1hPkfaILcD4tJUnmC
	1bQT/5wELrUCuh+fCK6TevpaYfogxWGJHsUJ+xdQUtiginJuPFmmKvTBDKVeUB8y6sGEyBAHtIXvz
	cLcmIBzo5Q87cRUGriPTWZx6UekgYoVV+4nJlULwEl14HlDaJpWYMVctViC+FrHtzbdTJXJzEhxKd
	0ckE7kLw==;
Received: from localhost ([::1]:64562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbAHq-001NIv-L9; Wed, 12 Jun 2019 20:56:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAHm-001NIo-RP
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 20:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=VuQibCyucE79mfPwPk6IgC0XCXMVElMRnxpz30bqy0E=; b=U3qyeJOTjC1cccNZoPagUQcPSI
 jE7zInY7TpwXJjAU3+Zb+IG+XB8GCfQwWEZ248YQ9JnhiYZ8hif4rDlc4oVXZy1/vIVhQsKBRBFvd
 USBHkfzhlrZmcHjfiP7J056q5JVRTXwtUdEGYP2wFePa98Onti76wdz7bx6mLtXtWqK0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAHl-0002YK-Kj; Wed, 12 Jun 2019 20:55:58 +0000
Message-ID: <788c2cbe86cdee5d70a2a5e1db34cb21bd86734f.camel@samba.org>
Subject: Re: [PATCH] wafsamba: Use native waf timer
To: Lukas Slebodnik <lslebodn@fedoraproject.org>, 
 samba-technical@lists.samba.org
Date: Wed, 12 Jun 2019 22:55:54 +0200
In-Reply-To: <20190612113125.GB8215@10.4.128.1>
References: <20190612113125.GB8215@10.4.128.1>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Wed, 2019-06-12 at 13:31 +0200, Lukas Slebodnik via samba-technical
wrote:
> ehlo,
> 
> it is another blocker to build samba with python 3.8

Can you (sorry) please file a bug (or re-use the existing one), add a
BUG: tag, push to GitLab and create a merge request please?

https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request

This way we can see that it passes a build before we start review.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




