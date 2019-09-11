Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE65DAFDD6
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2019 15:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=C4Uuk/Rc46agLK8Mgot7ASUHPAz7MeSAD4VAE88OBK8=; b=CL9mzaQkKFLdUm72qyRZj87bGd
	tVE3j4xqO3sltNjfekZ0I0heVrV7Fc4V+MInV6uncTChEADlvxwHRo/YyPhXYw2ZLI9iJHOPc7PVp
	RrY3yQZryZUhtf9+CCHeN3cPogeKKMQ8foOa5BbtvNjl78kXd0VSeimdh15O2uLdnxZkFFovThXbs
	9cbPEAkv8reyuglj4yMULiM3os9chv2BXGmLdu1vB5RQIYTa4xmB0QKqqEo5aFRm9cfmR/gOXbEJV
	OFfKX5dNw+XI2WnN+rdDHbb6Dp2BoW8OfFb/DHcP9qxR5ZkvWjYCC/lyTRZwLmQuISTBTw+yfKcUF
	LC61HfMQ==;
Received: from localhost ([::1]:41114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i82sm-004lIr-1c; Wed, 11 Sep 2019 13:42:04 +0000
Received: from smtp1.lauterbach.com ([62.154.241.196]:49907) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i82sh-004lIj-8X
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 13:42:01 +0000
Received: (qmail 20879 invoked by uid 484); 11 Sep 2019 13:15:15 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.11.10 by smtp1.lauterbach.com
 (envelope-from <Franz.Sirl-kernel@lauterbach.com>,
 uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.11.10):. 
 Processed in 0.16484 secs); 11 Sep 2019 13:15:15 -0000
Received: from unknown (HELO [10.2.11.10])
 (Authenticated_SSL:fsirl@[10.2.11.10])
 (envelope-sender <Franz.Sirl-kernel@lauterbach.com>)
 by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP
 for <samba-technical@lists.samba.org>; 11 Sep 2019 13:15:14 -0000
Subject: Re: [Announce] Samba 4.11.0rc4 Available for Download
To: kseeger@samba.org, samba-announce@lists.samba.org, samba@lists.samba.org, 
 samba-technical@lists.samba.org
References: <20190911065708.GA7868@carrie2>
Message-ID: <8eb21452-8d69-d9b6-1467-d663bc71cf6a@lauterbach.com>
Date: Wed, 11 Sep 2019 15:15:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190911065708.GA7868@carrie2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Franz Sirl via samba-technical <samba-technical@lists.samba.org>
Reply-To: Franz Sirl <Franz.Sirl-kernel@lauterbach.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 2019-09-11 um 08:57 schrieb Karolin Seeger via samba-technical:
> Release Announcements
> =====================
> 
> This is the fourth release candidate of Samba 4.11.  This is *not*
> intended for production environments and is designed for testing
> purposes only.  Please report any defects via the Samba bug reporting
> system at https://bugzilla.samba.org/.
> 
> Samba 4.11 will be the next version of the Samba suite.

Hi,

just noting that 4.11 will already be the third major release without a 
fix for the https://bugzilla.samba.org/show_bug.cgi?id=13745 regression.

Can someone at least comment on the bug so I can work on a patch and 
make PDF printing shares (via smbprngenpdf) functional again? Just 
moving the new %j/%J to %k/%K would be enough to fix the bug.

Franz

