Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC710BF3
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 19:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=46Vt22qBk4eMOOxPQY5Pu+Sxe2SIIh5OaLOpW1XsAmk=; b=kTUhTOGYfvDJboI7j8URTLvqhe
	v8CqXk9PLqvNAPhTkS9aK+owgFRFJnKqvjOxzOsAijB+XniBwVx6ufYVoDqJw1ALRB5jK8LBJZBdz
	cx7tXwgr3GYOXRJRFKFzWqPXqx/o7Vfc55sq7FIOsoZssuWHfavAg47gaPtswcLJH534iRprYscgg
	KlLHlHa9WecdHp2+Kko6LElXr/6YTLJEcuagTcusUvBG8RFl3d+HMHLj5oUWCUuKiM1hbPWru2v/x
	95brd8VRowSEY8hBOvQslpUMgA+SPuyppmpZDt1wdXLottLfC512nEQZbmaBTKlelsrt7BEViRd0t
	lFqd++7Q==;
Received: from localhost ([::1]:44878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLsw2-001sqH-Hv; Wed, 01 May 2019 17:22:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:43346) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLsvs-001sq9-G0
 for samba-technical@lists.samba.org; Wed, 01 May 2019 17:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=46Vt22qBk4eMOOxPQY5Pu+Sxe2SIIh5OaLOpW1XsAmk=; b=WHMFwU8fLJH32p17DkSHsCfawI
 aEoi24X6PINA2CA3ye+zsa+CQ0L2flGSregtzl8NXYNYD2CPzMT7nhRsg3Mo33Wd2t8kDNpMBhQou
 HcFEvCeZaUJNqGJTyYadMx/6LvbIaHQrOOMXF35UflSxl8nrkHJ/T92n2FWsYVHiTsb8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLsvp-0006GT-If; Wed, 01 May 2019 17:22:09 +0000
Date: Wed, 1 May 2019 10:22:06 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: smbd: implement SMB_FILE_NORMALIZED_NAME_INFORMATION handling
Message-ID: <20190501172206.GC229765@jra4>
References: <c1c3c497-fe35-000a-00eb-0cd653e25716@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1c3c497-fe35-000a-00eb-0cd653e25716@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 01:25:34PM +0200, Stefan Metzmacher via samba-technical wrote:
> Hi,
> 
> I just created https://gitlab.com/samba-team/samba/merge_requests/400
> with the patches to implement SMB_FILE_NORMALIZED_NAME_INFORMATION.
> 
> Windows 10 (1803 and higher) support and use
> SMB_FILE_NORMALIZED_NAME_INFORMATION
> calls over the network. As a fallback (in case the server don't support
> it) the client traverses all path components, which is very expensive.
> 
> Implementing SMB_FILE_NORMALIZED_NAME_INFORMATION is very cheap for us
> as the open already went through unix_convert() and we have the
> information the client is asking for.
> 
> See also https://bugzilla.samba.org/show_bug.cgi?id=13919
> 
> Please review and push:-)

RB+ and pushed. Thanks Metze, great work !

