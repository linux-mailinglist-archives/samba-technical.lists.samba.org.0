Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 635993D309
	for <lists+samba-technical@lfdr.de>; Tue, 11 Jun 2019 18:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uLCqF6Rarbu1jfXFEcIsXVwZoDw2ZPQJWsXyPm0ypPo=; b=J2wKUgc/MPqOO6Pin3aj7O6U65
	oX0L9fh+9pydpfgY+DuA+DgbbzeQkPrNBHiDKQEFPiQsQuK1icHkgfo/P2U0vPe2sHuzcl+sngV4l
	WQHQzL4DX3WTv6+4g15sVgBHRegu8g+oA6lP053SC77TV8xKTQW7OQspjdt3nhNnigPtJXexfSZG+
	En4xAJaGndY+lmIqtmnerSLUC+HptvTjI7s6FCOEL0SMT0+ty06vQboJFR2niN4bBKK0jlhvQmF7H
	+j8CsVWGxsLMVx4vJVk9XyzMvVLU46kaPXJvEwi8MQBGdJx7gO2pOfWsptfIbEOipE/x8M/je69Sx
	fB38T06Q==;
Received: from localhost ([::1]:49376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hak2g-00109p-LK; Tue, 11 Jun 2019 16:54:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hak2c-00109i-1B
 for samba-technical@lists.samba.org; Tue, 11 Jun 2019 16:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=uLCqF6Rarbu1jfXFEcIsXVwZoDw2ZPQJWsXyPm0ypPo=; b=UtJmGcgBhCfvT6IwKrhM/VUUmF
 5XPdnBDqX4SGfWq5sbY5O5iuSZXLuKGNtdGpDY6kciPuBl4t5AU5LMIMwHyvo+Xga+wqjGmVqelsV
 jLR7CORTsM3Tlw+JMW8RUhoL6ZuhUMBQ3y2Um+zQ7Ux9ZG2Dd9F7EEKGFeqyvBJu2zeI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hak2b-00025W-H3; Tue, 11 Jun 2019 16:54:33 +0000
Message-ID: <ef5ff8b529847298e54c5e6125e4dc42498231a4.camel@samba.org>
Subject: Re: Need the capture answer for samba wiki
To: David Mulder <dmulder@suse.com>, Rowland Penny
 <repenny241155@gmail.com>,  samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 11 Jun 2019 18:54:31 +0200
In-Reply-To: <68b2117f-0eab-05e5-7f1a-093a2b82f90c@suse.com>
References: <a3682a5f-d9e7-604b-3cd6-c8a460a4ad0c@suse.com>
 <1837bdc89794cc5b331c9d33e9d67280f26e4bf5.camel@samba.org>
 <54595bb8-e90b-8ffb-220e-63a074a83e6c@suse.com>
 <68b2117f-0eab-05e5-7f1a-093a2b82f90c@suse.com>
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

On Tue, 2019-06-11 at 10:41 -0600, David Mulder wrote:
> Anybody? I also can't add images without page add rights.

Try again now.  I've made Dmulder 'approved', which might help.

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




