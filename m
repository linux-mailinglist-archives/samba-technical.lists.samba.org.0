Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E817A005
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 07:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=G6stDqQiINXrVHfHMREwi9WnEic7+bG5kQR7o004cOE=; b=y+Zo+rF5puGpU8qEKIUvhVtXPI
	Qn4l/tgHhlC3o1gSeLOGtQb+KJ2i9xpuHMJYXZ/b+n/XsPDVu3YsafSrxE45ychbV19mJdXdTi3Hx
	sBsc0xH8z8fAmF1C14tDoUYhz8GOU2MtIcCLi1Sc1H2/k155pqNcVtu8LueNfQvIUVnSNs8iDKh/2
	zw3hajgIKHC708yYyxu4KZ0rXFSA92BGBAe066Rqj59ZdssAGGapeS25MdwGJ479Y1KdZxTssATxc
	dDdwGy4H0PZouF5v+X9nCZ/ms+WICWDHC1q5MjpjTGdztyHBp190Iyf3Ugn03moW3KrIN8SUmK0WZ
	eJY0+kIw==;
Received: from localhost ([::1]:20204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9k61-00F0TC-6J; Thu, 05 Mar 2020 06:35:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9k5i-00F0T5-56
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 06:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=G6stDqQiINXrVHfHMREwi9WnEic7+bG5kQR7o004cOE=; b=a3pWwfPxVW9jNpBHvZzatqRFgV
 BGp+3CKPQRxKGYVpO341PdJ9ym+Be9JMQx5nUjaeXSkJnHXJ23ojWxAESI8/EPu48Y/aOwNDyMSiR
 R07CQ2EyeyBoxO/TPsBbztHnARYFX7tBC/FcGDDEa5cMyWmfG47qUhQCoKi8ZIeXIDvyMK6Ex0Ow5
 FCwWbyRkLoYlfxgQ4tFB0uMFgZ1nKNZjMv344Rg0wQtzV1N1tfk4U/+L3L8x7SwConP4uNkIXDPGr
 SDzk++pVEfdj9yz+7WIC7l4fkyBvtqrR7SjKRZlu5wJn+rk7LORGpOUM3aNRwliO8qqBFinQFl7eb
 0k9j9dfsJfGrOD/4z4HN39uI0KkpMGm+RUK/C73DRRoiCZMVU6Z/bG/u8gpOi/KfPQvhp2J/BrYU9
 WlH9UHzD9CxTD4+96qFm9tgEqNYjZtXWVIRH/yIcGbSFnxMKqmLlmJ2ExedzKB09hcU7OgbX45FB/
 1iEqGOQAjh+wu9Ff6gnUEySU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9k5g-00084n-6y; Thu, 05 Mar 2020 06:34:40 +0000
Message-ID: <bcca2904922f9c6f0a3594c39a336f0ab175c4e8.camel@samba.org>
Subject: Re: [Announce] Samba 4.12.0 Available for Download
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>, 
 samba-technical@lists.samba.org
Date: Thu, 05 Mar 2020 19:34:36 +1300
In-Reply-To: <F5AB518A-4210-4A4F-B6E7-3FED4A78F7E6@rosalinux.ru>
References: <20200303104715.GA11956@carrie2>
 <F5AB518A-4210-4A4F-B6E7-3FED4A78F7E6@rosalinux.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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

On Thu, 2020-03-05 at 08:13 +0300, Mikhail Novosyolov via samba-
technical wrote:
> Hello,
> 
> What is the status of SMBv1 in Samba 4.12?

Unchanged from Samba 4.11, that is off by default but fully supported.

We are still planning to remove SMB1 in a future version because not
only is is an old arcane protocol, it makes being a great SMB2 server
harder.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



