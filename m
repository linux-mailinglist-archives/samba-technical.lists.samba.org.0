Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 480037CC52
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 20:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=F3Ards7NoFM1mMrZ+gKI/CVtn325ieJWGN9DA73KOPE=; b=guR+MH9EWP0XYyhUyRk9NHwBD4
	1rmQUSohcLsHIKllwVYfAbGVzSMa/LC/SKZK6TR7bFPIM3hRFDI54xY4M9RYHF8e4WxE8HOH3XfnD
	O1ea56Y2AZkvvyOaPPghBLAOR6g7jGDlfP9D2W9qRdM/o26rVImr0diBQ3oFIXc/ufkaHjasRl8k7
	tlw/jH0pjfQKtbJAnTOA9eUp0oJuW+vjMn3wSGMWbfnH73xSNqxnYNJvZjeUKiXmyzas1PUn5YK/1
	JA1b8uGjfK2/0DFYy9/JIZJfa8Rw/2hT5LtjowOoKSROxRcx6qiYaZg0wtlReNNzy/tKOk2XVimhE
	LL+9gB0Q==;
Received: from localhost ([::1]:37138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hstia-001bPj-RI; Wed, 31 Jul 2019 18:52:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21122) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstiW-001bPc-G2
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 18:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=F3Ards7NoFM1mMrZ+gKI/CVtn325ieJWGN9DA73KOPE=; b=ZHWPjBoCz21wRADOlVwrK5ypNX
 3EQEwoxtSsFvkCRoNvXzNyIrv5N4I0fasLkwl7mHJ39aQs7Giv6bLCYKo+/dGcyOc1hOgScp0ba+2
 zWuDodwn1OL9HmwL1v4OrvSz0OqhVdKmw28dPBPUcyFiIKto7DZjoJXP7S+h+gvLyMXg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstiV-0003sr-Ni; Wed, 31 Jul 2019 18:52:52 +0000
Message-ID: <50e79d318a2d0ec571b20153a7a69b3083e5dd5f.camel@samba.org>
Subject: Re: Samba.org GUI page
To: David Mulder <dmulder@suse.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Thu, 01 Aug 2019 06:52:48 +1200
In-Reply-To: <2691e0ab-7c21-c9c2-be47-58e8a869b6c8@suse.com>
References: <2691e0ab-7c21-c9c2-be47-58e8a869b6c8@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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

On Wed, 2019-07-31 at 17:26 +0000, David Mulder via samba-technical
wrote:
> Could somebody add my admin-tools package to https://www.samba.org/samba/GUI ? I'm not sure who manages the site.
> 
> Download URL is https://download.opensuse.org/repositories/home:/dmulder:/YaST:/AppImage/AppImage/admin-tools-latest-x86_64.AppImage

It is just pure HTML in the samba-web repo.  Direct push to master
changes the website after a few mins.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



