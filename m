Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B6387D0D
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 18:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=o8s/OKNzs9uq60xDLbeIW8hSPbFf0/pIxFa1G0RGBJQ=; b=vax2XmldVc5u0/QqUiKCg+W+vy
	JMod3fmB+N0AJPHtzNXdyzmaHPHLBeaG8MPPbE8cXhiQx77AYVjEhaO5EetLFgCEafNBBoU7S7VtO
	B/eYv5Lip/JsAligKIRSdFBFrscASVP6489bBiDEwb5mQbjxRcjKgZHKfN4UufCMAbZdBEKLqFv6s
	yODTy5mrk3HF4eJrNIEthAuWVMvbndHQuXo48Cu6668C48QHeaYimRnFLbt20UmsvHO+PpwrX2AXH
	YUwCjCk0aa2xgr/5ajWjDcLjJfr78059coSv5q1uYENDNV9ktM5giuUhvnezqhQI0y0zY9V/0NIfO
	Ib9sYA1A==;
Received: from ip6-localhost ([::1]:49400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lj2BI-001UY9-0T; Tue, 18 May 2021 16:02:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj2BC-001UXz-7K
 for samba-technical@lists.samba.org; Tue, 18 May 2021 16:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=o8s/OKNzs9uq60xDLbeIW8hSPbFf0/pIxFa1G0RGBJQ=; b=F3ooR7UY4UbjlyMn3uj0xJLhgI
 D/uvW3xQe2nlpFtwcHEIQ0MvBp5crmoGur035n5+2daAileSVO/DPpL+g+Ih7CHhjDB4nEDjkBqhd
 P6p7/xXkqD4lFnov3md67neFugGtlPpKu/E+qtNz0YNbErGsuFuA6zUyrrI9ZRSGh484JFRwf0Tzs
 T4vywWFvZea6Cnt2bMXmg+Cj5bZcKb00P5R+RyrIZmfNtspN+GIa/hk0C+uqmotA2KGNz2mYWOqyG
 L9KNbP+kPu9Gj7kGTcP6Jg9cCiepBBxZQVx7kpPopCGcXhvtJCrtcp/cUBpoqLmwXUA62hBtjUzxp
 op+DSKkBRTkBk6wlu8xoOvuPr7+6ORFm/o9EyLBi0t+C68hpxvnFssDl3ngkdgKxrsEXmxaygN3KQ
 ibOyc57nSezmuMWmO7v25KQt/tk7BvlW8q3s/Kng9WJtJH5wbdkfCSuv0hVA46Xtk8bu+RrbpocZO
 qbHMaVEKJFiFodFtwIuxwX0Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj2B9-0006QU-EJ; Tue, 18 May 2021 16:02:43 +0000
To: samba-technical@lists.samba.org
Subject: Re: Offline logon flapping in autobuild?
Date: Tue, 18 May 2021 18:02:41 +0200
Message-ID: <4972011.ALVdVshByh@magrathea>
In-Reply-To: <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
 <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 18 May 2021 12:45:43 CEST Andrew Bartlett via samba-technical 
wrote:
> Thanks.  It happens pretty reliably for me trying to push to autobuild,
> but never if I do a job with --tail --nocleanup to actually look for
> the issue. :-(

This is the error I get:

[977(6379)/2694 at 57m53s] idmap.ad(ad_member_idmap_ad)                                                                                                                                      
failed to call wbcGidToSid: WBC_ERR_DOMAIN_NOT_FOUND                                                                                                                                         
Could not convert gid 2000002 to sid                                                                                                                                                         
wbinfo returned: "", expecting "S-1-5-21-480866085-778340076-1131398019-512"                                                                                                                 
UNEXPECTED(failure): idmap.ad.Test gid lookup of Domain 
Admins(ad_member_idmap_ad)

The strange thing is that the wbinfo commands before succeeded. I will add 
more debug output and extend the test.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



